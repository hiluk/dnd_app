import 'dart:async';

import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг распределения характеристик тремя способами.
/// Пока распределение полное, сервер считает итог с бонусами расы.
class AssignmentView extends StatefulWidget {
  const AssignmentView({super.key});

  @override
  State<AssignmentView> createState() => _AssignmentViewState();
}

class _AssignmentViewState extends State<AssignmentView> {
  static const _debounce = Duration(milliseconds: 300);
  Timer? _previewTimer;

  @override
  void initState() {
    super.initState();
    // Покупка очков сразу полная (все по 8), поэтому превью нужно и без изменений
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _schedulePreview(context.read<AssignmentCubit>().state),
    );
  }

  @override
  void dispose() {
    _previewTimer?.cancel();
    super.dispose();
  }

  /// Живое превью только если у расы нет бонусов на выбор:
  /// иначе итог ещё неизвестен и считается на следующем шаге
  void _schedulePreview(AssignmentState assignment) {
    _previewTimer?.cancel();
    final bloc = context.read<CharacterCreationBloc>();
    final draft = bloc.state.draft(
      baseStats: assignment.baseStats,
      rollToken: assignment.rollToken,
    );
    if (draft == null || bloc.state.requiredBonusChoices > 0) return;

    _previewTimer = Timer(
      _debounce,
      () => bloc.add(CharacterCreationBlocEventPreview(draft)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final creation = context.watch<CharacterCreationBloc>().state;

    return BlocConsumer<AssignmentCubit, AssignmentState>(
      listener: (context, state) => _schedulePreview(state),
      builder: (context, state) {
        final cubit = context.read<AssignmentCubit>();
        final sheet = state.isComplete ? creation.sheet : null;

        final p = DndPalette.of(context);
        final raceBonus = <Ability, int>{
          for (final asi in creation.characterRace?.asi ?? const [])
            if (asi.ability != null) asi.ability!: asi.value,
        };
        final showRows =
            state.method != GenerationMethod.roll || state.pool.isNotEmpty;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            _Hint(state: state),
            if (state.method == GenerationMethod.roll) _RollButton(state: state),
            if (state.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  state.error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            if (showRows)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: p.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: p.line),
                ),
                child: Column(
                  children: [
                    for (final ability in Ability.values)
                      _AbilityLine(
                        ability: ability,
                        isLast: ability == Ability.values.last,
                        raceBonus: raceBonus[ability],
                        editor: state.method == GenerationMethod.pointBuy
                            ? _PointBuyEditor(
                                ability: ability, state: state, cubit: cubit)
                            : _PoolEditor(
                                ability: ability, state: state, cubit: cubit),
                        total: sheet?.stats.valueOf(ability),
                        modifier: sheet?.modifiers.valueOf(ability),
                      ),
                  ],
                ),
              ),
            if (showRows && sheet != null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 16),
                child: Text(
                  'Справа — итог с бонусами расы и модификатор.',
                  style: TextStyle(fontSize: 14, color: p.muted),
                ),
              ),
              Row(
                children: [
                  _MiniStat('Хиты', '${sheet.hitPoints}'),
                  const SizedBox(width: 10),
                  _MiniStat('Класс доспеха', '${sheet.armorClass}'),
                  const SizedBox(width: 10),
                  _MiniStat('Инициатива', formatBonus(sheet.initiative)),
                ],
              ),
            ],
            if (state.isComplete && creation.previewError != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  creation.previewError!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Итоговое значение под характеристиками: число над подписью
class _MiniStat extends StatelessWidget {
  final String label;
  final String value;

  const _MiniStat(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Expanded(
      child: Semantics(
        container: true,
        label: '$label $value',
        excludeSemantics: true,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: p.line),
          ),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: p.ink,
                  fontFeatures: DndTheme.numbers,
                ),
              ),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: p.muted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  final AssignmentState state;

  const _Hint({required this.state});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    if (state.method == GenerationMethod.pointBuy) {
      const budget = AbilityRules.pointBuyBudget;
      final spent = budget - state.remainingPoints;

      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
        decoration: BoxDecoration(
          color: p.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: p.line),
        ),
        child: Column(
          children: [
            Semantics(
              label: 'Осталось очков: ${state.remainingPoints} из $budget',
              excludeSemantics: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Expanded(
                    child: Text('Осталось очков', style: TextStyle(fontSize: 16)),
                  ),
                  Text(
                    '${state.remainingPoints}',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: p.gold,
                      fontFeatures: DndTheme.numbers,
                    ),
                  ),
                  Text(
                    ' из $budget',
                    style: TextStyle(fontSize: 16, color: p.muted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: spent / budget,
                minHeight: 4,
                color: p.gold,
                backgroundColor: p.line,
              ),
            ),
          ],
        ),
      );
    }

    final text = switch (state.method) {
      GenerationMethod.standardArray =>
        'Распределите 15, 14, 13, 12, 10 и 8 по характеристикам',
      GenerationMethod.roll => state.pool.isEmpty
          ? 'Бросьте кубики: 4к6 без наименьшего для каждой характеристики'
          : 'Выпало: ${state.pool.join(', ')}. Распределите значения',
      _ => '',
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 2),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class _RollButton extends StatelessWidget {
  final AssignmentState state;

  const _RollButton({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: OutlinedButton.icon(
        onPressed:
            state.isRolling ? null : () => context.read<AssignmentCubit>().roll(),
        icon: const Icon(Icons.casino_outlined),
        label: Text(state.pool.isEmpty ? 'Бросить кубики' : 'Перебросить'),
      ),
    );
  }
}

/// Строка характеристики: название, бонус расы, редактор и итог
class _AbilityLine extends StatelessWidget {
  final Ability ability;
  final Widget editor;
  final int? raceBonus;
  final int? total;
  final int? modifier;
  final bool isLast;

  const _AbilityLine({
    required this.ability,
    required this.editor,
    required this.isLast,
    this.raceBonus,
    this.total,
    this.modifier,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 6, 12, 6),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: p.line)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ability.title, style: const TextStyle(fontSize: 17)),
                if (raceBonus != null)
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: p.gold.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${formatBonus(raceBonus!)} раса',
                      style: TextStyle(fontSize: 12, color: p.gold, height: 1.5),
                    ),
                  ),
              ],
            ),
          ),
          editor,
          SizedBox(
            width: 70,
            child: total == null
                ? null
                : Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '$total '),
                        TextSpan(
                          text: '(${formatBonus(modifier!)})',
                          style: TextStyle(color: p.muted),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      color: p.ink,
                      fontFeatures: DndTheme.numbers,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

/// Квадратная кнопка «−» или «+»: видна по рамке, поэтому рамка контрастная
class _StepButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  const _StepButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final enabled = onPressed != null;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: enabled ? p.raised : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: enabled ? p.control : p.line),
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox.square(
            dimension: 44,
            child: Icon(icon, size: 20, color: enabled ? p.ink : p.line),
          ),
        ),
      ),
    );
  }
}

class _PointBuyEditor extends StatelessWidget {
  final Ability ability;
  final AssignmentState state;
  final AssignmentCubit cubit;

  const _PointBuyEditor({
    required this.ability,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StepButton(
          icon: Icons.remove,
          tooltip: 'Уменьшить',
          onPressed: state.canDecrement(ability)
              ? () => cubit.decrement(ability)
              : null,
        ),
        SizedBox(
          width: 34,
          child: Text(
            '${state.valueOf(ability)}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFeatures: DndTheme.numbers,
            ),
          ),
        ),
        _StepButton(
          icon: Icons.add,
          tooltip: 'Увеличить',
          onPressed: state.canIncrement(ability)
              ? () => cubit.increment(ability)
              : null,
        ),
      ],
    );
  }
}

class _PoolEditor extends StatelessWidget {
  final Ability ability;
  final AssignmentState state;
  final AssignmentCubit cubit;

  const _PoolEditor({
    required this.ability,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Container(
      height: 44,
      padding: const EdgeInsets.only(left: 12, right: 4),
      decoration: BoxDecoration(
        color: p.raised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: p.control),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int?>(
          value: state.assigned[ability],
          dropdownColor: p.surface,
          borderRadius: BorderRadius.circular(12),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: p.ink,
            fontFeatures: DndTheme.numbers,
          ),
          hint: Text('—', style: TextStyle(fontSize: 18, color: p.muted)),
          items: [
            const DropdownMenuItem<int?>(value: null, child: Text('—')),
            for (final index in state.availableFor(ability))
              DropdownMenuItem<int?>(
                value: index,
                child: Text('${state.pool[index]}'),
              ),
          ],
          onChanged: (index) => cubit.assign(ability, index),
        ),
      ),
    );
  }
}
