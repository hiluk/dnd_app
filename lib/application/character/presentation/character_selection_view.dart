import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/core/ui_kit/widgets/slide_button.dart';
import 'package:go_router/go_router.dart';

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
            child: SizedBox.shrink(),
          ),
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    // charactersBox = Hive.box('characters');
  }
}
