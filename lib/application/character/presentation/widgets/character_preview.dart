import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/character_view.dart';
import 'package:go_router/go_router.dart';

class CharacterPreview extends StatelessWidget {
  final Character character;
  const CharacterPreview(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.goNamed(CharacterView.routeName, extra: character.name),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              character.characterRace?.name ?? '',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              character.characterClass?.name ?? '',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              "Уровень: ${character.level}",
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
