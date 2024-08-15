import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/character_creating/models/character_dto.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/mock_di.dart';
import '../models/character_mock.dart';

void main() {
  late CharactersRepository repository;
  late IHttpClient client;
  late List<Map<String, dynamic>> charactersFromApi;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    await configureMockDependencies();
    await mockDi.allReady();

    client = di.get<IHttpClient>();
    repository = CharactersRepository(client);
    charactersFromApi = [
      CharacterMock().toJson(),
    ];

    when(
      () => client.get('/characters'),
    ).thenAnswer((_) async => charactersFromApi);

    when(
      () => client.post('/characters/create', any()),
    ).thenAnswer((_) async => charactersFromApi.add(CharacterMock().toJson()));
  });

  test('При вызове Fetch возвращает список персонажей', () async {
    final characters = charactersFromApi
        .map(
          (e) => Character.fromJson(e),
        )
        .toList();

    final newList = await repository.fetch();

    expect(characters, newList);
  });

  test('При вызове Save создаст нового персонажа', () async {
    await repository.saveCharacter(
      CharacterDto(characterStats: const Attributes()),
    );

    final characters = charactersFromApi
        .map(
          (e) => Character.fromJson(e),
        )
        .toList();

    final newList = await repository.fetch();

    expect(characters, newList);
  });
}
