import 'dart:async';

import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character_creating/models/character_dto.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

class CharactersRepository {
  final IHttpClient httpClient;
  const CharactersRepository(this.httpClient);

  Future<List<Character>> fetch() async {
    try {
      final data = await httpClient.get('/characters');
      final charactersRaw = data as List<dynamic>;

      return charactersRaw.map((json) => Character.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<Character> fetchById(String id) async {
    try {
      final data = await httpClient.get('/characters/$id');

      return Character.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveCharacter(CharacterDto character) async {
    try {
      await httpClient.post('/characters/create', character.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
