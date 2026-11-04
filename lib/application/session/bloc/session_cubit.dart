import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_event.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/application/session/repositories/session_queue_store.dart';
import 'package:dnd_app/application/session/repositories/session_repository.dart';
import 'package:dnd_app/application/session/rules/session_rules.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// Связь с сервером
enum SessionSync {
  /// Всё отправлено
  saved,

  /// Отправляем очередь
  sending,

  /// Нет связи: действия ждут в очереди
  offline,
}

class SessionViewState {
  final bool isLoading;

  /// Ошибка загрузки; экран показывает её вместо сессии
  final String? loadError;

  final SessionContext? context;

  /// Состояние, подтверждённое сервером
  final SessionState? serverState;

  /// Действия, которые ещё не подтвердил сервер
  final List<PendingAction> pending;

  /// Журнал с сервера, от новых к старым
  final List<SessionEvent> serverEvents;

  final bool hasMoreEvents;
  final SessionSync sync;

  /// Разовое сообщение: действие отклонено
  final String? message;

  const SessionViewState({
    this.isLoading = true,
    this.loadError,
    this.context,
    this.serverState,
    this.pending = const [],
    this.serverEvents = const [],
    this.hasMoreEvents = false,
    this.sync = SessionSync.saved,
    this.message,
  });

  /// Что показываем: подтверждённое состояние плюс действия из очереди
  SessionState? get state => _replay.state;

  /// Журнал: неотправленные действия сверху
  List<SessionEvent> get events =>
      [..._replay.events.reversed, ...serverEvents];

  int get maxHp => SessionRules.maxHp(
      context!, state?.exhaustion ?? serverState!.exhaustion);

  ({SessionState? state, List<SessionEvent> events}) get _replay {
    final context = this.context;
    var state = serverState;
    final events = <SessionEvent>[];
    if (context == null || state == null) return (state: state, events: events);

    for (final action in pending) {
      try {
        final result = SessionRules.apply(context, state!, action.action);
        state = result.state;
        events.add(SessionEvent.local(action, result));
      } on SessionRulesException {
        // Сервер успел изменить состояние, и действие стало недоступно:
        // сервер его отклонит, а показываем без него
      }
    }

    return (state: state, events: events);
  }

  SessionViewState copyWith({
    bool? isLoading,
    String? loadError,
    SessionContext? context,
    SessionState? serverState,
    List<PendingAction>? pending,
    List<SessionEvent>? serverEvents,
    bool? hasMoreEvents,
    SessionSync? sync,
    String? message,
  }) =>
      SessionViewState(
        isLoading: isLoading ?? this.isLoading,
        loadError: loadError,
        context: context ?? this.context,
        serverState: serverState ?? this.serverState,
        pending: pending ?? this.pending,
        serverEvents: serverEvents ?? this.serverEvents,
        hasMoreEvents: hasMoreEvents ?? this.hasMoreEvents,
        sync: sync ?? this.sync,
        message: message,
      );
}

/// Игровая сессия персонажа. Действие сразу применяется на устройстве
/// по тем же правилам, что на сервере, и попадает в очередь. Очередь
/// хранится на устройстве и отправляется по порядку; без связи —
/// повторяем позже.
class SessionCubit extends Cubit<SessionViewState> {
  static const eventsPage = 50;
  static const retryDelay = Duration(seconds: 15);

  final String characterId;
  final SessionRepository _repository;
  final SessionQueueStore _queue;
  final Logger _logger;

  Timer? _retry;

  /// Идущая отправка очереди: повторный вызов ждёт её, а не запускает вторую
  Future<void>? _flushing;

  SessionCubit(
    this.characterId,
    this._repository,
    this._queue,
    this._logger,
  ) : super(const SessionViewState());

  Future<void> load() async {
    emit(state.copyWith(
      isLoading: true,
      pending: _queue.read(characterId),
    ));

    try {
      final session = await _repository.fetch(characterId);
      final events = await _repository.events(characterId, limit: eventsPage);
      emit(state.copyWith(
        isLoading: false,
        context: session.context,
        serverState: session.state,
        serverEvents: events,
        hasMoreEvents: events.length == eventsPage,
      ));
      await flush();
    } catch (e) {
      _logger.w('Не удалось загрузить сессию: $e');
      emit(state.copyWith(isLoading: false, loadError: apiErrorMessage(e)));
    }
  }

  /// Применить действие. Возвращает итог, посчитанный на устройстве,
  /// или null, если действие недоступно по правилам.
  Future<SessionResult?> act(SessionAction action) async {
    final context = state.context;
    final current = state.state;
    if (context == null || current == null) return null;

    final SessionResult result;
    try {
      result = SessionRules.apply(context, current, action);
    } on SessionRulesException catch (e) {
      emit(state.copyWith(message: e.message));
      return null;
    }

    final pending = [...state.pending, PendingAction.create(action)];
    emit(state.copyWith(pending: pending));
    await _queue.write(characterId, pending);
    unawaited(flush());

    return result;
  }

  /// Отправить очередь по порядку
  Future<void> flush() {
    if (isClosed) return Future.value();
    return _flushing ??= _send().whenComplete(() => _flushing = null);
  }

  Future<void> _send() async {
    _retry?.cancel();

    {
      while (state.pending.isNotEmpty && !isClosed) {
        emit(state.copyWith(sync: SessionSync.sending));
        final action = state.pending.first;

        try {
          final response = await _repository.act(characterId, action);
          final events = [
            response.event,
            ...state.serverEvents.where((e) => e.id != response.event.id),
          ];
          await _remove(action,
              serverState: response.session.state, events: events);
        } on DioException catch (e) {
          final status = e.response?.statusCode;
          if (status == 400) {
            // Сервер не принял действие: убираем его и показываем причину
            _logger.w(
                'Действие ${action.action.type} отклонено: ${e.response?.data}');
            await _remove(action,
                message: 'Действие отменено: ${apiErrorMessage(e)}');
            continue;
          }
          if (status == 404) {
            await _remove(action);
            continue;
          }

          // Нет связи или сервер недоступен: попробуем позже
          _offline();
          return;
        } catch (e) {
          // Неожиданная ошибка: очередь не теряем, повторим позже
          _logger.w('Не удалось отправить действие: $e');
          _offline();
          return;
        }
      }

      if (!isClosed) emit(state.copyWith(sync: SessionSync.saved));
    }
  }

  void _offline() {
    emit(state.copyWith(sync: SessionSync.offline));
    _retry = Timer(retryDelay, flush);
  }

  /// Подгрузить более старые записи журнала
  Future<void> loadMoreEvents() async {
    final last = state.serverEvents.lastOrNull;
    if (last == null || !state.hasMoreEvents) return;

    try {
      final older = await _repository.events(
        characterId,
        before: last.createdAt,
        limit: eventsPage,
      );
      emit(state.copyWith(
        serverEvents: [...state.serverEvents, ...older],
        hasMoreEvents: older.length == eventsPage,
      ));
    } catch (e) {
      emit(state.copyWith(message: apiErrorMessage(e)));
    }
  }

  Future<void> _remove(
    PendingAction action, {
    SessionState? serverState,
    List<SessionEvent>? events,
    String? message,
  }) async {
    final pending = state.pending.where((a) => a.id != action.id).toList();
    await _queue.write(characterId, pending);
    emit(state.copyWith(
      pending: pending,
      serverState: serverState,
      serverEvents: events,
      message: message,
    ));
  }

  @override
  Future<void> close() {
    _retry?.cancel();
    return super.close();
  }
}
