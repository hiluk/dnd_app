import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/session/bloc/session_cubit.dart';
import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/application/session/presentation/event_text.dart';
import 'package:dnd_app/application/session/presentation/widgets/amount_sheet.dart';
import 'package:dnd_app/application/session/presentation/widgets/hp_card.dart';
import 'package:dnd_app/application/session/presentation/widgets/session_sheets.dart';
import 'package:dnd_app/application/session/rules/dice.dart';
import 'package:dnd_app/application/session/rules/session_rules.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Вкладка «Сессия»: хиты, урон и лечение, спасброски от смерти,
/// состояния и отдых
class SessionTab extends StatelessWidget {
  final Character character;
  final VoidCallback onOpenJournal;
  final Dice dice;

  SessionTab({
    super.key,
    required this.character,
    required this.onOpenJournal,
    Dice? dice,
  }) : dice = dice ?? Dice();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionViewState>(
      builder: (context, view) {
        final state = view.state;
        final sessionContext = view.context;

        if (view.isLoading && state == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state == null || sessionContext == null) {
          return _LoadError(
            message: view.loadError ?? 'Не удалось загрузить сессию',
            onRetry: () => context.read<SessionCubit>().load(),
          );
        }

        final cubit = context.read<SessionCubit>();
        final maxHp = view.maxHp;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            HpCard(
              state: state,
              maxHp: maxHp,
              onEdit: () => _editHp(context, cubit, state, maxHp),
            ),
            const SizedBox(height: 14),
            if (state.isDead)
              _DeadCard(onRevive: () => _editHp(context, cubit, state, maxHp))
            else if (state.isDying)
              _DyingCard(
                state: state,
                onRoll: () => cubit.act(DeathSaveAction(dice.roll(20))),
                onHeal: () => _heal(context, cubit, sessionContext, state),
                onStabilize: () => cubit.act(const StabilizeAction()),
                onDamage: () => _damage(context, cubit, sessionContext, state),
              )
            else
              _ActionsRow(
                onDamage: () => _damage(context, cubit, sessionContext, state),
                onHeal: () => _heal(context, cubit, sessionContext, state),
                onTemp: () => _temp(context, cubit, state),
              ),
            const SizedBox(height: 12),
            _Stats(character: character, exhaustion: state.exhaustion),
            const _Title('Состояния'),
            _Conditions(
              state: state,
              onRemove: (c) => cubit.act(SetConditionAction(c, active: false)),
              onOpen: () => showConditionsSheet(context, cubit),
            ),
            const _Title('Отдых'),
            Row(
              children: [
                Expanded(
                  child: _RestTile(
                    title: 'Короткий',
                    subtitle: 'Кости хитов: '
                        '${SessionRules.hitDiceLeft(sessionContext, state)} '
                        'из ${sessionContext.level} к${sessionContext.hitDie}',
                    onTap: () => showShortRestSheet(context, cubit, dice),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _RestTile(
                    title: 'Длинный',
                    subtitle: 'Хиты, кости, истощение −1',
                    onTap: () => _longRest(context, cubit),
                  ),
                ),
              ],
            ),
            if (view.events.firstOrNull case final last?) ...[
              const SizedBox(height: 18),
              _LastEvent(
                text: describeEvent(last).title,
                time: last.pending
                    ? 'ждёт отправки'
                    : relativeTime(last.createdAt),
                onTap: onOpenJournal,
              ),
            ],
          ],
        );
      },
    );
  }

  Future<void> _damage(
    BuildContext context,
    SessionCubit cubit,
    SessionContext sessionContext,
    SessionState state,
  ) async {
    final input = await showAmountSheet(
      context,
      title: state.currentHp == 0 ? 'Урон по лежащему' : 'Урон',
      allowCritical: state.currentHp == 0,
      dice: dice,
      actionTitle: (amount) => 'Нанести $amount урона',
      preview: (amount, critical) => _preview(
        sessionContext,
        state,
        DamageAction(amount, critical: critical),
      ),
    );
    if (input != null) {
      await cubit.act(DamageAction(input.amount, critical: input.critical));
    }
  }

  Future<void> _heal(
    BuildContext context,
    SessionCubit cubit,
    SessionContext sessionContext,
    SessionState state,
  ) async {
    final input = await showAmountSheet(
      context,
      title: 'Лечение',
      dice: dice,
      actionTitle: (amount) => 'Вылечить $amount',
      preview: (amount, _) =>
          _preview(sessionContext, state, HealAction(amount)),
    );
    if (input != null) await cubit.act(HealAction(input.amount));
  }

  Future<void> _temp(
    BuildContext context,
    SessionCubit cubit,
    SessionState state,
  ) async {
    final input = await showAmountSheet(
      context,
      title: 'Временные хиты',
      dice: dice,
      actionTitle: (amount) => 'Получить $amount',
      preview: (amount, _) => amount <= state.tempHp
          ? 'Временные хиты не складываются: останется ${state.tempHp}'
          : 'Временные хиты: ${state.tempHp} → $amount',
    );
    if (input != null) await cubit.act(TempHpAction(input.amount));
  }

  Future<void> _editHp(
    BuildContext context,
    SessionCubit cubit,
    SessionState state,
    int maxHp,
  ) async {
    final value = await showSetHpDialog(
      context,
      current: state.currentHp,
      maxHp: maxHp,
      revive: state.isDead,
    );
    if (value != null) await cubit.act(SetHpAction(value));
  }

  Future<void> _longRest(BuildContext context, SessionCubit cubit) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Длинный отдых'),
        content: const Text(
          'Хиты восстановятся полностью, временные пропадут. '
          'Вернётся половина костей хитов, истощение уменьшится на 1.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Отдохнуть'),
          ),
        ],
      ),
    );
    if (confirmed == true) await cubit.act(const LongRestAction());
  }

  /// Что изменится от действия: считаем по тем же правилам
  static String? _preview(
    SessionContext context,
    SessionState state,
    SessionAction action,
  ) {
    try {
      final result = SessionRules.apply(context, state, action);
      final after = result.state;
      final parts = [
        if (result.absorbed > 0) 'Временные хиты поглотят ${result.absorbed}',
        'Хиты: ${state.currentHp} → ${after.currentHp}',
        if (after.isDead && !state.isDead) 'Персонаж погибнет',
        if (after.currentHp == 0 && state.currentHp > 0 && !after.isDead)
          'Без сознания',
        if (after.deathFailures > state.deathFailures && !after.isDead)
          'Провалов спасброска: ${after.deathFailures}',
      ];
      return parts.join('. ');
    } on SessionRulesException catch (e) {
      return e.message;
    }
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 10),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final VoidCallback onDamage;
  final VoidCallback onHeal;
  final VoidCallback onTemp;

  const _ActionsRow({
    required this.onDamage,
    required this.onHeal,
    required this.onTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: onDamage,
            icon: const Icon(Icons.local_fire_department_outlined, size: 20),
            label: const Text('Урон'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onHeal,
            style: OutlinedButton.styleFrom(minimumSize: const Size(0, 54)),
            icon: const Icon(Icons.favorite_border, size: 20),
            label: const Text('Лечение'),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 96,
          child: OutlinedButton.icon(
            onPressed: onTemp,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, 54),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            icon: const Icon(Icons.shield_outlined, size: 20),
            label: const Text('Врем.', semanticsLabel: 'Временные хиты'),
          ),
        ),
      ],
    );
  }
}

/// Спасброски от смерти: успехи — золотые круги, провалы — червлёные ромбы
class _DyingCard extends StatelessWidget {
  final SessionState state;
  final VoidCallback onRoll;
  final VoidCallback onHeal;
  final VoidCallback onStabilize;
  final VoidCallback onDamage;

  const _DyingCard({
    required this.state,
    required this.onRoll,
    required this.onHeal,
    required this.onStabilize,
    required this.onDamage,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    Widget marks(int filled, Color color, {required bool diamond}) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Transform.rotate(
                  angle: diamond ? 0.785398 : 0,
                  child: Container(
                    width: diamond ? 20 : 26,
                    height: diamond ? 20 : 26,
                    decoration: BoxDecoration(
                      color: i < filled ? color : Colors.transparent,
                      shape: diamond ? BoxShape.rectangle : BoxShape.circle,
                      border: Border.all(color: color, width: 2),
                    ),
                  ),
                ),
              ),
          ],
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
          decoration: BoxDecoration(
            color: p.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: p.gules),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Спасброски от смерти',
                  style: DndTheme.display(p.ink, size: 22)),
              const SizedBox(height: 14),
              Semantics(
                container: true,
                label: 'Успехи ${state.deathSuccesses} из 3',
                excludeSemantics: true,
                child: Row(children: [
                  const Expanded(
                      child: Text('Успехи', style: TextStyle(fontSize: 16))),
                  marks(state.deathSuccesses, p.gold, diamond: false),
                ]),
              ),
              const SizedBox(height: 12),
              Semantics(
                container: true,
                label: 'Провалы ${state.deathFailures} из 3',
                excludeSemantics: true,
                child: Row(children: [
                  const Expanded(
                      child: Text('Провалы', style: TextStyle(fontSize: 16))),
                  marks(state.deathFailures, p.gules, diamond: true),
                ]),
              ),
              const SizedBox(height: 12),
              Text(
                '10 и больше — успех. 1 — два провала, 20 — персонаж встаёт '
                'с 1 хитом. Три провала — смерть.',
                style: TextStyle(fontSize: 14, color: p.muted),
              ),
              const SizedBox(height: 14),
              FilledButton.icon(
                onPressed: onRoll,
                icon: const Icon(Icons.casino_outlined),
                label: const Text('Бросить спасбросок к20'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onHeal,
                icon: const Icon(Icons.favorite_border, size: 20),
                label: const Text('Лечение'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: onStabilize,
                child: const Text('Стабилизировать'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: onDamage,
          icon: const Icon(Icons.local_fire_department_outlined, size: 20),
          label: const Text('Урон по лежащему'),
        ),
      ],
    );
  }
}

class _DeadCard extends StatelessWidget {
  final VoidCallback onRevive;

  const _DeadCard({required this.onRevive});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: p.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: p.gules),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Персонаж погиб', style: DndTheme.display(p.ink, size: 22)),
          const SizedBox(height: 8),
          Text(
            'Если его воскресили, верните ему хиты вручную.',
            style: TextStyle(fontSize: 15, color: p.muted),
          ),
          const SizedBox(height: 14),
          OutlinedButton(
              onPressed: onRevive, child: const Text('Вернуть хиты')),
        ],
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  final Character character;
  final int exhaustion;

  const _Stats({required this.character, required this.exhaustion});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final sheet = character.sheet;
    // Истощение 2 — скорость вдвое меньше, 5 — скорость 0
    final speed = exhaustion >= 5
        ? 0
        : exhaustion >= 2
            ? sheet.speed ~/ 2
            : sheet.speed;

    Widget tile(String value, String label) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: p.line),
            ),
            child: Semantics(
              label: '$label $value',
              excludeSemantics: true,
              child: Column(
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFeatures: DndTheme.numbers,
                    ),
                  ),
                  Text(label, style: TextStyle(fontSize: 13, color: p.muted)),
                ],
              ),
            ),
          ),
        );

    return Row(
      children: [
        tile('${sheet.armorClass}', 'Класс доспеха'),
        const SizedBox(width: 10),
        tile(formatBonus(sheet.initiative), 'Инициатива'),
        const SizedBox(width: 10),
        tile('$speed фт.', 'Скорость'),
      ],
    );
  }
}

class _Conditions extends StatelessWidget {
  final SessionState state;
  final ValueChanged<Condition> onRemove;
  final VoidCallback onOpen;

  const _Conditions({
    required this.state,
    required this.onRemove,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final condition in state.conditions)
              InputChip(
                label: Text(condition.title),
                selected: true,
                onPressed: onOpen,
                onDeleted: () => onRemove(condition),
                deleteButtonTooltipMessage: 'Снять',
              ),
            if (state.exhaustion > 0)
              ActionChip(
                label: Text('Истощение ${state.exhaustion}'),
                side: BorderSide(color: p.gold),
                backgroundColor: p.gold.withOpacity(0.16),
                onPressed: onOpen,
              ),
            ActionChip(
              avatar: Icon(Icons.add, size: 18, color: p.muted),
              label: Text(
                state.conditions.isEmpty && state.exhaustion == 0
                    ? 'Добавить состояние'
                    : 'Изменить',
                style: TextStyle(color: p.muted),
              ),
              onPressed: onOpen,
            ),
          ],
        ),
        if (state.exhaustion > 0) ...[
          const SizedBox(height: 8),
          Text(
            'Истощение ${state.exhaustion}: '
            '${exhaustionEffects.sublist(1, state.exhaustion + 1).join(', ').toLowerCase()}',
            style: TextStyle(fontSize: 13, color: p.muted),
          ),
        ],
      ],
    );
  }
}

class _RestTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _RestTile(
      {required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Material(
      color: p.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: p.line),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 3),
              Text(subtitle, style: TextStyle(fontSize: 13, color: p.muted)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LastEvent extends StatelessWidget {
  final String text;
  final String time;
  final VoidCallback onTap;

  const _LastEvent(
      {required this.text, required this.time, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Material(
      color: p.raised,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.history, size: 18, color: p.muted),
              const SizedBox(width: 10),
              Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
              Text(time, style: TextStyle(fontSize: 13, color: p.muted)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _LoadError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: onRetry, child: const Text('Повторить')),
          ],
        ),
      ),
    );
  }
}
