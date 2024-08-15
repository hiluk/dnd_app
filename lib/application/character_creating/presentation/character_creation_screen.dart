import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/character_stats_create_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/button_text_extension.dart';
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
  Attributes? currentStats;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCreationBloc, CharacterCreationBlocState>(
      builder: (context, state) {
        return BlocListener<CharacterCreationBloc, CharacterCreationBlocState>(
          listener: (context, state) async {
            if (state.isCreated) {
              context.read<CharactersBloc>().add(const CharactersRefresh());
              context.pop();
            }
          },
          child: Scaffold(
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
                        ),
                      );
                      clearVariables();
                    },
                    backgroundColor: Theme.of(context)
                        .floatingActionButtonTheme
                        .backgroundColor,
                    label: Text(
                      'Выбрать',
                      style: Theme.of(context)
                              .extension<ButtonThemeExtension>()
                              ?.textStyle ??
                          ButtonThemeExtension.dark.textStyle,
                    ),
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
                    fillOverscroll: true,
                    child: BlocBuilder<CharacterCreationBloc,
                        CharacterCreationBlocState>(
                      builder: (context, state) {
                        // Выбор расы
                        if (state.characterRace == null) {
                          return RacesListView(
                            raceCallBack: (race) => setState(
                              () => currentRace = race,
                            ),
                          );
                        }

                        //Выбор класса
                        if (state.characterClass == null) {
                          return ClassesListView(
                            classCallback: (characterClass) => setState(
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

                        // Превью персонажа перед сохранением
                        return const CharacterCreatingPreview();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void clearVariables() {
    currentClass = null;
    currentRace = null;
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

    return 'Создание персонажа';
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    title = 'Создание персонажа';
  }

  bool isShowFab() {
    return currentRace != null || currentClass != null || currentStats != null
        ? true
        : false;
  }
}
