import 'package:dnd_app/application/session/models/session_models.dart';

/// Действие игрока в сессии. [toJson] даёт тело запроса без id и времени.
sealed class SessionAction {
  const SessionAction();

  String get type;

  Map<String, dynamic> toJson() => {'type': type};

  static SessionAction fromJson(Map<String, dynamic> json) {
    int value(String key) => (json[key] as num).toInt();

    return switch (json['type']) {
      'damage' =>
        DamageAction(value('amount'), critical: json['critical'] == true),
      'heal' => HealAction(value('amount')),
      'tempHp' => TempHpAction(value('amount')),
      'setHp' => SetHpAction(value('amount')),
      'deathSave' => DeathSaveAction(value('roll')),
      'stabilize' => const StabilizeAction(),
      'spendHitDie' => SpendHitDieAction(value('roll')),
      'longRest' => const LongRestAction(),
      'setCondition' => SetConditionAction(
          Condition.fromJson(value('condition')) ??
              (throw const SessionRulesException(
                  'Condition', 'Неизвестное состояние')),
          active: json['active'] == true,
        ),
      'setExhaustion' => SetExhaustionAction(value('level')),
      final type => throw ArgumentError('Неизвестное действие $type'),
    };
  }
}

class DamageAction extends SessionAction {
  final int amount;
  final bool critical;

  const DamageAction(this.amount, {this.critical = false});

  @override
  String get type => 'damage';

  @override
  Map<String, dynamic> toJson() =>
      {...super.toJson(), 'amount': amount, 'critical': critical};
}

class HealAction extends SessionAction {
  final int amount;

  const HealAction(this.amount);

  @override
  String get type => 'heal';

  @override
  Map<String, dynamic> toJson() => {...super.toJson(), 'amount': amount};
}

class TempHpAction extends SessionAction {
  final int amount;

  const TempHpAction(this.amount);

  @override
  String get type => 'tempHp';

  @override
  Map<String, dynamic> toJson() => {...super.toJson(), 'amount': amount};
}

/// Поставить хиты вручную. Хиты выше 0 у погибшего — воскрешение
class SetHpAction extends SessionAction {
  final int amount;

  const SetHpAction(this.amount);

  @override
  String get type => 'setHp';

  @override
  Map<String, dynamic> toJson() => {...super.toJson(), 'amount': amount};
}

class DeathSaveAction extends SessionAction {
  final int roll;

  const DeathSaveAction(this.roll);

  @override
  String get type => 'deathSave';

  @override
  Map<String, dynamic> toJson() => {...super.toJson(), 'roll': roll};
}

class StabilizeAction extends SessionAction {
  const StabilizeAction();

  @override
  String get type => 'stabilize';
}

/// Потратить кость хитов на коротком отдыхе
class SpendHitDieAction extends SessionAction {
  final int roll;

  const SpendHitDieAction(this.roll);

  @override
  String get type => 'spendHitDie';

  @override
  Map<String, dynamic> toJson() => {...super.toJson(), 'roll': roll};
}

class LongRestAction extends SessionAction {
  const LongRestAction();

  @override
  String get type => 'longRest';
}

class SetConditionAction extends SessionAction {
  final Condition condition;
  final bool active;

  const SetConditionAction(this.condition, {required this.active});

  @override
  String get type => 'setCondition';

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'condition': condition.jsonValue,
        'active': active,
      };
}

class SetExhaustionAction extends SessionAction {
  final int level;

  const SetExhaustionAction(this.level);

  @override
  String get type => 'setExhaustion';

  @override
  Map<String, dynamic> toJson() => {...super.toJson(), 'level': level};
}
