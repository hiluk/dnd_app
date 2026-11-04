import 'package:dio/dio.dart';
import 'package:dnd_app/application/session/bloc/session_cubit.dart';
import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_event.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/application/session/repositories/session_queue_store.dart';
import 'package:dnd_app/application/session/repositories/session_repository.dart';
import 'package:dnd_app/application/session/rules/session_rules.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSessionRepository extends Mock implements SessionRepository {}

const characterId = 'c1';
const context =
    SessionContext(baseMaxHp: 55, hitDie: 12, level: 5, conModifier: 3);
final logger = Logger(level: Level.off);

/// Сервер в памяти: применяет действия по тем же правилам и помнит Id
class FakeServer {
  SessionState state = const SessionState(currentHp: 38);
  final applied = <String>{};

  ({ServerSession session, SessionEvent event}) apply(PendingAction action) {
    final result = SessionRules.apply(context, state, action.action);
    if (applied.add(action.id)) state = result.state;
    return (
      session: (context: context, state: state),
      event: SessionEvent.local(action, result).copyAsServer(),
    );
  }
}

extension on SessionEvent {
  SessionEvent copyAsServer() => SessionEvent(
        id: id,
        createdAt: createdAt,
        action: action,
        before: before,
        after: after,
        outcomes: outcomes,
        healed: healed,
        absorbed: absorbed,
      );
}

DioException offline() => DioException(
      requestOptions: RequestOptions(),
      type: DioExceptionType.connectionError,
    );

DioException rejected() => DioException(
      requestOptions: RequestOptions(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 400,
        data: {
          'title': 'Действие недоступно',
          'errors': {
            'Action': ['Персонаж погиб']
          },
        },
      ),
    );

void main() {
  late MockSessionRepository repository;
  late SessionQueueStore store;
  late FakeServer server;

  setUpAll(
      () => registerFallbackValue(PendingAction.create(const HealAction(1))));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = SessionQueueStore(await SharedPreferences.getInstance(), logger);
    repository = MockSessionRepository();
    server = FakeServer();

    when(() => repository.fetch(characterId))
        .thenAnswer((_) async => (context: context, state: server.state));
    when(() => repository.events(characterId, limit: any(named: 'limit')))
        .thenAnswer((_) async => []);
    when(() => repository.act(characterId, any()))
        .thenAnswer((call) async => server.apply(call.positionalArguments[1]));
  });

  Future<SessionCubit> loaded() async {
    final cubit = SessionCubit(characterId, repository, store, logger);
    await cubit.load();
    return cubit;
  }

  test('Действие сразу видно и подтверждается сервером', () async {
    final cubit = await loaded();

    final result = await cubit.act(const DamageAction(12));
    expect(result!.state.currentHp, 26);
    expect(cubit.state.state!.currentHp, 26);

    await cubit.flush();
    expect(cubit.state.pending, isEmpty);
    expect(cubit.state.serverState!.currentHp, 26);
    expect(cubit.state.sync, SessionSync.saved);
    expect(cubit.state.events.single.pending, isFalse);
    await cubit.close();
  });

  test('Без связи действия копятся, переживают перезапуск и уходят по порядку',
      () async {
    when(() => repository.act(characterId, any())).thenThrow(offline());
    final cubit = await loaded();

    await cubit.act(const DamageAction(10));
    await cubit.act(const HealAction(4));
    await cubit.flush();

    expect(cubit.state.sync, SessionSync.offline);
    expect(cubit.state.state!.currentHp, 32);
    expect(cubit.state.events.map((e) => e.pending), [true, true]);
    expect(store.read(characterId), hasLength(2));
    await cubit.close();

    // «Перезапуск»: связь появилась, новая копия кубита берёт очередь с устройства
    when(() => repository.act(characterId, any()))
        .thenAnswer((call) async => server.apply(call.positionalArguments[1]));
    final restarted = await loaded();
    await restarted.flush();

    expect(restarted.state.pending, isEmpty);
    expect(server.state.currentHp, 32);
    final sent =
        verify(() => repository.act(characterId, captureAny())).captured;
    expect(sent.map((a) => (a as PendingAction).action.type).toList(),
        containsAllInOrder(['damage', 'heal']));
    expect(store.read(characterId), isEmpty);
    await restarted.close();
  });

  test('Отклонённое сервером действие убирается с объяснением', () async {
    when(() => repository.act(characterId, any())).thenThrow(rejected());
    final cubit = await loaded();
    final messages = <String>[];
    final subscription = cubit.stream
        .where((s) => s.message != null)
        .listen((s) => messages.add(s.message!));

    await cubit.act(const DamageAction(5));
    await cubit.flush();
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.pending, isEmpty);
    expect(cubit.state.state!.currentHp, 38);
    expect(messages.single, contains('Персонаж погиб'));
    await subscription.cancel();
    await cubit.close();
  });

  test('Недоступное по правилам действие не уходит на сервер', () async {
    final cubit = await loaded();

    final result = await cubit.act(const DeathSaveAction(12));

    expect(result, isNull);
    expect(cubit.state.pending, isEmpty);
    verifyNever(() => repository.act(characterId, any()));
    await cubit.close();
  });
}
