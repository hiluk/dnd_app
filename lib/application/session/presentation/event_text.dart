import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_event.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:flutter/material.dart';

/// Как показать запись журнала: значок, заголовок и подробности
({IconData icon, String title, String details}) describeEvent(SessionEvent e) {
  final hp = '${e.before.currentHp} → ${e.after.currentHp}';
  final outcomes = e.outcomes.map(_outcome).whereType<String>().join('. ');
  String details(String base) {
    final text = [base, outcomes].where((s) => s.isNotEmpty).join('. ');
    return text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);
  }

  return switch (e.action) {
    DamageAction(:final amount, :final critical) => (
        icon: Icons.local_fire_department_outlined,
        title: 'Урон $amount${critical ? ', критический' : ''}',
        details: details([
          if (e.absorbed > 0) 'Временные хиты −${e.absorbed}',
          'хиты $hp',
        ].join(', ')),
      ),
    HealAction(:final amount) => (
        icon: Icons.favorite_border,
        title: 'Лечение $amount',
        details: details('Хиты $hp'),
      ),
    TempHpAction(:final amount) => (
        icon: Icons.shield_outlined,
        title: 'Временные хиты $amount',
        details: 'Было ${e.before.tempHp}, стало ${e.after.tempHp}',
      ),
    SetHpAction() => (
        icon: Icons.edit_outlined,
        title: 'Хиты изменены вручную',
        details: details('Хиты $hp'),
      ),
    DeathSaveAction(:final roll) => (
        icon: Icons.casino_outlined,
        title: 'Спасбросок от смерти: $roll',
        details: details(
          'Успехи ${e.after.deathSuccesses}, провалы ${e.after.deathFailures}',
        ),
      ),
    StabilizeAction() => (
        icon: Icons.healing_outlined,
        title: 'Стабилизирован',
        details: 'Спасброски больше не нужны',
      ),
    SpendHitDieAction(:final roll) => (
        icon: Icons.bedtime_outlined,
        title: 'Кость хитов: $roll',
        details: '+${e.healed} хитов, хиты $hp',
      ),
    LongRestAction() => (
        icon: Icons.nights_stay_outlined,
        title: 'Длинный отдых',
        details: 'Хиты $hp, кости хитов ${e.before.hitDiceSpent} → '
            '${e.after.hitDiceSpent} потрачено, истощение ${e.after.exhaustion}',
      ),
    SetConditionAction(:final condition, :final active) => (
        icon: Icons.label_outline,
        title:
            '${active ? 'Состояние' : 'Снято состояние'}: ${condition.title}',
        details: '',
      ),
    SetExhaustionAction(:final level) => (
        icon: Icons.hourglass_bottom,
        title: 'Истощение $level',
        details: details(exhaustionEffects[level]),
      ),
  };
}

String? _outcome(SessionOutcome outcome) => switch (outcome) {
      SessionOutcome.knockedOut => 'Без сознания',
      SessionOutcome.instantDeath => 'Мгновенная смерть',
      SessionOutcome.died => 'Персонаж погиб',
      SessionOutcome.revived => 'Пришёл в сознание',
      SessionOutcome.stabilized => 'Стабилен',
      SessionOutcome.naturalTwenty => 'Двадцать: встаёт с 1 хитом',
      SessionOutcome.naturalOne => 'Единица: два провала',
      SessionOutcome.resurrected => 'Воскрешён',
      SessionOutcome.deathSaveSuccess ||
      SessionOutcome.deathSaveFailure =>
        null,
    };

/// «сейчас», «5 мин», «2 ч», дальше — дата
String relativeTime(DateTime time, [DateTime? now]) {
  final diff = (now ?? DateTime.now()).difference(time.toLocal());
  if (diff.inMinutes < 1) return 'сейчас';
  if (diff.inHours < 1) return '${diff.inMinutes} мин';
  if (diff.inDays < 1) return '${diff.inHours} ч';
  final t = time.toLocal();
  String two(int v) => v.toString().padLeft(2, '0');
  return '${two(t.day)}.${two(t.month)} ${two(t.hour)}:${two(t.minute)}';
}
