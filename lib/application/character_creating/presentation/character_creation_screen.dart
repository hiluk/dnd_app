import 'package:flutter/material.dart';
import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/background_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/skill_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bloc_listener_fab.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/assignment_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/backgrounds_list_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/skills_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bonus_choice_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/method_select_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:dnd_app/core/catalog/catalog_loader.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/step_progress.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/character_creating_preview.dart';

Widget _getBody(BuildContext context, CharacterCreationBlocState state) {
  void clearVariables() {
    context.read<RaceCubit>().selectRace(null);
    context.read<ClassCubit>().selectClass(null);
    context.read<BonusChoiceCubit>().reset();
    context.read<BackgroundCubit>().select(null);
    if (state.step == CreationStep.skills) {
      context.read<SkillChoiceCubit>().reset();
    }
    if (state.step == CreationStep.assignment) {
      context.read<AssignmentCubit>().reset();
    }
  }

  final (title, body) = switch (state.step) {
    CreationStep.race => ('Раса', const RacesListView()),
    CreationStep.characterClass => ('Класс', const ClassesListView()),
    CreationStep.method => ('Способ генерации', const MethodSelectView()),
    CreationStep.assignment => (
        state.generationMethod!.title,
        const AssignmentView(),
      ),
    CreationStep.bonusChoice => ('Бонусы расы', const BonusChoiceView()),
    CreationStep.background => ('Предыстория', const BackgroundsListView()),
    CreationStep.skills => ('Навыки', const SkillsView()),
    CreationStep.summary => (
        'Итог',
        const CharacterCreatingPreview()
      ),
  };

  // Шаг бонусов есть не у всех рас
  final steps = [
    for (final step in CreationStep.values)
      if (step != CreationStep.bonusChoice ||
          state.characterRace == null ||
          state.requiredBonusChoices > 0)
        step,
  ];
  final p = DndPalette.of(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Назад',
              onPressed: state.previousState != null
                  ? () {
                      clearVariables();
                      context.read<CharacterCreationBloc>().add(
                            CharacterCreationBlocEventReturn(),
                          );
                    }
                  : () => context.pop(),
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DndTheme.display(p.ink, size: 26),
                  ),
                  Text(
                    'Шаг ${steps.indexOf(state.step) + 1} из ${steps.length}',
                    style: TextStyle(fontSize: 14, color: p.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
        child: StepProgress(
          current: steps.indexOf(state.step),
          total: steps.length,
        ),
      ),
      Expanded(
        child: AnimatedSwitcher(
          duration: DndDurations.fast,
          child: KeyedSubtree(key: ValueKey(state.step), child: body),
        ),
      ),
    ],
  );
}

class CharacterCreationScreen extends StatelessWidget {
  static const routeName = 'creation';
  static const routePath = '/$routeName';
  const CharacterCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BlocListenerFAB(),
      body: SafeArea(
        child: CatalogLoader(
          child:
              BlocConsumer<CharacterCreationBloc, CharacterCreationBlocState>(
            listener: (context, state) {
              if (state.isCreated) {
                context.read<CharactersBloc>().add(const CharactersRefresh());
                context.pop();
              } else if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            builder: _getBody,
          ),
        ),
      ),
    );
  }
}
