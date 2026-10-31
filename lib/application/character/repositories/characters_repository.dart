import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/models/character_sheet.dart';
import 'package:dnd_app/application/character_creating/models/ability_roll.dart';
import 'package:dnd_app/application/character_creating/models/character_draft.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class CharactersRepository {
  final IHttpClient _httpClient;
  final CatalogRepository _catalog;
  final Logger _logger;

  const CharactersRepository(this._httpClient, this._catalog, this._logger);

  Future<List<Character>> fetch() async {
    // Персонажи ссылаются на расы и классы из справочника
    await _catalog.ensureLoaded();
    final charactersRaw = await _httpClient.get<List<dynamic>>('/characters');

    _logger.i('Получено персонажей: ${charactersRaw.length}');
    return charactersRaw.map((json) => Character.fromJson(json)).toList();
  }

  Future<Character> fetchById(String id) async {
    await _catalog.ensureLoaded();
    final data = await _httpClient.get<Map<String, dynamic>>('/characters/$id');

    return Character.fromJson(data);
  }

  /// Проверить черновик по правилам и получить лист, ничего не сохраняя.
  /// Нарушение правил приходит как DioException с кодом 400.
  Future<CharacterSheet> preview(CharacterDraft draft) async {
    final data = await _httpClient.post<Map<String, dynamic>>(
      '/characters/preview',
      draft.toJson(),
    );

    return CharacterSheet.fromJson(data!);
  }

  /// Бросить 4к6 для шести характеристик на сервере
  Future<AbilityRoll> rollAbilities() async {
    final data =
        await _httpClient.post<Map<String, dynamic>>('/abilities/roll', null);

    return AbilityRoll.fromJson(data!);
  }

  Future<void> saveCharacter(CharacterDraft draft) async {
    await _httpClient.post<void>('/characters/create', draft.toJson());
  }

  Future<void> deleteCharacter(String id) async {
    await _httpClient.delete<void>('/characters/$id');
  }
}
