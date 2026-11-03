/// Классы из «Книги игрока». [jsonValue] совпадает с enum на сервере,
/// [name] — с названием в справочнике сервера.
enum CharacterClassType {
  fighter('Воин', 1, 'assets/images/warrior.png'),
  barbarian('Варвар', 2, 'assets/images/barbarian.png'),
  ranger('Следопыт', 3, 'assets/images/ranger.png'),
  rogue('Плут', 4, 'assets/images/thief.png'),
  bard('Бард', 5, 'assets/images/bard.jpg'),
  cleric('Жрец', 6, 'assets/images/cleric.jpg'),
  druid('Друид', 7, 'assets/images/druid.jpg'),
  monk('Монах', 8, 'assets/images/monk.jpg'),
  paladin('Паладин', 9, 'assets/images/paladin.jpg'),
  sorcerer('Чародей', 10, 'assets/images/sorcerer.jpg'),
  warlock('Колдун', 11, 'assets/images/warlock.png'),
  wizard('Волшебник', 12, 'assets/images/wizard.jpg');

  /// Картинка для классов, у которых пока нет своей
  static const fallbackAsset = 'assets/images/dragon.png';

  final String name;
  final int jsonValue;
  final String assetPath;
  const CharacterClassType(
    this.name,
    this.jsonValue, [
    this.assetPath = fallbackAsset,
  ]);

  static String getAssetByName(String? name) {
    for (final type in CharacterClassType.values) {
      if (type.name == name) return type.assetPath;
    }
    return fallbackAsset;
  }
}
