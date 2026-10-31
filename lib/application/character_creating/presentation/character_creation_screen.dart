import 'package:flutter/material.dart';
import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bloc_listener_fab.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/assignment_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bonus_choice_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/method_select_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:dnd_app/core/catalog/catalog_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/character_creating_preview.dart';

Widget _getBody(BuildContext context, CharacterCreationBlocState state) {
  void clearVariables() {
    context.read<RaceCubit>().selectRace(null);
    context.read<ClassCubit>().selectClass(null);
    context.read<BonusChoiceCubit>().reset();
    if (state.step == CreationStep.assignment) {
      context.read<AssignmentCubit>().reset();
    }
  }

  final (title, body) = switch (state.step) {
    CreationStep.race => ('Выбор расы', const RacesListView()),
    CreationStep.characterClass => ('Выбор класса', const ClassesListView()),
    CreationStep.method => ('Способ генерации', const MethodSelectView()),
    CreationStep.assignment => (
        state.generationMethod!.title,
        const AssignmentView(),
      ),
    CreationStep.bonusChoice => ('Бонусы расы', const BonusChoiceView()),
    CreationStep.summary => (
        'Создание персонажа',
        const CharacterCreatingPreview()
      ),
  };

  return CustomScrollView(
    slivers: [
      SliverAppBar(
        leading: IconButton(
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
        title: Text(title),
        centerTitle: true,
      ),
      SliverFillRemaining(
        fillOverscroll: true,
        child: body,
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
      floatingActionButton: const BlocListenerFAB(),
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
