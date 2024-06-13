import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/core/ui_kit/widgets/slide_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

class CharacterSelectionView extends StatefulWidget {
  static const routeName = 'character_selection';
  static const path = routeName;

  const CharacterSelectionView({super.key});

  @override
  State<CharacterSelectionView> createState() => _CharacterSelectionViewState();
}

class _CharacterSelectionViewState extends State<CharacterSelectionView> {
  late Box<Map<String, dynamic>> charactersBox;
  late List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SlideButton(
        onTap: () => context.pushNamed(CharacterCreationScreen.routeName),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            title: Text(
              'Characters list',
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            child: ValueListenableBuilder(
              valueListenable: charactersBox.listenable(),
              builder: (context, value, child) {
                characters = charactersBox.values
                    .map((e) => Character.fromJson(e))
                    .toList();

                return characters.isNotEmpty
                    ? Column(
                        children: characters
                            .map((char) => Text(char.race.name))
                            .toList(),
                      )
                    : const Center(
                        child: Text('Empty'),
                      );
              },
            ),
          ),
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    charactersBox = Hive.box('characters');
  }
}
