import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/stats_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCreatingPreview extends StatelessWidget {
  const CharacterCreatingPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final creationBloc = BlocProvider.of<CharacterCreationBloc>(context);
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
