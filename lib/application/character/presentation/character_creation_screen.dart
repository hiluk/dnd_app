import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/character_stats_create_view.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/classes_list_view.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/races_list_view.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/character_creating_preview.dart';

class CharacterCreationScreen extends StatefulWidget {
  static const routeName = 'creation';
  static const routePath = routeName;
  const CharacterCreationScreen({super.key});

  @override
  State<CharacterCreationScreen> createState() =>
      _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  late CharacterCreationBloc creationBloc;
  late TextEditingController nameController;
  late String title;
  Race? currentRace;
  Class? currentClass;
  String? currentName;
  Attributes? currentStats;

  @override
  Widget build(BuildContext context) {
    final charactersBloc = GoRouterState.of(context).extra! as CharactersBloc;

    return Scaffold(
      floatingActionButton: isShowFab()
          ? FloatingActionButton.extended(
              onPressed: () {
                creationBloc.add(
                  CharacterCreationBlocEventSelect(
                    characterRace: currentRace,
                    characterClass: currentClass,
                    characterStats: currentStats,
                    characterName: currentName,
                  ),
                );
                clearVariables();
              },
              backgroundColor: Colors.red,
              label: const Text('Выбрать'),
            )
          : null,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(getTitle()),
              centerTitle: true,
            ),
            SliverFillRemaining(
              child: BlocProvider(
                create: (context) => creationBloc,
                child: BlocBuilder<CharacterCreationBloc,
                    CharacterCreationBlocState>(
                  bloc: creationBloc,
                  builder: (context, state) {
                    if (state.characterRace == null) {
                      return RacesListView(
                        selectRace: (race) =>
                            setState(() => currentRace = race),
                      );
                    }

                    if (state.characterClass == null) {
                      return ClassesListView(
                        selectClass: (characterClass) =>
                            setState(() => currentClass = characterClass),
                      );
                    }

                    if (state.characterAttributes == null) {
                      return CharacterStatsCreateView(
                        statsCallBack: (stats) {
                          setState(() {
                            currentStats = stats;
                          });
                        },
                      );
                    }

                    if (state.characterName.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: TextField(
                            controller: nameController,
                            onChanged: (value) =>
                                setState(() => currentName = value),
                          ),
                        ),
                      );
                    }

                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state.isCreated) {
                      charactersBloc.add(const CharactersEvent.refresh());
                      return const Center(
                        child: Text('Персонаж успешно создан'),
                      );
                    }

                    return CharacterCreatingPreview(
                      creationBloc: creationBloc,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clearVariables() {
    currentClass = null;
    currentRace = null;
    currentName = null;
    currentStats = null;
    setState(() {});
  }

  String getTitle() {
    if (creationBloc.state.characterRace == null) {
      return 'Выбор расы';
    }

    if (creationBloc.state.characterClass == null) {
      return 'Выбор класса';
    }

    if (creationBloc.state.characterAttributes == null) {
      return 'Выбор характеристик';
    }

    if (creationBloc.state.characterName.isEmpty) {
      return 'Выбор имени';
    }

    return 'Создание персонажа';
  }

  @override
  void initState() {
    super.initState();
    creationBloc = CharacterCreationBloc(
      charactersRepository: di.get<CharactersRepository>(),
    );
    nameController = TextEditingController();
    title = 'Создание персонажа';
  }

  bool isShowFab() {
    return currentRace != null ||
            currentClass != null ||
            currentName != null ||
            currentStats != null
        ? true
        : false;
  }
}
