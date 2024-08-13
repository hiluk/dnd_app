import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character_creating/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/theme_mode_cubit.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/slide_button.dart';
import 'package:flutter_application_1/core/utils/enums/mode_enums.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:go_router/go_router.dart';

import 'widgets/snapping_characters_list.dart';

class CharacterSelectionScreen extends StatefulWidget {
  static const routeName = 'character_selection';
  static const path = '/$routeName';

  const CharacterSelectionScreen({super.key});

  @override
  State<CharacterSelectionScreen> createState() =>
      _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final charactersBloc = BlocProvider.of<CharactersBloc>(context);
    final mode = context.watch<ModeTypeCubit>().state;

    return BlocBuilder<CharactersBloc, CharactersState>(
      bloc: charactersBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Выбор персонажа'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => context
                    .read<CharactersBloc>()
                    .add(const CharactersRefresh()),
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () => context.read<ModeTypeCubit>().toggle(),
                icon: mode != ModeType.light
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              )
            ],
          ),
          floatingActionButton: SlideButton(
            title: 'Создать персонажа',
            onTap: () => context.pushNamed(CharacterCreationScreen.routeName),
          ),
          body: switch (state) {
            CharactersLoading _ => const Center(
                child: CircularProgressIndicator(),
              ),
            CharactersError state => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(state.message),
                ),
              ),
            CharactersLoaded state => state.characters.isEmpty
                ? const Center(
                    child: Text('Нет персонажей'),
                  )
                : Center(
                    child: SnappingCharactersList(characters: state.characters),
                  ),
            _ => null,
          },
        );
      },
    );
  }
}
