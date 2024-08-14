import 'package:flutter_application_1/core/api/races/models/race_model.dart';

enum CharacterRaceType {
  human('Человек', 1, 'assets/images/human.png'),
  halfElf('Полуэльф', 2, 'assets/images/half_elf.png');

  final String name;
  final int jsonValue;
  final String assetPath;
  const CharacterRaceType(
    this.name,
    this.jsonValue,
    this.assetPath,
  );

  static String findRaceAsset(Race race) {
    return CharacterRaceType.values
        .firstWhere((e) => e.name == race.name)
        .assetPath;
  }
}
