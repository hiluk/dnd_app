import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc_state.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/slide_button.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:go_router/go_router.dart';

import 'widgets/character_preview.dart';

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
      child: BlocBuilder<CharactersBloc, CharactersBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Выбор персонажа'),
              centerTitle: true,
            ),
            floatingActionButton: SlideButton(
              onTap: () => context.pushNamed(
                CharacterCreationScreen.routeName,
                extra: charactersBloc,
              ),
            ),
            body: switch (state) {
              CharactersBlocStateLoading _ => const Center(
                  child: CircularProgressIndicator(),
                ),
              CharactersBlocStateError state => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(state.error),
                  ),
                ),
              CharactersBlocStateLoaded state => state.characters.isEmpty
                  ? const Center(
                      child: Text('Нет персонажей'),
                    )
                  : ListView.builder(
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CharacterPreview(state.characters[index]),
                            const Divider()
                          ],
                        );
                      },
                    ),
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
