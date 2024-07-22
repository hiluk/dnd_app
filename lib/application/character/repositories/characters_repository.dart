import 'dart:async';

import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/models/character_request.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

class CharactersRepository {
  final IHttpClient httpClient;
  const CharactersRepository(this.httpClient);

  Future<List<Character>> fetch() async {
    final data = await httpClient.post(
      '/characters',
      '"kestos1243@mail.ru"',
      {"Content-Type": "application/json", "Accept": "application/json"},
    );
    final charactersRaw = data as List<dynamic>;

    return charactersRaw.map((json) => Character.fromJson(json)).toList();
  }

  FutureOr<Character> fetchByName({
    required String email,
    required String name,
  }) async {
    final data = await httpClient.post(
      '/characters/get-by-name',
      {"email": email, "name": name},
      {"Content-Type": "application/json", "Accept": "application/json"},
    );

    return Character.fromJson(data);
  }

  Future<void> saveCharacter(Character character) async {
    await httpClient.post(
      '/characters/create',
      CharacterRequest(
        email: 'kestos1243@mail.ru',
        character: character,
      ).toJson(),
    );
  }
}
