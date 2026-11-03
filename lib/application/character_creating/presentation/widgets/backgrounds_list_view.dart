import 'package:dnd_app/application/character_creating/bloc/background_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/art_grid.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bloc_listener_fab.dart';
import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/choice_tile.dart';
import 'package:dnd_app/core/ui_kit/widgets/info_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора предыстории
class BackgroundsListView extends StatelessWidget {
  const BackgroundsListView({super.key});

  static String skillsOf(Background background) => background.skillChoices > 0
      ? 'Любые ${background.skillChoices} навыка на выбор'
      : background.skills.map((s) => s.title).join(', ');

  @override
  Widget build(BuildContext context) {
    final backgrounds = di.get<CatalogRepository>().backgrounds;
    final selected = context.watch<BackgroundCubit>().state;
    final p = DndPalette.of(context);

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      itemCount: backgrounds.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final background = backgrounds[index];

        return ChoiceTile(
          key: ValueKey(background.type),
          title: background.name,
          subtitle: skillsOf(background),
          titleStyle: DndTheme.display(p.ink, size: 21),
          selected: background == selected,
          trailing: Icon(Icons.chevron_right, color: p.muted),
          onTap: () {
            context.read<BackgroundCubit>().select(background);
            _showDetails(context, background);
          },
        );
      },
    );
  }

  void _showDetails(BuildContext context, Background background) {
    showDetailsSheet(
      context,
      title: background.name,
      actionTitle: 'Выбрать: ${background.name}',
      onAction: () => advanceCreation(
        context,
        CharacterCreationBlocEventSelect(background: background),
      ),
      children: [
        SheetParagraph(background.description),
        InfoLine('Навыки', skillsOf(background)),
        InfoLine('Инструменты', background.tools),
        InfoLine('Языки', background.languages),
        InfoLine('Снаряжение', background.equipment),
        InfoLine('Умение', background.feature),
      ],
    );
  }
}
