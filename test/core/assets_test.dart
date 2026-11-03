import 'dart:io';

import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/api/races/enums/character_race_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final paths = {
    for (final race in CharacterRaceType.values) race.name: race.assetPath,
    for (final type in CharacterClassType.values) type.name: type.assetPath,
    'заглушка расы': CharacterRaceType.fallbackAsset,
    'заглушка класса': CharacterClassType.fallbackAsset,
  };

  for (final MapEntry(key: name, value: path) in paths.entries) {
    test('Картинка «$name» есть в проекте: $path', () {
      expect(File(path).existsSync(), isTrue);
    });
  }

  test('У всех рас и классов есть своя картинка', () {
    expect(
      CharacterRaceType.values
          .where((e) => e.assetPath == CharacterRaceType.fallbackAsset),
      isEmpty,
    );
    expect(
      CharacterClassType.values
          .where((e) => e.assetPath == CharacterClassType.fallbackAsset),
      isEmpty,
    );
  });
}
