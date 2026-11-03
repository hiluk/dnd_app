import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/art_grid.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bloc_listener_fab.dart';
import 'package:dnd_app/core/api/races/enums/character_race_type.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/ui_kit/widgets/info_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора расы: сетка карточек, по нажатию — подробности
class RacesListView extends StatelessWidget {
  const RacesListView({super.key});

  /// Бонусы характеристик одной строкой
  static String bonuses(Race race) {
    final fixed = race.asi.where((e) => e.ability != null).toList();
    final choices = race.asi
        .where((e) => e.ability == null)
        .fold(0, (sum, e) => sum + e.choices);

    if (fixed.length == 6 && fixed.every((e) => e.value == fixed.first.value)) {
      return 'Все характеристики +${fixed.first.value}';
    }

    final parts = fixed.map((e) => '${e.stat} +${e.value}').join(', ');
    if (choices == 0) return parts;

    final count = switch (choices) { 1 => 'одна', 2 => 'две', _ => '$choices' };
    return parts.isEmpty ? '$count на выбор' : '$parts и $count на выбор';
  }

  @override
  Widget build(BuildContext context) {
    final races = di.get<CatalogRepository>().races;
    final selected = context.watch<RaceCubit>().state;

    return ArtGrid(
      items: [
        for (final race in races)
          ArtGridItem(
            title: race.name,
            subtitle: bonuses(race),
            art: CharacterRaceType.artOf(race),
            selected: race == selected,
            onTap: () {
              context.read<RaceCubit>().selectRace(race);
              _showDetails(context, race);
            },
          ),
      ],
    );
  }

  void _showDetails(BuildContext context, Race race) {
    final speed = race.speed
        .map((e) => '${e.type.toLowerCase()} ${e.value} фт.')
        .join(', ');

    showDetailsSheet(
      context,
      title: race.name,
      art: CharacterRaceType.artOf(race),
      actionTitle: 'Выбрать: ${race.name}',
      onAction: () => advanceCreation(
        context,
        CharacterCreationBlocEventSelect(characterRace: race),
      ),
      children: [
        SheetParagraph(race.description),
        InfoLine('Увеличение характеристик', bonuses(race)),
        InfoLine('Размер', race.size),
        InfoLine('Скорость', speed),
        InfoLine('Зрение', race.vision),
        InfoLine('Возраст', race.age),
        InfoLine('Языки', race.language),
        InfoLine('Особенности', race.traits),
      ],
    );
  }
}
