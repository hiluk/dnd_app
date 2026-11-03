import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character_creating/presentation/character_creation_screen.dart';
import 'package:dnd_app/core/ui_kit/bloc/theme_mode_cubit.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:dnd_app/core/utils/enums/mode_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/snapping_characters_list.dart';

/// Главный экран: персонажи игрока
class CharacterSelectionScreen extends StatelessWidget {
  static const routeName = 'character_selection';
  static const path = '/$routeName';

  const CharacterSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final mode = context.watch<ModeTypeCubit>().state;
    void create() => context.pushNamed(CharacterCreationScreen.routeName);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            final count = switch (state) {
              CharactersLoaded(:final characters) => characters.length,
              _ => null,
            };

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 8, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Персонажи',
                              style: DndTheme.display(p.ink, size: 34),
                            ),
                            if (count != null && count > 0)
                              Text(
                                _countLabel(count),
                                style: TextStyle(fontSize: 15, color: p.muted),
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: 'Обновить',
                        onPressed: () => context
                            .read<CharactersBloc>()
                            .add(const CharactersRefresh()),
                        icon: const Icon(Icons.refresh),
                      ),
                      IconButton(
                        tooltip: mode == ModeType.light
                            ? 'Тёмная тема'
                            : 'Светлая тема',
                        onPressed: () => context.read<ModeTypeCubit>().toggle(),
                        icon: mode == ModeType.light
                            ? const Icon(Icons.dark_mode_outlined)
                            : const Icon(Icons.light_mode_outlined),
                      ),
                      IconButton(
                        tooltip: 'Выйти',
                        onPressed: () => context
                            .read<AuthBloc>()
                            .add(const AuthEvent.signOut()),
                        icon: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: switch (state) {
                    CharactersError(:final message) => _Message(
                        title: 'Не удалось загрузить персонажей',
                        text: message,
                        action: OutlinedButton(
                          onPressed: () => context
                              .read<CharactersBloc>()
                              .add(const CharactersRefresh()),
                          child: const Text('Повторить'),
                        ),
                      ),
                    CharactersLoaded(:final characters)
                        when characters.isEmpty =>
                      const _Message(
                        title: 'Здесь будут ваши герои',
                        text: 'Создайте первого персонажа: выберите расу, '
                            'класс и распределите характеристики.',
                      ),
                    CharactersLoaded(:final characters) => Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: SnappingCharactersList(
                          key: ValueKey(characters.length),
                          characters: characters,
                        ),
                      ),
                    _ => const Center(child: CircularProgressIndicator()),
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  child: CustomButton(
                    title: 'Создать персонажа',
                    icon: Icons.add,
                    onTap: create,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static String _countLabel(int count) {
    final mod10 = count % 10;
    final mod100 = count % 100;
    final word = mod10 == 1 && mod100 != 11
        ? 'герой'
        : mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)
            ? 'героя'
            : 'героев';
    return '$count $word';
  }
}

class _Message extends StatelessWidget {
  final String title;
  final String text;
  final Widget? action;

  const _Message({required this.title, required this.text, this.action});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: DndTheme.display(p.ink, size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: p.muted, height: 1.4),
            ),
            if (action != null) ...[const SizedBox(height: 20), action!],
          ],
        ),
      ),
    );
  }
}
