import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character_creating/models/character_dto.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/fixtures.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient client;
  late CatalogRepository catalog;
  late CharactersRepository repository;

  setUp(() async {
    await di.reset();
    client = MockHttpClient();
    catalog = CatalogRepository(client);
    di.registerSingleton(catalog);
    repository = CharactersRepository(client, catalog, Logger(level: Level.off));

    when(() => client.get<List<dynamic>>('/races'))
        .thenAnswer((_) async => racesJson);
    when(() => client.get<List<dynamic>>('/classes'))
        .thenAnswer((_) async => classesJson);
    when(() => client.get<List<dynamic>>('/characters')).thenAnswer(
      (_) async => [characterJson(), characterJson(name: 'Гимли', characterClass: 1)],
    );
  });

  test('Загружает справочники и разбирает персонажей', () async {
    final characters = await repository.fetch();

    expect(characters.map((c) => c.name), ['Арагорн', 'Гимли']);
    expect(characters.first.characterRace.name, 'Человек');
    expect(characters.first.characterClass.name, 'Рейнджер');
    expect(characters.first.characterStats.dexterity, 14);
    expect(characters.last.characterClass.name, 'Воин');
  });

  test('Справочники загружаются один раз', () async {
    await repository.fetch();
    await repository.fetch();

    verify(() => client.get<List<dynamic>>('/races')).called(1);
    verify(() => client.get<List<dynamic>>('/classes')).called(1);
  });

  test('После ошибки загрузки справочников следующий вызов повторяет запрос',
      () async {
    var attempt = 0;
    when(() => client.get<List<dynamic>>('/races')).thenAnswer((_) async {
      if (attempt++ == 0) throw Exception('offline');
      return racesJson;
    });

    await expectLater(repository.fetch(), throwsException);
    expect(await repository.fetch(), hasLength(2));
  });

  test('Персонаж по Id', () async {
    when(() => client.get<Map<String, dynamic>>('/characters/42'))
        .thenAnswer((_) async => characterJson(id: '42'));

    final character = await repository.fetchById('42');

    expect(character.id, '42');
  });

  test('Создание отправляет номера расы и класса', () async {
    await catalog.ensureLoaded();
    when(() => client.post<void>('/characters/create', any()))
        .thenAnswer((_) async {});

    await repository.saveCharacter(CharacterDto(
      name: 'Леголас',
      characterRace: catalog.races[1],
      characterClass: catalog.classes[2],
      characterStats: const Attributes(dexterity: 15),
    ));

    final body = verify(() => client.post<void>('/characters/create', captureAny()))
        .captured
        .single as Map<String, dynamic>;
    expect(body['name'], 'Леголас');
    expect(body['characterRace'], 2);
    expect(body['characterClass'], 3);
    expect((body['characterStats'] as Map)['dexterity'], 15);
  });

  test('Удаление по Id', () async {
    when(() => client.delete<void>('/characters/42'))
        .thenAnswer((_) async {});

    await repository.deleteCharacter('42');

    verify(() => client.delete<void>('/characters/42')).called(1);
  });
}
