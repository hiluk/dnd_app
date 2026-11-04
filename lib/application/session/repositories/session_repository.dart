import 'package:dnd_app/application/session/models/session_event.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/core/http_client/empty_response_exception.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:injectable/injectable.dart';

/// Сессия с сервера: правила-контекст и состояние
typedef ServerSession = ({SessionContext context, SessionState state});

@injectable
class SessionRepository {
  final IHttpClient _httpClient;

  const SessionRepository(this._httpClient);

  Future<ServerSession> fetch(String characterId) async {
    final json = await _httpClient
        .get<Map<String, dynamic>>('/characters/$characterId/session');

    return _session(json);
  }

  /// Отправить действие. Повтор с тем же Id сервер не применяет второй раз.
  Future<({ServerSession session, SessionEvent event})> act(
    String characterId,
    PendingAction action,
  ) async {
    final path = '/characters/$characterId/actions';
    final json =
        await _httpClient.post<Map<String, dynamic>>(path, action.toJson());
    if (json == null) throw EmptyResponseException(path);

    return (
      session: _session(json['session']),
      event: SessionEvent.fromJson(json['event']),
    );
  }

  /// Журнал от новых к старым
  Future<List<SessionEvent>> events(
    String characterId, {
    DateTime? before,
    int limit = 50,
  }) async {
    final json = await _httpClient.get<List<dynamic>>(
      '/characters/$characterId/events',
      {
        'limit': limit,
        if (before != null) 'before': before.toUtc().toIso8601String(),
      },
    );

    return json
        .map((e) => SessionEvent.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static ServerSession _session(Map<String, dynamic> json) => (
        context: SessionContext(
          baseMaxHp: (json['baseMaxHp'] as num).toInt(),
          hitDie: (json['hitDie'] as num).toInt(),
          level: (json['hitDiceTotal'] as num).toInt(),
          conModifier: (json['conModifier'] as num).toInt(),
        ),
        state: SessionState.fromJson(json),
      );
}
