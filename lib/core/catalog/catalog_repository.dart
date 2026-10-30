import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:injectable/injectable.dart';

/// Справочники рас и классов.
///
/// Загружаются один раз по требованию: персонажи с сервера приходят
/// с номерами расы и класса, которые сопоставляются с этими справочниками.
@lazySingleton
class CatalogRepository {
  final IHttpClient _httpClient;

  List<Race> _races = const [];
  List<Class> _classes = const [];
  Future<void>? _loading;

  CatalogRepository(this._httpClient);

  bool get isLoaded => _races.isNotEmpty && _classes.isNotEmpty;

  List<Race> get races => _races;

  List<Class> get classes => _classes;

  /// Загружает справочники, если они ещё не загружены.
  /// При ошибке следующий вызов попробует снова.
  Future<void> ensureLoaded() {
    if (isLoaded) return Future.value();

    return _loading ??= _load().whenComplete(() => _loading = null);
  }

  /// Для тестов и офлайн-сценариев
  void setData({required List<Race> races, required List<Class> classes}) {
    _races = races;
    _classes = classes;
  }

  Future<void> _load() async {
    // Future.wait пробрасывает исходную ошибку (например, DioException),
    // чтобы пользователь увидел понятное сообщение
    final [racesRaw, classesRaw] = await Future.wait([
      _httpClient.get<List<dynamic>>('/races'),
      _httpClient.get<List<dynamic>>('/classes'),
    ]);

    _races = racesRaw.map((json) => Race.fromJson(json)).toList();
    _classes = classesRaw.map((json) => Class.fromJson(json)).toList();
  }
}
