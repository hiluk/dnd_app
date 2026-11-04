import 'dart:io';
import 'dart:ui' as ui;

import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/api/races/enums/character_race_type.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/painting.dart';
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

  final arts = [
    for (final race in CharacterRaceType.values) (race.name, race.art),
    for (final type in CharacterClassType.values) (type.name, type.art),
  ];

  test('Фигуры лежат в папке фигур, гравюры — в папке картинок', () {
    for (final (name, art) in arts) {
      expect(
        art.path!.startsWith(art.isFigure ? figuresDir : platesDir),
        isTrue,
        reason: '$name: ${art.path}',
      );
    }
  });

  // Фигура выходит за рамку карточки, поэтому фон вокруг неё должен быть
  // прозрачным. Одного альфа-канала мало: бывают PNG с непрозрачным белым фоном.
  for (final (name, art) in arts.where((e) => e.$2.isFigure)) {
    testWidgets('Фон фигуры «$name» прозрачный', (tester) async {
      final transparent = await tester.runAsync(() async {
        final bytes = File(art.path!).readAsBytesSync();
        final image = await decodeImageFromList(bytes);
        final data =
            (await image.toByteData(format: ui.ImageByteFormat.rawRgba))!;
        final w = image.width, h = image.height;
        int alpha(int x, int y) => data.getUint8((y * w + x) * 4 + 3);

        // Доля прозрачных точек по периметру картинки
        var clear = 0, total = 0;
        for (var x = 0; x < w; x++) {
          for (final y in [0, h - 1]) {
            total++;
            if (alpha(x, y) < 16) clear++;
          }
        }
        for (var y = 0; y < h; y++) {
          for (final x in [0, w - 1]) {
            total++;
            if (alpha(x, y) < 16) clear++;
          }
        }
        return clear / total;
      });

      expect(transparent, greaterThan(0.5), reason: art.path);
    });
  }
}
