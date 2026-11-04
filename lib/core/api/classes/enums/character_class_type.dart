import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/widgets.dart';

/// Классы из «Книги игрока». [jsonValue] совпадает с enum на сервере,
/// [name] — с названием в справочнике сервера.
enum CharacterClassType {
  fighter('Воин', 1, CardArt.figure('${figuresDir}warrior.png')),
  barbarian('Варвар', 2, CardArt.figure('${figuresDir}barbarian.png')),
  ranger('Следопыт', 3, CardArt.figure('${figuresDir}ranger.png')),
  rogue('Плут', 4, CardArt.figure('${figuresDir}thief.png')),
  bard('Бард', 5, CardArt.figure('${figuresDir}bard.png')),
  cleric('Жрец', 6, CardArt.plate('${platesDir}cleric.jpg')),
  druid('Друид', 7, CardArt.figure('${figuresDir}druid.png')),
  monk('Монах', 8, CardArt.plate('${platesDir}monk.jpg',
      alignment: Alignment(0.2, -0.6))),
  paladin('Паладин', 9, CardArt.plate('${platesDir}paladin.jpg')),
  sorcerer('Чародей', 10, CardArt.plate('${platesDir}sorcerer.jpg')),
  warlock('Колдун', 11, CardArt.figure('${figuresDir}warlock.png')),
  wizard('Волшебник', 12, CardArt.plate('${platesDir}wizard.jpg'));

  /// Картинка для классов, у которых пока нет своей
  static const fallback = CardArt.figure('${figuresDir}dragon.png');
  static const fallbackAsset = '${figuresDir}dragon.png';

  final String name;
  final int jsonValue;
  final CardArt art;
  const CharacterClassType(this.name, this.jsonValue, [this.art = fallback]);

  String get assetPath => art.path!;

  static String getAssetByName(String? name) => artByName(name).path!;

  static CardArt artByName(String? name) {
    for (final type in CharacterClassType.values) {
      if (type.name == name) return type.art;
    }
    return fallback;
  }
}
