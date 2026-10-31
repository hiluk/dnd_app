import 'dart:async';

import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
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

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            _Hint(state: state),
            if (state.method == GenerationMethod.roll)
              _RollButton(state: state),
            if (state.error != null)
              Text(state.error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            if (state.method != GenerationMethod.roll || state.pool.isNotEmpty)
              for (final ability in Ability.values)
                _AbilityLine(
                  ability: ability,
                  editor: state.method == GenerationMethod.pointBuy
                      ? _PointBuyEditor(
                          ability: ability, state: state, cubit: cubit)
                      : _PoolEditor(
                          ability: ability, state: state, cubit: cubit),
                  result: sheet == null
                      ? null
                      : '→ ${sheet.stats.valueOf(ability)} '
                          '(${formatBonus(sheet.modifiers.valueOf(ability))})',
                ),
            if (sheet != null) ...[
              const SizedBox(height: 12),
              Text(
                'Хиты ${sheet.hitPoints} · Класс доспеха ${sheet.armorClass} · '
                'Инициатива ${formatBonus(sheet.initiative)}',
                textAlign: TextAlign.center,
                style: DndTheme.readableText.copyWith(fontSize: 16),
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
            const SizedBox(height: 80),
          ],
        );
      },
    );
  }
}

class _Hint extends StatelessWidget {
  final AssignmentState state;

  const _Hint({required this.state});

  @override
  Widget build(BuildContext context) {
    final text = switch (state.method) {
      GenerationMethod.pointBuy => 'Осталось очков: ${state.remainingPoints} '
          'из ${AbilityRules.pointBuyBudget}',
      GenerationMethod.standardArray =>
        'Распределите 15, 14, 13, 12, 10 и 8 по характеристикам',
      GenerationMethod.roll => state.pool.isEmpty
          ? 'Бросьте кубики: 4к6 без наименьшего для каждой характеристики'
          : 'Выпало: ${state.pool.join(', ')}. Распределите значения',
      null => '',
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: DndTheme.readableText.copyWith(fontSize: 16),
      ),
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
      child: Center(
        child: FilledButton.icon(
          onPressed: state.isRolling
              ? null
              : () => context.read<AssignmentCubit>().roll(),
          icon: const Icon(Icons.casino_outlined),
          label: Text(state.pool.isEmpty ? 'Бросить' : 'Перебросить'),
        ),
      ),
    );
  }
}

class _AbilityLine extends StatelessWidget {
  final Ability ability;
  final Widget editor;
  final String? result;

  const _AbilityLine(
      {required this.ability, required this.editor, this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(ability.title, style: const TextStyle(fontSize: 20)),
          ),
          editor,
          SizedBox(
            width: 76,
            child: Text(
              result ?? '',
              textAlign: TextAlign.right,
              style: DndTheme.readableText,
            ),
          ),
        ],
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
        IconButton(
          tooltip: 'Уменьшить',
          onPressed: state.canDecrement(ability)
              ? () => cubit.decrement(ability)
              : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 28,
          child: Text(
            '${state.valueOf(ability)}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        IconButton(
          tooltip: 'Увеличить',
          onPressed: state.canIncrement(ability)
              ? () => cubit.increment(ability)
              : null,
          icon: const Icon(Icons.add),
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
    return DropdownButton<int?>(
      value: state.assigned[ability],
      // В декоративном шрифте нет нормального тире
      style: DndTheme.readableText.copyWith(
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      hint: const Text('—'),
      items: [
        const DropdownMenuItem<int?>(value: null, child: Text('—')),
        for (final index in state.availableFor(ability))
          DropdownMenuItem<int?>(
            value: index,
            child: Text('${state.pool[index]}'),
          ),
      ],
      onChanged: (index) => cubit.assign(ability, index),
    );
  }
}
