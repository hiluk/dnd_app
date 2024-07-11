import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc_state.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:flutter_application_1/application/core/ui_kit/widgets/slide_button.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:go_router/go_router.dart';

import 'widgets/character_preview.dart';

class CharacterSelectionView extends StatefulWidget {
  static const routeName = 'character_selection';
  static const path = routeName;

  const CharacterSelectionView({super.key});

  @override
  State<CharacterSelectionView> createState() => _CharacterSelectionViewState();
}

class _CharacterSelectionViewState extends State<CharacterSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор персонажа'),
        centerTitle: true,
      ),
      floatingActionButton: SlideButton(
        onTap: () => context.pushNamed(CharacterCreationScreen.routeName),
      ),
      body: BlocProvider<CharactersBloc>(
        create: (_) => CharactersBloc(
            charactersRepository: di.get<CharactersRepository>()),
        child: BlocBuilder<CharactersBloc, CharactersBlocState>(
          builder: (context, state) {
            return switch (state) {
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
                    )
            };
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // charactersBox = Hive.box('characters');
  }
}
