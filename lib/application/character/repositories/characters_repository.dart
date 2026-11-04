import 'package:dio/dio.dart';
import 'package:dnd_app/application/character/models/character_avatar.dart';
import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/models/character_sheet.dart';
import 'package:dnd_app/application/character_creating/models/ability_roll.dart';
import 'package:dnd_app/application/character_creating/models/character_draft.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/http_client/empty_response_exception.dart';
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
    const path = '/characters/preview';
    final data = await _httpClient.post<Map<String, dynamic>>(
      path,
      draft.toJson(),
    );

    if (data == null) throw const EmptyResponseException(path);

    return CharacterSheet.fromJson(data);
  }

  /// Бросить 4к6 для шести характеристик на сервере
  Future<AbilityRoll> rollAbilities() async {
    const path = '/abilities/roll';
    final data = await _httpClient.post<Map<String, dynamic>>(path, null);

    if (data == null) throw const EmptyResponseException(path);

    return AbilityRoll.fromJson(data);
  }

  Future<void> saveCharacter(CharacterDraft draft) async {
    await _httpClient.post<void>('/characters/create', draft.toJson());
  }

  Future<void> deleteCharacter(String id) async {
    await _httpClient.delete<void>('/characters/$id');
  }

  /// Загрузить свою картинку персонажа. Сервер уменьшает её, поворачивает
  /// по EXIF и сам определяет, прозрачен ли фон.
  Future<CharacterAvatar> uploadAvatar(
    String characterId,
    List<int> bytes, {
    String fileName = 'avatar',
  }) async {
    final path = '/characters/$characterId/avatar';
    final data = await _httpClient.put<Map<String, dynamic>>(
      path,
      FormData.fromMap({
        'file': MultipartFile.fromBytes(bytes, filename: fileName),
      }),
    );

    if (data == null) throw EmptyResponseException(path);

    return CharacterAvatar.fromJson(data);
  }

  /// Изменить вид и кадр своей картинки
  Future<CharacterAvatar> updateAvatar(
    String characterId,
    AvatarLayout layout,
  ) async {
    final path = '/characters/$characterId/avatar';
    final data =
        await _httpClient.patch<Map<String, dynamic>>(path, layout.toJson());

    if (data == null) throw EmptyResponseException(path);

    return CharacterAvatar.fromJson(data);
  }

  /// Вернуть стандартную картинку класса
  Future<void> deleteAvatar(String characterId) async {
    await _httpClient.delete<void>('/characters/$characterId/avatar');
  }

  /// Скачать файл своей картинки
  Future<List<int>> fetchAvatarBytes(String url) => _httpClient.getBytes(url);
}
