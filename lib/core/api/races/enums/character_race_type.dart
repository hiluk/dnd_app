import 'package:dnd_app/core/api/races/models/race_model.dart';

/// Расы из «Книги игрока». [jsonValue] совпадает с enum на сервере,
/// [name] — с названием в справочнике сервера.
enum CharacterRaceType {
  human('Человек', 1, 'assets/images/human.png'),
  halfElf('Полуэльф', 2, 'assets/images/half_elf.png'),
  dwarf('Дварф', 3, 'assets/images/dwarf.jpg'),
  elf('Эльф', 4, 'assets/images/elf.png'),
  halfling('Полурослик', 5, 'assets/images/halfling.png'),
  dragonborn('Драконорождённый', 6, 'assets/images/dragon.png'),
  gnome('Гном', 7, 'assets/images/gnome.jpg'),
  halfOrc('Полуорк', 8, 'assets/images/half_orc.png'),
  tiefling('Тифлинг', 9, 'assets/images/tiefling.jpg');

  /// Картинка для рас, у которых пока нет своей
  static const fallbackAsset = 'assets/images/human_plug.jpeg';

  final String name;
  final int jsonValue;
  final String assetPath;
  const CharacterRaceType(
    this.name,
    this.jsonValue, [
    this.assetPath = fallbackAsset,
  ]);

  static String findRaceAsset(Race race) {
    for (final type in CharacterRaceType.values) {
      if (type.name == race.name) return type.assetPath;
    }
    return fallbackAsset;
  }
}
