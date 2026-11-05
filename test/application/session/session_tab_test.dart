import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/session/bloc/session_cubit.dart';
import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_event.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/application/session/presentation/session_tab.dart';
import 'package:dnd_app/application/session/repositories/session_queue_store.dart';
import 'package:dnd_app/application/session/repositories/session_repository.dart';
import 'package:dnd_app/application/session/rules/dice.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/fixtures.dart';

class MockHttpClient extends Mock implements IHttpClient {}

class MockSessionRepository extends Mock implements SessionRepository {}

class FixedDice extends Dice {
  final int value;
  FixedDice(this.value);

  @override
  int roll(int faces) => value;
}

const context =
    SessionContext(baseMaxHp: 12, hitDie: 10, level: 1, conModifier: 2);

void main() {
  late MockSessionRepository repository;
  late SessionQueueStore store;
  final logger = Logger(level: Level.off);

  setUpAll(
      () => registerFallbackValue(PendingAction.create(const HealAction(1))));

  Future<SessionCubit> pump(WidgetTester tester, SessionState state,
      {Dice? dice}) async {
    await di.reset();
    final client = MockHttpClient();
    when(() => client.get<List<dynamic>>('/races'))
        .thenAnswer((_) async => racesJson);
    when(() => client.get<List<dynamic>>('/classes'))
        .thenAnswer((_) async => classesJson);
    when(() => client.get<List<dynamic>>('/backgrounds'))
        .thenAnswer((_) async => backgroundsJson);
    when(() => client.get<Map<String, dynamic>>(any()))
        .thenAnswer((_) async => characterJson());
    final catalog = CatalogRepository(client);
    di.registerSingleton(catalog);
    final character = await tester.runAsync(
      () => CharactersRepository(client, catalog, logger).fetchById('id'),
    );

    SharedPreferences.setMockInitialValues({});
    store = SessionQueueStore(
      (await tester.runAsync(SharedPreferences.getInstance))!,
      logger,
    );
    repository = MockSessionRepository();
    when(() => repository.fetch(any()))
        .thenAnswer((_) async => (context: context, state: state));
    when(() => repository.events(any(), limit: any(named: 'limit')))
        .thenAnswer((_) async => []);
    when(() => repository.act(any(), any())).thenThrow(Exception('нет сети'));

    final cubit = SessionCubit('id', repository, store, logger);
    await tester.runAsync(cubit.load);

    tester.view.physicalSize = const Size(800, 1800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(
      theme: DndTheme().dark,
      home: Scaffold(
        body: BlocProvider.value(
          value: cubit,
          child: SessionTab(
              character: character!, onOpenJournal: () {}, dice: dice),
        ),
      ),
    ));
    await tester.pump();
    return cubit;
  }

  testWidgets('В сознании: хиты и кнопки урона и лечения', (tester) async {
    final cubit =
        await pump(tester, const SessionState(currentHp: 8, tempHp: 3));

    expect(find.bySemanticsLabel(RegExp('Хиты 8 из 12, временных 3')),
        findsOneWidget);
    expect(find.text('Урон'), findsOneWidget);
    expect(find.text('Лечение'), findsOneWidget);
    expect(find.text('Спасброски от смерти'), findsNothing);
    await cubit.close();
  });

  testWidgets('При 0 хитов — спасброски, бросок применяется сразу',
      (tester) async {
    final cubit = await pump(
        tester, const SessionState(currentHp: 0, deathFailures: 1),
        dice: FixedDice(14));

    expect(find.text('Спасброски от смерти'), findsOneWidget);
    expect(find.text('Без сознания'), findsOneWidget);

    await tester.tap(find.text('Бросить спасбросок к20'));
    await tester
        .runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
    await tester.pump();

    expect(find.bySemanticsLabel('Успехи 1 из 3'), findsOneWidget);
    expect(find.bySemanticsLabel('Провалы 1 из 3'), findsOneWidget);
    // Без связи действие ждёт в очереди
    expect(store.read('id').single.action, isA<DeathSaveAction>());
    await cubit.close();
  });

  testWidgets('Погибшему предлагается вернуть хиты', (tester) async {
    final cubit =
        await pump(tester, const SessionState(currentHp: 0, isDead: true));

    expect(find.text('Персонаж погиб'), findsOneWidget);
    expect(find.text('Вернуть хиты'), findsOneWidget);
    expect(find.text('Урон'), findsNothing);
    await cubit.close();
  });
}
