import 'dart:math';

import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_models.dart';

/// Правила игровой сессии по «Книге игрока» 5e. Повторяют SessionRules сервера:
/// приложение считает итог сразу, даже без связи, а сервер потом применяет то же
/// действие. Совпадение проверяется общим набором примеров
/// (test/fixtures/session-rules-cases.json).
abstract final class SessionRules {
  static const maxAmount = 9999;
  static const maxExhaustion = 6;

  /// Максимум хитов с учётом истощения: с 4-го уровня он вдвое меньше
  static int maxHp(SessionContext context, int exhaustion) =>
      exhaustion >= 4 ? max(1, context.baseMaxHp ~/ 2) : context.baseMaxHp;

  /// Начальное состояние: полные хиты
  static SessionState fresh(SessionContext context) =>
      SessionState(currentHp: context.baseMaxHp);

  /// Свободные кости хитов
  static int hitDiceLeft(SessionContext context, SessionState state) =>
      max(0, context.level - state.hitDiceSpent);

  static SessionResult apply(
    SessionContext context,
    SessionState state,
    SessionAction action,
  ) {
    if (state.isDead &&
        action is! SetHpAction &&
        action is! SetConditionAction &&
        action is! SetExhaustionAction) {
      throw const SessionRulesException(
        'Action',
        'Персонаж погиб. Верните ему хиты вручную, если его воскресили',
      );
    }

    return switch (action) {
      DamageAction() => _damage(context, state, action),
      HealAction() => _heal(context, state, action),
      TempHpAction() => _tempHp(state, action),
      SetHpAction() => _setHp(context, state, action),
      DeathSaveAction() => _deathSave(state, action),
      StabilizeAction() => _stabilize(state),
      SpendHitDieAction() => _spendHitDie(context, state, action),
      LongRestAction() => _longRest(context, state),
      SetConditionAction() => _setCondition(state, action),
      SetExhaustionAction() => _setExhaustion(context, state, action),
    };
  }

  static SessionResult _damage(
    SessionContext context,
    SessionState state,
    DamageAction action,
  ) {
    _checkAmount(action.amount);
    final maxHp = SessionRules.maxHp(context, state.exhaustion);
    final absorbed = min(state.tempHp, action.amount);
    final rest = action.amount - absorbed;
    var next = state.copyWith(tempHp: state.tempHp - absorbed);
    final outcomes = <SessionOutcome>[];

    if (state.currentHp == 0) {
      // Урон по лежащему: провал спасброска, критический удар — два
      if (rest >= maxHp) {
        next = _dead(next);
        outcomes.addAll([SessionOutcome.instantDeath, SessionOutcome.died]);
      } else if (rest > 0) {
        next = next.copyWith(
          isStable: false,
          deathFailures:
              min(3, state.deathFailures + (action.critical ? 2 : 1)),
        );
        outcomes.add(SessionOutcome.deathSaveFailure);
        if (next.deathFailures >= 3) {
          next = _dead(next);
          outcomes.add(SessionOutcome.died);
        }
      }
    } else if (rest >= state.currentHp) {
      // Остаток урона после 0 не меньше максимума — мгновенная смерть
      final overflow = rest - state.currentHp;
      next = next.copyWith(
        currentHp: 0,
        isStable: false,
        deathSuccesses: 0,
        deathFailures: 0,
      );
      if (overflow >= maxHp) {
        next = _dead(next);
        outcomes.addAll([SessionOutcome.instantDeath, SessionOutcome.died]);
      } else {
        outcomes.add(SessionOutcome.knockedOut);
      }
    } else {
      next = next.copyWith(currentHp: state.currentHp - rest);
    }

    return SessionResult(next, state, outcomes, absorbed: absorbed);
  }

  static SessionResult _heal(
    SessionContext context,
    SessionState state,
    HealAction action,
  ) {
    _checkAmount(action.amount);
    final hp =
        min(maxHp(context, state.exhaustion), state.currentHp + action.amount);
    var next = state.copyWith(currentHp: hp);
    final outcomes = <SessionOutcome>[];

    if (state.currentHp == 0 && hp > 0) {
      next = _clearDeathSaves(next);
      outcomes.add(SessionOutcome.revived);
    }

    return SessionResult(next, state, outcomes, healed: hp - state.currentHp);
  }

  /// Временные хиты не складываются: остаётся большее значение
  static SessionResult _tempHp(SessionState state, TempHpAction action) {
    _checkAmount(action.amount);
    return SessionResult(
      state.copyWith(tempHp: max(state.tempHp, action.amount)),
      state,
      const [],
    );
  }

  static SessionResult _setHp(
    SessionContext context,
    SessionState state,
    SetHpAction action,
  ) {
    final maxHp = SessionRules.maxHp(context, state.exhaustion);
    if (action.amount < 0 || action.amount > maxHp) {
      throw SessionRulesException('Amount', 'Хиты должны быть от 0 до $maxHp');
    }

    var next = state.copyWith(currentHp: action.amount);
    final outcomes = <SessionOutcome>[];

    if (state.isDead) {
      if (action.amount == 0) {
        throw const SessionRulesException(
          'Amount',
          'Чтобы воскресить персонажа, верните ему хотя бы 1 хит',
        );
      }
      next = _clearDeathSaves(next).copyWith(
        isDead: false,
        exhaustion: min(state.exhaustion, maxExhaustion - 1),
      );
      outcomes.add(SessionOutcome.resurrected);
    } else if (state.currentHp == 0 && action.amount > 0) {
      next = _clearDeathSaves(next);
      outcomes.add(SessionOutcome.revived);
    } else if (state.currentHp > 0 && action.amount == 0) {
      next = _clearDeathSaves(next);
      outcomes.add(SessionOutcome.knockedOut);
    }

    return SessionResult(next, state, outcomes);
  }

  static SessionResult _deathSave(SessionState state, DeathSaveAction action) {
    if (!state.isDying) {
      throw const SessionRulesException(
        'Action',
        'Спасброски от смерти делают при 0 хитов, пока персонаж не стабилен',
      );
    }

    _checkRoll(action.roll, 20);
    final outcomes = <SessionOutcome>[];
    SessionState next;

    if (action.roll == 20) {
      // Встаёт с 1 хитом
      next = _clearDeathSaves(state).copyWith(currentHp: 1);
      outcomes.addAll([SessionOutcome.naturalTwenty, SessionOutcome.revived]);
    } else if (action.roll >= 10) {
      next = state.copyWith(deathSuccesses: state.deathSuccesses + 1);
      outcomes.add(SessionOutcome.deathSaveSuccess);
      if (next.deathSuccesses >= 3) {
        next = _clearDeathSaves(next).copyWith(isStable: true);
        outcomes.add(SessionOutcome.stabilized);
      }
    } else {
      final failures = action.roll == 1 ? 2 : 1;
      next = state.copyWith(
        deathFailures: min(3, state.deathFailures + failures),
      );
      outcomes.add(SessionOutcome.deathSaveFailure);
      if (action.roll == 1) outcomes.add(SessionOutcome.naturalOne);
      if (next.deathFailures >= 3) {
        next = _dead(next);
        outcomes.add(SessionOutcome.died);
      }
    }

    return SessionResult(next, state, outcomes);
  }

  static SessionResult _stabilize(SessionState state) {
    if (!state.isDying) {
      throw const SessionRulesException(
        'Action',
        'Стабилизировать можно только умирающего персонажа',
      );
    }

    return SessionResult(
      _clearDeathSaves(state).copyWith(isStable: true),
      state,
      const [SessionOutcome.stabilized],
    );
  }

  static SessionResult _spendHitDie(
    SessionContext context,
    SessionState state,
    SpendHitDieAction action,
  ) {
    if (state.currentHp == 0) {
      throw const SessionRulesException(
        'Action',
        'Кости хитов нельзя тратить без сознания',
      );
    }
    if (state.hitDiceSpent >= context.level) {
      throw const SessionRulesException(
        'Action',
        'Свободных костей хитов не осталось',
      );
    }

    _checkRoll(action.roll, context.hitDie);
    final hp = min<int>(
      maxHp(context, state.exhaustion),
      state.currentHp + max<int>(0, action.roll + context.conModifier),
    );

    return SessionResult(
      state.copyWith(currentHp: hp, hitDiceSpent: state.hitDiceSpent + 1),
      state,
      const [],
      healed: hp - state.currentHp,
    );
  }

  static SessionResult _longRest(SessionContext context, SessionState state) {
    if (state.currentHp == 0) {
      throw const SessionRulesException(
        'Action',
        'Для длинного отдыха нужен хотя бы 1 хит',
      );
    }

    final exhaustion = max(0, state.exhaustion - 1);
    final maxHp = SessionRules.maxHp(context, exhaustion);
    final regained = max(1, context.level ~/ 2);
    final next = _clearDeathSaves(state).copyWith(
      currentHp: maxHp,
      tempHp: 0,
      hitDiceSpent: max(0, state.hitDiceSpent - regained),
      exhaustion: exhaustion,
    );

    return SessionResult(
      next,
      state,
      const [],
      healed: max(0, maxHp - state.currentHp),
    );
  }

  static SessionResult _setCondition(
    SessionState state,
    SetConditionAction action,
  ) {
    final conditions =
        state.conditions.where((c) => c != action.condition).toList();
    if (action.active) conditions.add(action.condition);
    conditions.sort((a, b) => a.jsonValue.compareTo(b.jsonValue));

    return SessionResult(
        state.copyWith(conditions: conditions), state, const []);
  }

  static SessionResult _setExhaustion(
    SessionContext context,
    SessionState state,
    SetExhaustionAction action,
  ) {
    if (action.level < 0 || action.level > maxExhaustion) {
      throw const SessionRulesException(
        'Level',
        'Истощение должно быть от 0 до $maxExhaustion',
      );
    }

    var next = state.copyWith(
      exhaustion: action.level,
      currentHp: min(state.currentHp, maxHp(context, action.level)),
    );
    final outcomes = <SessionOutcome>[];

    if (action.level == maxExhaustion && !state.isDead) {
      next = _dead(next);
      outcomes.add(SessionOutcome.died);
    }

    return SessionResult(next, state, outcomes);
  }

  static SessionState _dead(SessionState state) => state.copyWith(
        isDead: true,
        isStable: false,
        currentHp: 0,
        deathSuccesses: 0,
        deathFailures: 0,
      );

  static SessionState _clearDeathSaves(SessionState state) =>
      state.copyWith(deathSuccesses: 0, deathFailures: 0, isStable: false);

  static void _checkAmount(int amount) {
    if (amount < 0 || amount > maxAmount) {
      throw const SessionRulesException(
        'Amount',
        'Значение должно быть от 0 до $maxAmount',
      );
    }
  }

  static void _checkRoll(int roll, int faces) {
    if (roll < 1 || roll > faces) {
      throw SessionRulesException('Roll', 'На к$faces выпадает от 1 до $faces');
    }
  }
}
