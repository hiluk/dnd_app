import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character_creating/bloc/attributes_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character_creating/bloc/class_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/race_cubit.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/character_stats_create_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui_kit/theme_extensions/button_text_extension.dart';
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
  late Race? selectedRace;
  late Class? selectedClass;
  late Attributes? selectedStats;

  @override
  Widget build(BuildContext context) {
    bool isShowFab() {
      return selectedRace != null ||
              selectedClass != null ||
              selectedStats != null
          ? true
          : false;
    }

    return Scaffold(
      floatingActionButton: isShowFab()
          ? FloatingActionButton.extended(
              onPressed: () {
                final bloc = context.read<CharacterCreationBloc>();
                bloc.add(
                  CharacterCreationBlocEventSelect(
                    previousState: bloc.state,
                    characterRace: selectedRace,
                    characterClass: selectedClass,
                    characterStats: selectedStats,
                  ),
                );
                clearVariables();
              },
              backgroundColor:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
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
        child: BlocConsumer<CharacterCreationBloc, CharacterCreationBlocState>(
          listener: (context, state) {
            if (state.isCreated) {
              context.read<CharactersBloc>().add(const CharactersRefresh());
              context.pop();
            }
          },
          builder: (context, state) {
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
                  title: Text(getTitle(state)),
                  centerTitle: true,
                ),
                SliverFillRemaining(
                  fillOverscroll: true,
                  child: getBody(state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void clearVariables() {
    context.read<RaceCubit>().selectRace(null);
    context.read<ClassCubit>().selectClass(null);
    context.read<StatsCubit>().clear();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedRace = context.watch<RaceCubit>().state;
    selectedClass = context.watch<ClassCubit>().state;
    selectedStats = context.watch<StatsCubit>().state;
  }

  Widget getBody(CharacterCreationBlocState state) {
    if (state.characterRace == null) {
      return const RacesListView();
    }

    //Выбор класса
    if (state.characterClass == null) {
      return const ClassesListView();
    }

    //Выбор аттрибутов
    if (state.characterAttributes == null) {
      context.read<StatsCubit>().init();
      return const CharacterStatsCreateView();
    }

    // Превью персонажа перед сохранением
    return const CharacterCreatingPreview();
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
  }
}
