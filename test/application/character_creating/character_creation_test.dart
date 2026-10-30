import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character_creating/bloc/attributes_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/application/character_creating/models/character_dto.dart';
import 'package:dnd_app/application/character_creating/presentation/character_creation_screen.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/character_creating_preview.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/character_stats_create_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/fixtures.dart' as fixtures;

class MockCharactersRepository extends Mock implements CharactersRepository {}

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockCharactersRepository repository;
  late CatalogRepository catalog;
  final logger = Logger(level: Level.off);

  setUpAll(() {
    registerFallbackValue(CharacterDto(characterStats: const Attributes()));
  });

  setUp(() async {
    await di.reset();
    catalog = CatalogRepository(MockHttpClient())
      ..setData(races: fixtures.races, classes: fixtures.classes);
    di.registerSingleton(catalog);
    repository = MockCharactersRepository();
    when(() => repository.fetch()).thenAnswer((_) async => []);
  });

  group('CharacterCreationBloc', () {
    test('Select добавляет выбор и запоминает предыдущее состояние', () async {
      final bloc = CharacterCreationBloc(repository, logger);
      final initial = bloc.state;

      bloc.add(CharacterCreationBlocEventSelect(
        characterRace: catalog.races.first,
      ));
      await pumpEventQueue();

      expect(bloc.state.characterRace, catalog.races.first);
      expect(bloc.state.previousState, initial);

      bloc.add(CharacterCreationBlocEventReturn());
      await pumpEventQueue();

      expect(bloc.state, initial);
    });

    test('Успешное сохранение выставляет isCreated', () async {
      when(() => repository.saveCharacter(any())).thenAnswer((_) async {});
      final bloc = CharacterCreationBloc(repository, logger);

      bloc.add(CharacterCreationBlocEventCreate(
        CharacterDto(name: 'Гимли', characterStats: const Attributes()),
      ));
      await pumpEventQueue();

      expect(bloc.state.isCreated, isTrue);
      expect(bloc.state.isLoading, isFalse);
    });

    test('Ошибка сохранения отдаёт сообщение', () async {
      when(() => repository.saveCharacter(any())).thenThrow(Exception());
      final bloc = CharacterCreationBloc(repository, logger);

      bloc.add(CharacterCreationBlocEventCreate(
        CharacterDto(name: 'Гимли', characterStats: const Attributes()),
      ));
      await pumpEventQueue();

      expect(bloc.state.isCreated, isFalse);
      expect(bloc.state.errorMessage, isNotNull);
    });
  });

  group('Экран создания персонажа', () {
    Future<CharacterCreationBloc> pumpScreen(
      WidgetTester tester, {
      CharacterCreationBlocEventSelect? select,
    }) async {
      final bloc = CharacterCreationBloc(repository, logger);
      if (select != null) bloc.add(select);

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => CharactersBloc(charactersRepository: repository),
              ),
              BlocProvider.value(value: bloc),
              BlocProvider(create: (_) => RaceCubit()),
              BlocProvider(create: (_) => ClassCubit()),
              BlocProvider(create: (_) => StatsCubit()),
            ],
            child: const CharacterCreationScreen(),
          ),
        ),
      );
      await tester.pump();
      return bloc;
    }

    testWidgets('Сначала выбирается раса', (tester) async {
      await pumpScreen(tester);

      expect(find.byType(RacesListView), findsOneWidget);
      expect(find.text('Выбор расы'), findsOneWidget);
    });

    testWidgets('После расы выбирается класс', (tester) async {
      await pumpScreen(
        tester,
        select: CharacterCreationBlocEventSelect(
          characterRace: catalog.races.first,
        ),
      );

      expect(find.byType(ClassesListView), findsOneWidget);
    });

    testWidgets('После класса выбираются характеристики', (tester) async {
      await pumpScreen(
        tester,
        select: CharacterCreationBlocEventSelect(
          characterRace: catalog.races.first,
          characterClass: catalog.classes.first,
        ),
      );

      expect(find.byType(CharacterStatsCreateView), findsOneWidget);
    });

    testWidgets('В конце показывается превью', (tester) async {
      await pumpScreen(
        tester,
        select: CharacterCreationBlocEventSelect(
          characterRace: catalog.races.first,
          characterClass: catalog.classes.first,
          characterStats: const Attributes(),
        ),
      );

      expect(find.byType(CharacterCreatingPreview), findsOneWidget);
    });
  });
}
