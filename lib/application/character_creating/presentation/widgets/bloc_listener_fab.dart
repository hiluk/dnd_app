import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/background_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/skill_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/skills_view.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Переход к следующему шагу мастера с выбором [event]
void advanceCreation(BuildContext context, CharacterCreationBlocEvent event) {
  context.read<CharacterCreationBloc>().add(event);
  context.read<RaceCubit>().selectRace(null);
  context.read<ClassCubit>().selectClass(null);
  context.read<BackgroundCubit>().select(null);
}

/// Нижняя панель с кнопкой «Далее». Кнопка активна, когда выбор на шаге сделан.
/// На шагах без кнопки (способ генерации, итог) панели нет.
class BlocListenerFAB extends StatelessWidget {
  const BlocListenerFAB({super.key});

  static const _stepsWithButton = {
    CreationStep.race,
    CreationStep.characterClass,
    CreationStep.assignment,
    CreationStep.bonusChoice,
    CreationStep.background,
    CreationStep.skills,
  };

  @override
  Widget build(BuildContext context) {
    final creation = context.watch<CharacterCreationBloc>().state;
    final race = context.watch<RaceCubit>().state;
    final characterClass = context.watch<ClassCubit>().state;
    final assignment = context.watch<AssignmentCubit>().state;
    final choices = context.watch<BonusChoiceCubit>().state;
    final background = context.watch<BackgroundCubit>().state;
    final skills = context.watch<SkillChoiceCubit>().state;

    if (!_stepsWithButton.contains(creation.step)) {
      return const SizedBox.shrink();
    }

    final event = switch (creation.step) {
      CreationStep.race when race != null =>
        CharacterCreationBlocEventSelect(characterRace: race),
      CreationStep.characterClass when characterClass != null =>
        CharacterCreationBlocEventSelect(characterClass: characterClass),
      CreationStep.assignment when assignment.isComplete =>
        CharacterCreationBlocEventSelect(
          baseStats: assignment.baseStats,
          rollToken: assignment.rollToken,
        ),
      CreationStep.bonusChoice
          when choices.length == creation.requiredBonusChoices =>
        CharacterCreationBlocEventSelect(bonusChoices: choices),
      CreationStep.background when background != null =>
        CharacterCreationBlocEventSelect(background: background),
      CreationStep.skills
          when SkillsView.sectionsOf(creation).isComplete(skills) =>
        CharacterCreationBlocEventSelect(skills: skills),
      _ => null,
    };

    final selectedName = switch (creation.step) {
      CreationStep.race => race?.name,
      CreationStep.characterClass => characterClass?.name,
      CreationStep.background => background?.name,
      _ => null,
    };

    final p = DndPalette.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: p.field,
        border: Border(top: BorderSide(color: p.line)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: CustomButton(
            title: selectedName == null ? 'Далее' : 'Далее: $selectedName',
            onTap: event == null ? null : () => advanceCreation(context, event),
          ),
        ),
      ),
    );
  }
}
