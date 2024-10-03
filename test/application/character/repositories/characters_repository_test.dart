import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/character_creating/models/character_dto.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/mock_di.dart';
import '../models/character_mock.dart';

void main() {
  late CharactersRepository repository;
  late IHttpClient client;
  late List<Map<String, dynamic>> charactersFromApi;
  late List<Character> parsedApiCharacters;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    await configureMockDependencies();
    await mockDi.allReady();

    client = di.get<IHttpClient>();
    repository = CharactersRepository(client, Logger());
    charactersFromApi = [CharacterMock(name: 'oldCharacter').toJson()];

    when(
      () => client.get('/characters'),
    ).thenAnswer((_) async => charactersFromApi);

    when(
      () => client.post('/characters/create', any()),
    ).thenAnswer(
      (_) async => charactersFromApi.add(CharacterMock(
        name: 'newCharacter',
      ).toJson()),
    );
  });

  test('При вызове Fetch возвращает список персонажей', () async {
    parsedApiCharacters = charactersFromApi
        .map(
          (e) => Character.fromJson(e),
        )
        .toList();

    final actualList = await repository.fetch();

    expect(actualList, orderedEquals(parsedApiCharacters));
  });

  test('При вызове Save создаст нового персонажа', () async {
    await repository.saveCharacter(
      CharacterDto(characterStats: const Attributes()),
    );

    final actualList = await repository.fetch();

    expect(actualList.last.name, equals('newCharacter'));
  });
}
