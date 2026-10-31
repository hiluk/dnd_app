import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/core/ui_kit/widgets/showing_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Кнопка перехода к следующему шагу мастера. Видна, когда выбор на шаге сделан.
class BlocListenerFAB extends StatelessWidget {
  const BlocListenerFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final creation = context.watch<CharacterCreationBloc>().state;
    final race = context.watch<RaceCubit>().state;
    final characterClass = context.watch<ClassCubit>().state;
    final assignment = context.watch<AssignmentCubit>().state;
    final choices = context.watch<BonusChoiceCubit>().state;

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
      _ => null,
    };

    return OpacityFAB(
      title: 'Выбрать',
      isShow: event != null,
      onTap: () {
        if (event == null) return;
        context.read<CharacterCreationBloc>().add(event);
        context.read<RaceCubit>().selectRace(null);
        context.read<ClassCubit>().selectClass(null);
      },
    );
  }
}
