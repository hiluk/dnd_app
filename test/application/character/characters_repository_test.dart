import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character_creating/models/character_draft.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
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
    repository =
        CharactersRepository(client, catalog, Logger(level: Level.off));

    when(() => client.get<List<dynamic>>('/races'))
        .thenAnswer((_) async => racesJson);
    when(() => client.get<List<dynamic>>('/classes'))
        .thenAnswer((_) async => classesJson);
    when(() => client.get<List<dynamic>>('/backgrounds'))
        .thenAnswer((_) async => backgroundsJson);
    when(() => client.get<List<dynamic>>('/characters')).thenAnswer(
      (_) async =>
          [characterJson(), characterJson(name: 'Гимли', characterClass: 1)],
    );
  });

  test('Загружает справочники и разбирает персонажей', () async {
    final characters = await repository.fetch();

    expect(characters.map((c) => c.name), ['Арагорн', 'Гимли']);
    expect(characters.first.characterRace.name, 'Человек');
    expect(characters.first.characterClass.name, 'Следопыт');
    expect(characters.first.baseStats.dexterity, 14);
    expect(characters.first.generationMethod, GenerationMethod.standardArray);
    expect(characters.first.sheet.hitPoints, 12);
    expect(characters.first.sheet.savingThrows.first.ability, Ability.strength);
    expect(characters.first.sheet.savingThrows.first.proficient, isTrue);
    expect(characters.first.background.name, 'Солдат');
    expect(characters.first.classSkills, [Skill.perception, Skill.survival]);
    expect(characters.first.sheet.skills.first.skill, Skill.athletics);
    expect(characters.last.characterClass.name, 'Воин');
  });

  test('Номера рас и классов совпадают с сервером', () async {
    when(() => client.get<List<dynamic>>('/characters')).thenAnswer(
      (_) async => [
        characterJson(characterRace: 9, characterClass: 12),
        characterJson(characterRace: 3, characterClass: 6),
      ],
    );

    final characters = await repository.fetch();

    expect(characters[0].characterRace.name, 'Тифлинг');
    expect(characters[0].characterClass.name, 'Волшебник');
    expect(characters[1].characterRace.name, 'Дварф');
    expect(characters[1].characterClass.name, 'Жрец');
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

  test('Создание отправляет черновик в формате сервера', () async {
    await catalog.ensureLoaded();
    when(() => client.post<void>('/characters/create', any()))
        .thenAnswer((_) async {});

    await repository.saveCharacter(CharacterDraft(
      name: 'Танис',
      characterRace: catalog.races[1],
      characterClass: catalog.classes[2],
      generationMethod: GenerationMethod.pointBuy,
      baseStats: const Attributes(dexterity: 15),
      bonusChoices: const [Ability.dexterity, Ability.wisdom],
      background: catalog.backgrounds.last,
      backgroundSkills: const [Skill.arcana, Skill.history],
      raceSkills: const [Skill.medicine, Skill.nature],
      classSkills: const [Skill.stealth, Skill.perception, Skill.survival],
    ));

    final body =
        verify(() => client.post<void>('/characters/create', captureAny()))
            .captured
            .single as Map<String, dynamic>;
    expect(body['name'], 'Танис');
    expect(body['characterRace'], 2);
    expect(body['characterClass'], 3);
    expect(body['generationMethod'], 2);
    expect(body['bonusChoices'], [2, 5]);
    expect((body['baseStats'] as Map)['dexterity'], 15);
    expect(body.containsKey('rollToken'), isFalse);
    expect(body['background'], 14);
    expect(body['backgroundSkills'], [3, 6]);
    expect(body['raceSkills'], [10, 11]);
    expect(body['classSkills'], [17, 12, 18]);
    expect(body['expertise'], isEmpty);
  });

  test('Превью возвращает лист с сервера', () async {
    await catalog.ensureLoaded();
    when(() => client.post<Map<String, dynamic>>('/characters/preview', any()))
        .thenAnswer((_) async => sheetJson());

    final draft = CharacterDraft(
      characterRace: catalog.races[2],
      characterClass: catalog.classes[0],
      generationMethod: GenerationMethod.standardArray,
      baseStats: const Attributes(),
    );
    // До шага навыков предыстория не отправляется
    expect(draft.toJson().containsKey('background'), isFalse);

    final sheet = await repository.preview(draft);

    expect(sheet.hitPoints, 12);
    expect(sheet.stats.constitution, 15);
    expect(sheet.modifiers.charisma, -1);
    expect(sheet.passivePerception, 10);
  });

  test('Броски возвращают значения и подпись', () async {
    when(() => client.post<Map<String, dynamic>>('/abilities/roll', null))
        .thenAnswer((_) async => {
              'values': [17, 6, 12, 9, 14, 11],
              'token': 'signed',
            });

    final roll = await repository.rollAbilities();

    expect(roll.values, [17, 6, 12, 9, 14, 11]);
    expect(roll.token, 'signed');
  });

  test('Удаление по Id', () async {
    when(() => client.delete<void>('/characters/42')).thenAnswer((_) async {});

    await repository.deleteCharacter('42');

    verify(() => client.delete<void>('/characters/42')).called(1);
  });
}
