import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/presentation/character_screen.dart';
import 'package:dnd_app/application/character/avatar/character_art.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Карточка персонажа в карусели выбора
class CharacterCard extends StatelessWidget {
  final Character character;
  final bool inFocus;

  const CharacterCard({
    required this.character,
    required this.inFocus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final race = character.characterRace.name;
    final characterClass = character.characterClass.name.toLowerCase();

    return CharacterArt(
      character: character,
      builder: (context, art) => _card(context, art, p, race, characterClass),
    );
  }

  Widget _card(
    BuildContext context,
    CardArt art,
    DndPalette p,
    String race,
    String characterClass,
  ) {
    return FigureCard(
      art: art,
      inFocus: inFocus,
      plaqueHeight: 112,
      rise: 0.2,
      semanticLabel: '${character.name}, $race, $characterClass, '
          '${character.level} уровень',
      onTap: () => context.pushNamed(
        CharacterScreen.routeName,
        extra: character.id,
      ),
      plaque: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DndTheme.display(p.ink, size: 30),
                ),
                const SizedBox(height: 6),
                Text(
                  '$race, $characterClass',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: p.muted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          LevelSeal(level: character.level),
        ],
      ),
    );
  }
}

/// Печать с уровнем персонажа
class LevelSeal extends StatelessWidget {
  final int level;
  final double size;

  const LevelSeal({super.key, required this.level, this.size = 52});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: p.gold, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$level',
            style: TextStyle(
              fontSize: size * 0.4,
              height: 1,
              fontWeight: FontWeight.w700,
              color: p.gold,
              fontFeatures: DndTheme.numbers,
            ),
          ),
          Text(
            'ур.',
            style: TextStyle(fontSize: size * 0.22, height: 1, color: p.gold),
          ),
        ],
      ),
    );
  }
}
