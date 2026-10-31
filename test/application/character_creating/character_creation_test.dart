import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character/models/character_sheet.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/application/character_creating/models/ability_roll.dart';
import 'package:dnd_app/application/character_creating/models/character_draft.dart';
import 'package:dnd_app/application/character_creating/presentation/character_creation_screen.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/assignment_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bonus_choice_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/character_creating_preview.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/method_select_view.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
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
  final sheet = CharacterSheet.fromJson(fixtures.sheetJson());

  setUpAll(() {
    registerFallbackValue(CharacterDraft(
      characterRace: fixtures.races.first,
      characterClass: fixtures.classes.first,
      generationMethod: GenerationMethod.standardArray,
      baseStats: const Attributes(),
    ));
  });

  setUp(() async {
    await di.reset();
    catalog = CatalogRepository(MockHttpClient())
      ..setData(races: fixtures.races, classes: fixtures.classes);
    di.registerSingleton(catalog);
    repository = MockCharactersRepository();
    when(() => repository.fetch()).thenAnswer((_) async => []);
    when(() => repository.preview(any())).thenAnswer((_) async => sheet);
  });

  race(String name) => catalog.races.firstWhere((r) => r.name == name);

  group('AssignmentCubit', () {
    test('Покупка очков: старт с 8, бюджет 27', () {
      final cubit = AssignmentCubit(repository)
        ..start(GenerationMethod.pointBuy);

      expect(cubit.state.remainingPoints, 27);
      expect(cubit.state.isComplete, isTrue);

      // 8 → 15 стоит 9 очков, три характеристики — весь бюджет
      for (final ability in [
        Ability.strength,
        Ability.dexterity,
        Ability.constitution
      ]) {
        for (var i = 0; i < 7; i++) {
          cubit.increment(ability);
        }
      }

      expect(cubit.state.remainingPoints, 0);
      expect(cubit.state.canIncrement(Ability.wisdom), isFalse);
      cubit.increment(Ability.wisdom);
      expect(cubit.state.valueOf(Ability.wisdom), 8);
      expect(cubit.state.baseStats!.strength, 15);
    });

    test('Покупка очков: не выше 15 и не ниже 8', () {
      final cubit = AssignmentCubit(repository)
        ..start(GenerationMethod.pointBuy);

      cubit.decrement(Ability.strength);
      expect(cubit.state.valueOf(Ability.strength), 8);

      for (var i = 0; i < 10; i++) {
        cubit.increment(Ability.strength);
      }
      expect(cubit.state.valueOf(Ability.strength), 15);
    });

    test('Стандартный набор: каждое значение используется один раз', () {
      final cubit = AssignmentCubit(repository)
        ..start(GenerationMethod.standardArray);

      cubit.assign(Ability.strength, 0); // 15
      expect(cubit.state.availableFor(Ability.dexterity), isNot(contains(0)));
      expect(cubit.state.availableFor(Ability.strength), contains(0));

      // Тот же индекс другой характеристике — снимается с прежней
      cubit.assign(Ability.dexterity, 0);
      expect(cubit.state.assigned[Ability.strength], isNull);
      expect(cubit.state.valueOf(Ability.dexterity), 15);
      expect(cubit.state.isComplete, isFalse);

      for (final (i, ability) in Ability.values.indexed) {
        cubit.assign(ability, i);
      }
      expect(cubit.state.isComplete, isTrue);
      expect(Ability.values.map(cubit.state.baseStats!.valueOf),
          [15, 14, 13, 12, 10, 8]);
    });

    test('Броски: значения с сервера, переброс сбрасывает распределение',
        () async {
      var call = 0;
      when(() => repository.rollAbilities())
          .thenAnswer((_) async => AbilityRoll(
                values: call++ == 0
                    ? [12, 12, 9, 17, 6, 14]
                    : [10, 10, 10, 10, 10, 10],
                token: 'token$call',
              ));
      final cubit = AssignmentCubit(repository)..start(GenerationMethod.roll);

      await cubit.roll();
      expect(cubit.state.pool, [12, 12, 9, 17, 6, 14]);
      // Повторяющиеся значения назначаются независимо
      cubit.assign(Ability.strength, 0);
      cubit.assign(Ability.dexterity, 1);
      expect(cubit.state.valueOf(Ability.dexterity), 12);

      await cubit.roll();
      expect(cubit.state.assigned, isEmpty);
      expect(cubit.state.rollToken, 'token2');
    });
  });

  test('BonusChoiceCubit не даёт выбрать больше нужного', () {
    final cubit = BonusChoiceCubit()
      ..toggle(Ability.strength, max: 2)
      ..toggle(Ability.wisdom, max: 2)
      ..toggle(Ability.dexterity, max: 2);

    expect(cubit.state, [Ability.strength, Ability.wisdom]);

    cubit.toggle(Ability.strength, max: 2);
    expect(cubit.state, [Ability.wisdom]);
  });

  group('CharacterCreationBloc', () {
    Future<CharacterCreationBloc> throughAssignment(String name) async {
      final bloc = CharacterCreationBloc(repository, logger)
        ..add(CharacterCreationBlocEventSelect(characterRace: race(name)))
        ..add(CharacterCreationBlocEventSelect(
            characterClass: catalog.classes.first))
        ..add(CharacterCreationBlocEventSelect(
          generationMethod: GenerationMethod.standardArray,
        ));
      await pumpEventQueue();
      expect(bloc.state.step, CreationStep.assignment);

      bloc.add(CharacterCreationBlocEventSelect(
        baseStats: const Attributes(
          strength: 15,
          dexterity: 14,
          constitution: 13,
          intelligence: 12,
          wisdom: 10,
          charisma: 8,
        ),
      ));
      await pumpEventQueue();
      return bloc;
    }

    test('Дварф: после распределения сразу итог и превью с сервера', () async {
      final bloc = await throughAssignment('Дварф');

      expect(bloc.state.step, CreationStep.summary);
      expect(bloc.state.sheet, sheet);
      verify(() => repository.preview(any())).called(1);
    });

    test('Полуэльф: есть шаг выбора бонусов', () async {
      final bloc = await throughAssignment('Полуэльф');

      expect(bloc.state.step, CreationStep.bonusChoice);
      expect(bloc.state.requiredBonusChoices, 2);
      expect(bloc.state.fixedBonusAbilities, {Ability.charisma});

      bloc.add(CharacterCreationBlocEventSelect(
        bonusChoices: const [Ability.strength, Ability.wisdom],
      ));
      await pumpEventQueue();
      expect(bloc.state.step, CreationStep.summary);
      expect(
          bloc.state.draft()!.bonusChoices, [Ability.strength, Ability.wisdom]);
    });

    test('Назад возвращает предыдущий шаг', () async {
      final bloc = await throughAssignment('Дварф');

      bloc.add(CharacterCreationBlocEventReturn());
      await pumpEventQueue();

      expect(bloc.state.step, CreationStep.assignment);
    });

    test('Создание отправляет черновик с именем', () async {
      when(() => repository.saveCharacter(any())).thenAnswer((_) async {});
      final bloc = await throughAssignment('Дварф');

      bloc.add(CharacterCreationBlocEventCreate('  Торин '));
      await pumpEventQueue();

      expect(bloc.state.isCreated, isTrue);
      final draft = verify(() => repository.saveCharacter(captureAny()))
          .captured
          .single as CharacterDraft;
      expect(draft.name, 'Торин');
      expect(draft.generationMethod, GenerationMethod.standardArray);
    });

    test('Ошибка правил в превью показывается, лист сбрасывается', () async {
      when(() => repository.preview(any())).thenThrow(Exception());
      final bloc = await throughAssignment('Дварф');

      expect(bloc.state.sheet, isNull);
      expect(bloc.state.previewError, isNotNull);
    });
  });

  group('Экран создания персонажа', () {
    Future<void> pumpScreen(
      WidgetTester tester,
      List<CharacterCreationBlocEventSelect> steps,
    ) async {
      final bloc = CharacterCreationBloc(repository, logger);
      for (final step in steps) {
        bloc.add(step);
      }

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
              BlocProvider(
                create: (_) => AssignmentCubit(repository)
                  ..start(GenerationMethod.pointBuy),
              ),
              BlocProvider(create: (_) => BonusChoiceCubit()),
            ],
            child: const CharacterCreationScreen(),
          ),
        ),
      );
      // Шаг строится на следующем кадре, превью запрашивается через 300 мс
      // после него, а ответ приходит асинхронно
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pump();
    }

    final dwarfSteps = [
      CharacterCreationBlocEventSelect(characterRace: fixtures.races[2]),
      CharacterCreationBlocEventSelect(characterClass: fixtures.classes.first),
    ];

    testWidgets('Сначала выбирается раса', (tester) async {
      await pumpScreen(tester, []);

      expect(find.byType(RacesListView), findsOneWidget);
    });

    testWidgets('Затем класс', (tester) async {
      await pumpScreen(tester, dwarfSteps.take(1).toList());

      expect(find.byType(ClassesListView), findsOneWidget);
    });

    testWidgets('Затем способ генерации', (tester) async {
      await pumpScreen(tester, dwarfSteps);

      expect(find.byType(MethodSelectView), findsOneWidget);
      expect(find.text('Покупка очков'), findsOneWidget);
    });

    testWidgets('Покупка очков показывает остаток и итог с сервера',
        (tester) async {
      await pumpScreen(tester, [
        ...dwarfSteps,
        CharacterCreationBlocEventSelect(
          generationMethod: GenerationMethod.pointBuy,
        ),
      ]);

      expect(find.byType(AssignmentView), findsOneWidget);
      expect(find.text('Осталось очков: 27 из 27'), findsOneWidget);
      expect(find.textContaining('Хиты 12'), findsOneWidget);
    });

    testWidgets('Полуэльф выбирает бонусы', (tester) async {
      await pumpScreen(tester, [
        CharacterCreationBlocEventSelect(characterRace: fixtures.races[1]),
        CharacterCreationBlocEventSelect(
            characterClass: fixtures.classes.first),
        CharacterCreationBlocEventSelect(
          generationMethod: GenerationMethod.pointBuy,
        ),
        CharacterCreationBlocEventSelect(baseStats: const Attributes()),
      ]);

      expect(find.byType(BonusChoiceView), findsOneWidget);
      expect(find.text('Уже увеличена расой'), findsOneWidget);
    });

    testWidgets('В конце итог с листом и именем', (tester) async {
      await pumpScreen(tester, [
        ...dwarfSteps,
        CharacterCreationBlocEventSelect(
          generationMethod: GenerationMethod.pointBuy,
        ),
        CharacterCreationBlocEventSelect(baseStats: const Attributes()),
      ]);

      expect(find.byType(CharacterCreatingPreview), findsOneWidget);
      expect(find.text('Класс доспеха'), findsOneWidget);
    });
  });
}
