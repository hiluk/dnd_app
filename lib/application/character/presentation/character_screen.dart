import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_bloc.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_event.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_state.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character/presentation/widgets/sheet_view.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CharacterScreen extends StatelessWidget {
  static const routeName = 'character';
  static const path = '/$routeName';

  final String characterId;

  const CharacterScreen({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentCharacterBloc(
        di.get<CharactersRepository>(),
        characterId,
      ),
      child: BlocConsumer<CurrentCharacterBloc, CurrentCharacterBlocState>(
        listener: (context, state) {
          if (state is CurrentCharacterBlocStateDeleted) {
            context.read<CharactersBloc>().add(const CharactersRefresh());
            context.pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                if (state is CurrentCharacterBlocStateLoaded)
                  IconButton(
                    tooltip: 'Удалить персонажа',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _confirmDelete(context),
                  ),
              ],
            ),
            body: SafeArea(
              child: switch (state) {
                CurrentCharacterBlocStateError state => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.error),
                        TextButton(
                          onPressed: () => context
                              .read<CurrentCharacterBloc>()
                              .add(CurrentCharacterBlocEventRefresh()),
                          child: const Text('Повторить'),
                        ),
                      ],
                    ),
                  ),
                CurrentCharacterBlocStateLoading _ ||
                CurrentCharacterBlocStateDeleted _ =>
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                CurrentCharacterBlocStateLoaded state => ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        state.character.name,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        '${state.character.characterRace.name}   '
                        '${state.character.characterClass.name}',
                        style: const TextStyle(fontSize: 22),
                      ),
                      Text(
                        'Уровень ${state.character.level} · '
                        '${state.character.generationMethod.title}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      SheetView(sheet: state.character.sheet),
                    ],
                  ),
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final bloc = context.read<CurrentCharacterBloc>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить персонажа?'),
        content: const Text('Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed == true) bloc.add(CurrentCharacterBlocEventDelete());
  }
}
