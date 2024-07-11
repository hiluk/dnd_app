import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';

class CharacterPreview extends StatelessWidget {
  final Character character;
  const CharacterPreview(this.character);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            "Уровень: ${character.level}",
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
