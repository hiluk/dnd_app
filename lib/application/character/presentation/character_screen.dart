import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_bloc.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_event.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_state.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character/presentation/widgets/sheet_view.dart';
import 'package:dnd_app/application/character/presentation/widgets/character_hero.dart';
import 'package:dnd_app/application/character/avatar/avatar_sheet.dart';
import 'package:dnd_app/application/character/avatar/character_art.dart';
import 'package:dnd_app/application/session/bloc/session_cubit.dart';
import 'package:dnd_app/application/session/presentation/journal_tab.dart';
import 'package:dnd_app/application/session/presentation/session_tab.dart';
import 'package:dnd_app/application/session/repositories/session_queue_store.dart';
import 'package:dnd_app/application/session/repositories/session_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:logger/logger.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentCharacterBloc(
            di.get<CharactersRepository>(),
            characterId,
          ),
        ),
        BlocProvider(
          create: (context) => SessionCubit(
            characterId,
            di.get<SessionRepository>(),
            di.get<SessionQueueStore>(),
            di.get<Logger>(),
          )..load(),
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: BlocListener<SessionCubit, SessionViewState>(
          listenWhen: (_, state) => state.message != null,
          listener: (context, state) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message!))),
          child: BlocConsumer<CurrentCharacterBloc, CurrentCharacterBlocState>(
            listener: (context, state) {
              if (state is CurrentCharacterBlocStateDeleted) {
                context.read<CharactersBloc>().add(const CharactersRefresh());
                context.pop();
              }
            },
            builder: (context, state) {
              final loaded = state is CurrentCharacterBlocStateLoaded;

              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    loaded ? state.character.name : 'Персонаж',
                    overflow: TextOverflow.ellipsis,
                  ),
                  actions: [
                    if (loaded) const _SyncStatus(),
                    if (loaded)
                      IconButton(
                        tooltip: 'Удалить персонажа',
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => _confirmDelete(context),
                      ),
                  ],
                  bottom: loaded
                      ? const TabBar(
                          tabs: [
                            Tab(text: 'Лист'),
                            Tab(text: 'Сессия'),
                            Tab(text: 'Журнал'),
                          ],
                        )
                      : null,
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
                      const Center(child: CircularProgressIndicator()),
                    CurrentCharacterBlocStateLoaded state => TabBarView(
                        children: [
                          _SheetTab(state: state),
                          Builder(
                            builder: (context) => SessionTab(
                              character: state.character,
                              onOpenJournal: () =>
                                  DefaultTabController.of(context).animateTo(2),
                            ),
                          ),
                          const JournalTab(),
                        ],
                      ),
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final bloc = context.read<CurrentCharacterBloc>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить персонажа?'),
        content: const Text(
          'Персонаж и его лист будут удалены. Это действие нельзя отменить.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed == true) bloc.add(CurrentCharacterBlocEventDelete());
  }
}

class _SheetTab extends StatelessWidget {
  final CurrentCharacterBlocStateLoaded state;

  const _SheetTab({required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        CharacterArt(
          character: state.character,
          builder: (context, art) => CharacterHero(
            name: state.character.name,
            subtitle: '${state.character.characterRace.name}, '
                '${state.character.characterClass.name.toLowerCase()}',
            details:
                'Предыстория: ${state.character.background.name.toLowerCase()}',
            art: art,
            level: state.character.level,
            onEditArt: () => showAvatarSheet(context, state.character),
          ),
        ),
        const SizedBox(height: 20),
        SheetView(sheet: state.character.sheet),
      ],
    );
  }
}

/// Сохранено ли всё на сервере
class _SyncStatus extends StatelessWidget {
  const _SyncStatus();

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final sync = context.select((SessionCubit c) => c.state.sync);
    final (icon, text, color) = switch (sync) {
      SessionSync.saved => (Icons.cloud_done_outlined, 'Сохранено', p.muted),
      SessionSync.sending => (
          Icons.cloud_upload_outlined,
          'Отправляем',
          p.muted
        ),
      SessionSync.offline => (Icons.cloud_off_outlined, 'Нет связи', p.gold),
    };

    return Semantics(
      label: text,
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 4),
            Text(text, style: TextStyle(fontSize: 13, color: color)),
          ],
        ),
      ),
    );
  }
}
