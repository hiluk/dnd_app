import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/character_stats_create_view.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/classes_list_view.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/races_list_view.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/character_creating_preview.dart';

class CharacterCreationScreen extends StatefulWidget {
  static const routeName = 'creation';
  static const routePath = '/$routeName';
  const CharacterCreationScreen({super.key});

  @override
  State<CharacterCreationScreen> createState() =>
      _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  late TextEditingController nameController;
  late String title;
  Race? currentRace;
  Class? currentClass;
  String? currentName;
  Attributes? currentStats;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.get<CharacterCreationBloc>(),
      child: BlocBuilder<CharacterCreationBloc, CharacterCreationBlocState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: isShowFab()
                ? FloatingActionButton.extended(
                    onPressed: () {
                      final bloc = context.read<CharacterCreationBloc>();
                      bloc.add(
                        CharacterCreationBlocEventSelect(
                          previousState: bloc.state,
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
                    title: Text(getTitle(state)),
                    centerTitle: true,
                  ),
                  SliverFillRemaining(
                    child: BlocBuilder<CharacterCreationBloc,
                        CharacterCreationBlocState>(
                      builder: (context, state) {
                        // Выбор расы
                        if (state.characterRace == null) {
                          return RacesListView(
                            selectRace: (race) => setState(
                              () => currentRace = race,
                            ),
                          );
                        }

                        //Выбор класса
                        if (state.characterClass == null) {
                          return ClassesListView(
                            selectClass: (characterClass) => setState(
                              () => currentClass = characterClass,
                            ),
                          );
                        }

                        //Выбор аттрибутов
                        if (state.characterAttributes == null) {
                          return CharacterStatsCreateView(
                            statsCallBack: (stats) {
                              setState(() {
                                currentStats = stats;
                              });
                            },
                          );
                        }

                        //Выбор имени
                        if (state.characterName.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
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

                        // Уведомление об успешном создании персонажа
                        if (state.isCreated) {
                          context
                              .read<CharactersBloc>()
                              .add(const CharactersEvent.refresh());
                          return const Center(
                            child: Text('Персонаж успешно создан'),
                          );
                        }

                        // Превью персонажа перед сохранением
                        return const CharacterCreatingPreview();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

  String getTitle(CharacterCreationBlocState state) {
    if (state.characterRace == null) {
      return 'Выбор расы';
    }

    if (state.characterClass == null) {
      return 'Выбор класса';
    }

    if (state.characterAttributes == null) {
      return 'Выбор характеристик';
    }

    if (state.characterName.isEmpty) {
      return 'Выбор имени';
    }

    return 'Создание персонажа';
  }

  @override
  void initState() {
    super.initState();
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
