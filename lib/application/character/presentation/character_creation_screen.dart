import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/character_stats_create_view.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/classes_list_view.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/races_list_view.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late CharacterCreationBloc bloc;
  late TextEditingController nameController;
  Race? currentRace;
  Class? currentClass;
  String? currentName;
  Attributes? currentStats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isShowFab()
          ? FloatingActionButton.extended(
              onPressed: () {
                bloc.add(
                  CharacterCreationBlocEventSelect(
                    characterRace: currentRace,
                    characterClass: currentClass,
                    characterStats: currentStats,
                    characterName: currentName,
                  ),
                );
                clearVariables();
              },
              label: const Text('Выбрать'),
            )
          : null,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Создание персонажа'),
              centerTitle: true,
            ),
            SliverFillRemaining(
              child: BlocBuilder<CharacterCreationBloc,
                  CharacterCreationBlocState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state.characterRace == null) {
                    return RacesListView(
                      selectRace: (race) => setState(() => currentRace = race),
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
                        debugPrint(currentStats.toString());
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
                    return const Center(
                      child: Text('Персонаж успешно создан'),
                    );
                  }

                  return CharacterCreatingPreview(bloc: bloc);
                },
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

  @override
  void initState() {
    super.initState();
    bloc = CharacterCreationBloc(
      charactersRepository: di.get<CharactersRepository>(),
    );
    nameController = TextEditingController();
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
