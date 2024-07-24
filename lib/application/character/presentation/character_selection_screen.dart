import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/slide_button.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:go_router/go_router.dart';

import 'widgets/snapping_characters_list.dart';

class CharacterSelectionScreen extends StatefulWidget {
  static const routeName = 'character_selection';
  static const path = routeName;

  const CharacterSelectionScreen({super.key});

  @override
  State<CharacterSelectionScreen> createState() =>
      _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  late CharactersBloc charactersBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersBloc>(
          create: (_) => charactersBloc,
        ),
      ],
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Выбор персонажа',
              ),
              centerTitle: true,
            ),
            floatingActionButton: SlideButton(
              onTap: () => context.pushNamed(
                CharacterCreationScreen.routeName,
                extra: charactersBloc,
              ),
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
                        SnappingCharactersList(characters: state.characters),
                      ],
                    ),
              _ => null,
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    charactersBloc = CharactersBloc(
      charactersRepository: di.get<CharactersRepository>(),
    );
  }
}
