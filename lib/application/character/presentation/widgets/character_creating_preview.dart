import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/character_creation_bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character/character_creation_bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/stats_widget.dart';

class CharacterCreatingPreview extends StatelessWidget {
  final CharacterCreationBloc creationBloc;

  const CharacterCreatingPreview({
    super.key,
    required this.creationBloc,
  });

  @override
  Widget build(BuildContext context) {
    final character = Character(
      characterStats: creationBloc.state.characterAttributes!,
      characterClass: creationBloc.state.characterClass,
      characterRace: creationBloc.state.characterRace,
      name: creationBloc.state.characterName,
      level: 1,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          character.name,
          style: const TextStyle(fontSize: 30),
        ),
        Row(
          children: [
            Text(
              character.characterRace?.name ?? '',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(width: 20),
            Text(
              character.characterClass?.name ?? '',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
        StatsWidget(stats: character.characterStats),
        TextButton(
          onPressed: () async {
            creationBloc.add(CharacterCreationBlocEventCreate(character));
          },
          child: const Text('Создать'),
        ),
      ],
    );
  }
}
