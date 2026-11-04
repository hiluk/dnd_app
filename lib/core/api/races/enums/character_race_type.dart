import 'package:dnd_app/core/api/races/models/race_model.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/widgets.dart';

/// Расы из «Книги игрока». [jsonValue] совпадает с enum на сервере,
/// [name] — с названием в справочнике сервера.
enum CharacterRaceType {
  human('Человек', 1, CardArt.figure('${figuresDir}human.png')),
  halfElf('Полуэльф', 2, CardArt.figure('${figuresDir}half_elf.png')),
  dwarf('Дварф', 3, CardArt.plate('${platesDir}dwarf.jpg',
      alignment: Alignment(-0.2, 0.45))),
  elf('Эльф', 4, CardArt.figure('${figuresDir}elf.png')),
  halfling('Полурослик', 5,
      CardArt.figure('${figuresDir}halfling.png', isLineArt: true)),
  dragonborn('Драконорождённый', 6, CardArt.figure('${figuresDir}dragon.png')),
  gnome('Гном', 7, CardArt.figure('${figuresDir}gnome.png')),
  halfOrc('Полуорк', 8, CardArt.figure('${figuresDir}half_orc.png')),
  tiefling('Тифлинг', 9, CardArt.figure('${figuresDir}tiefling.png'));

  /// Картинка для рас, у которых пока нет своей
  static const fallback = CardArt.plate('${platesDir}human_plug.jpeg');
  static const fallbackAsset = '${platesDir}human_plug.jpeg';

  final String name;
  final int jsonValue;
  final CardArt art;
  const CharacterRaceType(this.name, this.jsonValue, [this.art = fallback]);

  String get assetPath => art.path!;

  static String findRaceAsset(Race race) => artOf(race).path!;

  static CardArt artOf(Race race) {
    for (final type in CharacterRaceType.values) {
      if (type.name == race.name) return type.art;
    }
    return fallback;
  }
}
