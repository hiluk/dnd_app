import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dnd_app/application/character/avatar/avatar_cache.dart';
import 'package:dnd_app/application/character/avatar/avatar_editor_screen.dart';
import 'package:dnd_app/application/character/avatar/character_art.dart';
import 'package:dnd_app/application/character/avatar/image_transparency.dart';
import 'package:dnd_app/application/character/models/character_avatar.dart';
import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/fixtures.dart';

class MockHttpClient extends Mock implements IHttpClient {}

const id = '3be0ae8e-2035-4f79-95d9-da152f746d2f';

Map<String, dynamic> avatarJson({
  bool hasTransparency = false,
  int mode = 1,
  double offsetX = 0,
  double scale = 1,
}) =>
    {
      'url': '/characters/$id/avatar?v=abc',
      'hasTransparency': hasTransparency,
      'mode': mode,
      'offsetX': offsetX,
      'offsetY': 0,
      'scale': scale,
    };

void main() {
  late MockHttpClient client;
  late CatalogRepository catalog;
  late CharactersRepository repository;

  setUpAll(() => registerFallbackValue(FormData()));

  setUp(() async {
    await di.reset();
    client = MockHttpClient();
    catalog = CatalogRepository(client);
    di.registerSingleton(catalog);
    repository = CharactersRepository(client, catalog, Logger(level: Level.off));
    di.registerSingleton(repository);
    di.registerSingleton(AvatarCache(repository));

    when(() => client.get<List<dynamic>>('/races')).thenAnswer((_) async => racesJson);
    when(() => client.get<List<dynamic>>('/classes')).thenAnswer((_) async => classesJson);
    when(() => client.get<List<dynamic>>('/backgrounds'))
        .thenAnswer((_) async => backgroundsJson);
  });

  Future<Character> character({Map<String, dynamic>? avatar}) async {
    when(() => client.get<Map<String, dynamic>>('/characters/$id'))
        .thenAnswer((_) async => {...characterJson(), 'avatar': avatar});
    return repository.fetchById(id);
  }

  group('Модель и репозиторий', () {
    test('Персонаж без своей картинки и с ней', () async {
      expect((await character()).avatar, isNull);

      final withAvatar = await character(avatar: avatarJson(mode: 2, hasTransparency: true));
      expect(withAvatar.avatar!.mode, AvatarMode.figure);
      expect(withAvatar.avatar!.hasTransparency, isTrue);
    });

    test('Вид и кадр уходят числами, как ждёт сервер', () {
      const layout = AvatarLayout(mode: AvatarMode.figure, offsetX: -0.5, scale: 2);
      expect(layout.toJson(), {'mode': 2, 'offsetX': -0.5, 'offsetY': 0.0, 'scale': 2.0});
    });

    test('Загрузка отправляет файл формой на адрес картинки', () async {
      when(() => client.put<Map<String, dynamic>>(any(), any()))
          .thenAnswer((_) async => avatarJson(hasTransparency: true));

      final avatar = await repository.uploadAvatar(id, [1, 2, 3], fileName: 'hero.png');

      final captured = verify(
        () => client.put<Map<String, dynamic>>('/characters/$id/avatar', captureAny()),
      ).captured.single as FormData;
      expect(captured.files.single.key, 'file');
      expect(captured.files.single.value.filename, 'hero.png');
      expect(avatar.hasTransparency, isTrue);
    });

    test('Кадр и удаление', () async {
      when(() => client.patch<Map<String, dynamic>>(any(), any()))
          .thenAnswer((_) async => avatarJson(offsetX: 0.5));
      when(() => client.delete<void>(any())).thenAnswer((_) async {});

      final updated = await repository.updateAvatar(id, const AvatarLayout(offsetX: 0.5));
      await repository.deleteAvatar(id);

      expect(updated.offsetX, 0.5);
      verify(() => client.patch<Map<String, dynamic>>(
          '/characters/$id/avatar', {'mode': 1, 'offsetX': 0.5, 'offsetY': 0.0, 'scale': 1.0}));
      verify(() => client.delete<void>('/characters/$id/avatar'));
    });

    test('Картинка скачивается один раз, ошибка не запоминается', () async {
      var calls = 0;
      when(() => client.getBytes(any())).thenAnswer((_) async {
        calls++;
        if (calls == 1) throw Exception('нет сети');
        return [1, 2, 3];
      });
      final cache = di.get<AvatarCache>();

      await expectLater(cache.load('/a?v=1'), throwsException);
      expect(await cache.load('/a?v=1'), [1, 2, 3]);
      expect(await cache.load('/a?v=1'), [1, 2, 3]);
      expect(calls, 2);
    });

    test('Фигура — только при прозрачном фоне', () {
      final bytes = Uint8List(1);
      const opaque = CharacterAvatar(url: '/x', mode: AvatarMode.figure);
      const transparent =
          CharacterAvatar(url: '/x', mode: AvatarMode.figure, hasTransparency: true);

      expect(opaque.toArt(bytes).isFigure, isFalse);
      expect(transparent.toArt(bytes).isFigure, isTrue);
    });
  });

  group('Прозрачность на устройстве', () {
    testWidgets('Вырезанная фигура — прозрачная, гравюра — нет', (tester) async {
      final result = await tester.runAsync(() async => (
            await hasTransparentBorder(File('assets/figures/human.png').readAsBytesSync()),
            await hasTransparentBorder(File('assets/images/dwarf.jpg').readAsBytesSync()),
          ));

      expect(result!.$1, isTrue);
      expect(result.$2, isFalse);
    });
  });

  group('Редактор', () {
    Future<void> pumpEditor(WidgetTester tester, Character character, AvatarSource source) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(MaterialApp(
        theme: DndTheme().dark,
        home: AvatarEditorScreen(character: character, source: source),
      ));
      // Проверка прозрачности идёт через декодер — даём ей завершиться
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 300)));
      await tester.pump();
    }

    ButtonSegment<AvatarMode> figureSegment(WidgetTester tester) => tester
        .widget<SegmentedButton<AvatarMode>>(find.byType(SegmentedButton<AvatarMode>))
        .segments
        .last;

    testWidgets('Гравюру нельзя показать фигурой', (tester) async {
      final hero = await tester.runAsync(() => character());
      final bytes = File('assets/images/dwarf.jpg').readAsBytesSync();

      await pumpEditor(tester, hero!, AvatarSource.newImage(bytes, fileName: 'w.jpg'));

      expect(figureSegment(tester).enabled, isFalse);
      expect(find.textContaining('доступна для PNG с прозрачным фоном'), findsOneWidget);
    });

    testWidgets('Прозрачная картинка сразу показывается фигурой и сохраняется',
        (tester) async {
      final hero = await tester.runAsync(() => character());
      final bytes = File('assets/figures/human.png').readAsBytesSync();
      when(() => client.put<Map<String, dynamic>>(any(), any()))
          .thenAnswer((_) async => avatarJson(hasTransparency: true));
      when(() => client.patch<Map<String, dynamic>>(any(), any()))
          .thenAnswer((_) async => avatarJson(hasTransparency: true, mode: 2));

      await pumpEditor(tester, hero!, AvatarSource.newImage(bytes, fileName: 'h.png'));
      expect(figureSegment(tester).enabled, isTrue);

      await tester.tap(find.text('Сохранить'));
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
      await tester.pumpAndSettle();

      verify(() => client.put<Map<String, dynamic>>('/characters/$id/avatar', any()));
      verify(() => client.patch<Map<String, dynamic>>(
          '/characters/$id/avatar', {'mode': 2, 'offsetX': 0.0, 'offsetY': 0.0, 'scale': 1.0}));
    });

    testWidgets('Слишком большой файл не отправляется', (tester) async {
      final hero = await tester.runAsync(() => character());

      await pumpEditor(
        tester,
        hero!,
        AvatarSource.newImage(Uint8List(6 * 1024 * 1024), fileName: 'big.jpg'),
      );

      expect(find.text('Файл больше 5 МБ. Выберите картинку поменьше'), findsOneWidget);
      await tester.tap(find.text('Сохранить'));
      await tester.pump();
      verifyNever(() => client.put<Map<String, dynamic>>(any(), any()));
    });
  });
}
