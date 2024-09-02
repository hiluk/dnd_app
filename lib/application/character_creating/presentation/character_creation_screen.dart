import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/attributes_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character_creating/bloc/class_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/race_cubit.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/bloc_listener_fab.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/character_stats_create_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/character_creating_preview.dart';

Widget _getBody(BuildContext context, CharacterCreationBlocState state) {
  void clearVariables() {
    context.read<RaceCubit>().selectRace(null);
    context.read<ClassCubit>().selectClass(null);
    context.read<StatsCubit>().dispose();
  }

  String title = 'Создание персонажа';
  Widget body = const CharacterCreatingPreview();

  if (state.characterAttributes == null) {
    title = 'Выбор характеристик';
    body = const CharacterStatsCreateView();
  }

  if (state.characterClass == null) {
    body = const ClassesListView();
    title = 'Выбор класса';
  }

  if (state.characterRace == null) {
    body = const RacesListView();
    title = 'Выбор расы';
  }

  return CustomScrollView(
    slivers: [
      SliverAppBar(
        leading: IconButton(
          onPressed: state.previousState != null
              ? () {
                  context.read<CharacterCreationBloc>().add(
                        CharacterCreationBlocEventReturn(),
                      );
                  clearVariables();
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
        child: BlocConsumer<CharacterCreationBloc, CharacterCreationBlocState>(
          listener: (context, state) {
            if (state.isCreated) {
              context.read<CharactersBloc>().add(const CharactersRefresh());
              context.pop();
            }
          },
          builder: _getBody,
        ),
      ),
    );
  }
}
