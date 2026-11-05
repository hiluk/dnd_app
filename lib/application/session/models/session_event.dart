import 'dart:math';

import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_models.dart';

/// Действие, сделанное на устройстве. Id выдаёт клиент: сервер по нему
/// не применяет повтор, поэтому очередь можно отправлять сколько угодно раз.
class PendingAction {
  final String id;
  final DateTime createdAt;
  final SessionAction action;

  const PendingAction(this.id, this.createdAt, this.action);

  factory PendingAction.create(SessionAction action) =>
      PendingAction(newActionId(), DateTime.now().toUtc(), action);

  factory PendingAction.fromJson(Map<String, dynamic> json) => PendingAction(
        json['id'] as String,
        DateTime.parse(json['createdAt'] as String),
        SessionAction.fromJson(json),
      );

  /// Тело запроса к серверу
  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        ...action.toJson(),
      };
}

/// Запись журнала: с сервера или ещё не отправленная ([pending])
class SessionEvent {
  final String id;
  final DateTime createdAt;
  final SessionAction action;
  final SessionState before;
  final SessionState after;
  final List<SessionOutcome> outcomes;
  final int healed;
  final int absorbed;
  final bool pending;

  const SessionEvent({
    required this.id,
    required this.createdAt,
    required this.action,
    required this.before,
    required this.after,
    this.outcomes = const [],
    this.healed = 0,
    this.absorbed = 0,
    this.pending = false,
  });

  factory SessionEvent.fromJson(Map<String, dynamic> json) => SessionEvent(
        id: json['id'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        action: SessionAction.fromJson(json),
        before: SessionState.fromJson(json['before']),
        after: SessionState.fromJson(json['after']),
        outcomes: [
          for (final name
              in (json['outcomes'] as List? ?? const []).cast<String>())
            if (SessionOutcome.byName(name) case final outcome?) outcome,
        ],
        healed: (json['healed'] as num?)?.toInt() ?? 0,
        absorbed: (json['absorbed'] as num?)?.toInt() ?? 0,
      );

  /// Запись для действия, посчитанного на устройстве
  factory SessionEvent.local(PendingAction pending, SessionResult result) =>
      SessionEvent(
        id: pending.id,
        createdAt: pending.createdAt,
        action: pending.action,
        before: result.before,
        after: result.state,
        outcomes: result.outcomes,
        healed: result.healed,
        absorbed: result.absorbed,
        pending: true,
      );
}

/// Случайный UUID v4 для Id действия
String newActionId() {
  final random = Random.secure();
  final bytes = List<int>.generate(16, (_) => random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-'
      '${hex.substring(16, 20)}-${hex.substring(20)}';
}
