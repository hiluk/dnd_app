import 'dart:math';

enum CharacterClassType {
  warrior("Воин", 1, 'assets/images/warrior.png'),
  barbarian("Варвар", 2, 'assets/images/barbarian.png'),
  ranger('Рейнджер', 3, 'assets/images/ranger.png'),
  thief('Вор', 4, 'assets/images/thief.png');

  final String name;
  final int jsonValue;
  final String assetPath;
  const CharacterClassType(
    this.name,
    this.jsonValue,
    this.assetPath,
  );

  static String getAssetByName(String name) {
    return CharacterClassType.values
        .firstWhere((e) => e.name == name)
        .assetPath;
  }

  static String getRandomAsset() {
    final index = Random().nextInt(4) + 1;

    return CharacterClassType.values
        .firstWhere((e) => e.jsonValue == index)
        .assetPath;
  }
}
