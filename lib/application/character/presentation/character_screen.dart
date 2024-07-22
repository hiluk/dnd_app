import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/bloc/current_character_bloc_state.dart';
import 'package:flutter_application_1/application/character/bloc/currrent_character_bloc.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/stats_widget.dart';

class CharacterScreen extends StatelessWidget {
  static const routeName = 'character';
  static const path = routeName;
  const CharacterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final extraName = GoRouterState.of(context).extra! as String;
    debugPrint(extraName);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CurrentCharacterBloc(
            di.get<CharactersRepository>(),
            extraName,
          ),
          child: BlocBuilder<CurrentCharacterBloc, CurrentCharacterBlocState>(
            builder: (context, state) {
              print(state.toString());
              return switch (state) {
                CurrentCharacterBlocStateError state => Center(
                    child: Text(state.error),
                  ),
                CurrentCharacterBlocStateLoading _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
                CurrentCharacterBlocStateLoaded state => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.character.name,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Row(
                        children: [
                          Text(
                            state.character.characterRace?.name ?? '',
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            state.character.characterClass?.name ?? '',
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      Text(
                        "Уровень: ${state.character.level}",
                        style: const TextStyle(fontSize: 22),
                      ),
                      StatsWidget(stats: state.character.characterStats)
                    ],
                  )
              };
            },
          ),
        ),
      ),
    );
  }
}
