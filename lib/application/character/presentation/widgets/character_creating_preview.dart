import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/stats_widget.dart';

class CharacterCreatingPreview extends StatelessWidget {
  final CharacterCreationBloc bloc;

  const CharacterCreatingPreview({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    final character = Character(
      characterStats: bloc.state.characterAttributes!,
      characterClass: bloc.state.characterClass,
      characterRace: bloc.state.characterRace,
      name: bloc.state.characterName,
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
        StatsWidget(stats: bloc.state.characterAttributes),
        TextButton(
          onPressed: () {
            return bloc.add(CharacterCreationBlocEventCreate(character));
          },
          child: const Text('Создать'),
        ),
      ],
    );
  }
}
