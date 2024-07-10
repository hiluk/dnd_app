import 'dart:async';

import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/core/http_client/interfaces/i_http_client.dart';

class CharactersRepository {
  final IHttpClient httpClient;
  const CharactersRepository(this.httpClient);

  Future<List<Character>> fetch() async {
    final data = await httpClient.post(
      '/api/v1/character/GetAllUserCharacters',
      'kestos1243@mail.ru',
    );
    final charactersRaw = data as List<dynamic>;

    return charactersRaw.map((json) => Character.fromJson(json)).toList();
  }
}
