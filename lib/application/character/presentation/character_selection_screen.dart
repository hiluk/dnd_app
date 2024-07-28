import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/slide_button.dart';
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
    final height = MediaQuery.sizeOf(context).height;
    return BlocBuilder<CharactersBloc, CharactersState>(
      bloc: charactersBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Выбор персонажа',
            ),
            centerTitle: true,
          ),
          floatingActionButton: SlideButton(
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
                : Column(
                    children: [
                      SizedBox(height: 0.15 * height),
                      SnappingCharactersList(characters: state.characters),
                    ],
                  ),
            _ => null,
          },
        );
      },
    );
  }
}
