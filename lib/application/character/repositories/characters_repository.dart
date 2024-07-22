import 'dart:async';

import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

class CharactersRepository {
  final IHttpClient httpClient;
  const CharactersRepository(this.httpClient);

  Future<List<Character>> fetch() async {
    final data = await httpClient.get('/characters');
    final charactersRaw = data as List<dynamic>;

    return charactersRaw.map((json) => Character.fromJson(json)).toList();
  }

  FutureOr<Character> fetchByName({
    required String email,
    required String name,
  }) async {
    final data = await httpClient.post(
      '/characters/get-by-name',
      {"name": name},
    );

    return Character.fromJson(data);
  }

  Future<void> saveCharacter(Character character) async {
    await httpClient.post(
      '/characters/create',
      character.toJson(),
    );
  }
}
