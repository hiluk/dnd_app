import 'package:dnd_app/application/session/bloc/session_cubit.dart';
import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/application/session/rules/dice.dart';
import 'package:dnd_app/application/session/rules/session_rules.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шторка состояний: 14 состояний и истощение 0–6
Future<void> showConditionsSheet(BuildContext context, SessionCubit cubit) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: BlocBuilder<SessionCubit, SessionViewState>(
        builder: (context, view) {
          final state = view.state;
          if (state == null) return const SizedBox.shrink();
          final p = DndPalette.of(context);

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Состояния', style: DndTheme.display(p.ink, size: 26)),
                const SizedBox(height: 14),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3.6,
                  children: [
                    for (final condition in Condition.values)
                      FilterChip(
                        label: SizedBox(
                          width: double.infinity,
                          child: Text(condition.title,
                              textAlign: TextAlign.center),
                        ),
                        selected: state.conditions.contains(condition),
                        onSelected: (active) => cubit.act(
                          SetConditionAction(condition, active: active),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 18),
                Text('Истощение',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                SegmentedButton<int>(
                  showSelectedIcon: false,
                  segments: [
                    for (var level = 0;
                        level <= SessionRules.maxExhaustion;
                        level++)
                      ButtonSegment(
                        value: level,
                        label: Text('$level'),
                        tooltip: exhaustionEffects[level],
                      ),
                  ],
                  selected: {state.exhaustion},
                  onSelectionChanged: (selection) async {
                    final level = selection.first;
                    if (level == SessionRules.maxExhaustion &&
                        !await _confirmDeath(context)) {
                      return;
                    }
                    await cubit.act(SetExhaustionAction(level));
                  },
                ),
                const SizedBox(height: 12),
                for (var level = 1;
                    level <= SessionRules.maxExhaustion;
                    level++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '$level — ${exhaustionEffects[level].toLowerCase()}',
                      style: TextStyle(
                        fontSize: 14,
                        color: level <= state.exhaustion ? p.ink : p.muted,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

Future<bool> _confirmDeath(BuildContext context) async =>
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Истощение 6'),
        content: const Text('На шестом уровне истощения персонаж умирает.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Применить'),
          ),
        ],
      ),
    ) ??
    false;

/// Шторка короткого отдыха: тратим кости хитов по одной
Future<void> showShortRestSheet(
  BuildContext context,
  SessionCubit cubit,
  Dice dice,
) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: _ShortRest(dice: dice),
    ),
  );
}

class _ShortRest extends StatefulWidget {
  final Dice dice;

  const _ShortRest({required this.dice});

  @override
  State<_ShortRest> createState() => _ShortRestState();
}

class _ShortRestState extends State<_ShortRest> {
  /// Броски этого отдыха: выпало и сколько вылечило
  final _rolls = <({int roll, int healed})>[];
  int? _startHp;

  Future<void> _spend(SessionCubit cubit, int hitDie) async {
    _startHp ??= cubit.state.state?.currentHp;
    final roll = widget.dice.roll(hitDie);
    final result = await cubit.act(SpendHitDieAction(roll));
    if (result != null && mounted) {
      setState(() => _rolls.add((roll: roll, healed: result.healed)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return BlocBuilder<SessionCubit, SessionViewState>(
      builder: (context, view) {
        final state = view.state;
        final sessionContext = view.context;
        if (state == null || sessionContext == null) {
          return const SizedBox.shrink();
        }

        final left = SessionRules.hitDiceLeft(sessionContext, state);
        final con = sessionContext.conModifier;
        final conText = con >= 0 ? '+$con' : '$con';
        final cubit = context.read<SessionCubit>();

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Короткий отдых', style: DndTheme.display(p.ink, size: 26)),
              const SizedBox(height: 8),
              Text(
                'Каждая кость хитов: к${sessionContext.hitDie} + модификатор '
                'Телосложения ($conText). Длинный отдых вернёт половину костей.',
                style: TextStyle(fontSize: 15, color: p.muted),
              ),
              const SizedBox(height: 14),
              Semantics(
                label:
                    'Свободно костей хитов: $left из ${sessionContext.level}',
                excludeSemantics: true,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var i = 0; i < sessionContext.level; i++)
                      Container(
                        width: 56,
                        height: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: i < left ? p.gold.withOpacity(0.12) : null,
                          border: Border.all(
                            color: i < left ? p.gold : p.line,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          'к${sessionContext.hitDie}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: i < left ? p.ink : p.muted,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (_rolls.isNotEmpty) ...[
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: p.raised,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      for (final r in _rolls)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'к${sessionContext.hitDie}: ${r.roll} $conText',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              Text(
                                '+${r.healed} хитов',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: p.gold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Хиты: ${_startHp ?? state.currentHp} → ${state.currentHp} '
                  'из ${view.maxHp}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: left > 0 && state.currentHp > 0
                    ? () => _spend(cubit, sessionContext.hitDie)
                    : null,
                icon: const Icon(Icons.casino_outlined),
                label: Text(left > 0
                    ? 'Потратить кость к${sessionContext.hitDie}'
                    : 'Свободных костей нет'),
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'Закончить отдых',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Ручная правка хитов («мастер сказал 15»). Для погибшего — воскрешение
Future<int?> showSetHpDialog(
  BuildContext context, {
  required int current,
  required int maxHp,
  required bool revive,
}) {
  final controller = TextEditingController(text: revive ? '1' : '$current');

  return showDialog<int>(
    context: context,
    builder: (context) {
      void submit() {
        final value = int.tryParse(controller.text);
        if (value == null || value < 0 || value > maxHp) return;
        if (revive && value == 0) return;
        Navigator.pop(context, value);
      }

      return AlertDialog(
        title: Text(revive ? 'Вернуть хиты' : 'Хиты вручную'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(revive
                ? 'Персонаж вернётся к жизни с этими хитами.'
                : 'Например, если мастер назвал точное число.'),
            const SizedBox(height: 14),
            TextField(
              controller: controller,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Хиты, от ${revive ? 1 : 0} до $maxHp',
              ),
              onSubmitted: (_) => submit(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(onPressed: submit, child: const Text('Сохранить')),
        ],
      );
    },
  );
}
