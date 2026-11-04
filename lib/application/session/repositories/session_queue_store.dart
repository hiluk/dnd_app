import 'dart:convert';

import 'package:dnd_app/application/session/models/session_event.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Неотправленные действия сессии. Хранятся на устройстве, чтобы пережить
/// перезапуск приложения без связи.
@lazySingleton
class SessionQueueStore {
  final SharedPreferences _preferences;
  final Logger _logger;

  SessionQueueStore(this._preferences, this._logger);

  static String _key(String characterId) => 'session_queue_$characterId';

  List<PendingAction> read(String characterId) {
    final raw = _preferences.getString(_key(characterId));
    if (raw == null) return [];

    try {
      return (jsonDecode(raw) as List)
          .map((e) => PendingAction.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Повреждённая очередь не должна ломать экран
      _logger.w('Не удалось прочитать очередь действий: $e');
      return [];
    }
  }

  Future<void> write(String characterId, List<PendingAction> actions) async {
    if (actions.isEmpty) {
      await _preferences.remove(_key(characterId));
      return;
    }
    await _preferences.setString(
      _key(characterId),
      jsonEncode(actions.map((a) => a.toJson()).toList()),
    );
  }
}
