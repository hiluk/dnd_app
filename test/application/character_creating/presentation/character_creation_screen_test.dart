import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/character_creating/bloc/attributes_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/class_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/race_cubit.dart';
import 'package:flutter_application_1/application/character_creating/models/character_dto.dart';
import 'package:flutter_application_1/application/character_creating/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/character_creating_preview.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/character_stats_create_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/classes_list_view.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/races_list_view.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/mock_di.dart';

void main() {
  late CharacterCreationBloc bloc;
  late CharactersRepository repository;
  late CharacterCreationScreen creationScreen;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    await configureMockDependencies();
    await mockDi.allReady();
    repository = di.get<CharactersRepository>();

    when(() => repository.saveCharacter(CharacterDto(
          characterStats: Attributes.empty(),
        ))).thenAnswer((_) async => '');
  });

  setUp(() {
    bloc = CharacterCreationBloc(
      charactersRepository: repository,
    );
    creationScreen = const CharacterCreationScreen();
  });

  testWidgets('При инициализации экрана будет открыт выбор расы',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => bloc,
            ),
            BlocProvider(
              create: (context) => RaceCubit(),
            ),
            BlocProvider(
              create: (context) => ClassCubit(),
            ),
            BlocProvider(
              create: (context) => StatsCubit(),
            ),
          ],
          child: creationScreen,
        ),
      ),
    );

    final findBuilderState = find.byType(RacesListView);

    expect(findBuilderState, findsOne);
  });

  testWidgets('При выбраной расе будет открыт выбор класса',
      (widgetTester) async {
    bloc.add(CharacterCreationBlocEventSelect(
      characterRace: di.get<List<Race>>().first,
    ));

    await widgetTester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => bloc,
            ),
            BlocProvider(
              create: (context) => RaceCubit(),
            ),
            BlocProvider(
              create: (context) => ClassCubit(),
            ),
            BlocProvider(
              create: (context) => StatsCubit(),
            ),
          ],
          child: creationScreen,
        ),
      ),
    );

    final findBuilderState = find.byType(ClassesListView);

    expect(findBuilderState, findsOne);
  });

  testWidgets('При выбраном классе будет открыт выбор класса',
      (widgetTester) async {
    bloc.add(CharacterCreationBlocEventSelect(
      characterRace: di.get<List<Race>>().first,
      characterClass: di.get<List<Class>>().first,
    ));

    await widgetTester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => bloc,
            ),
            BlocProvider(
              create: (context) => RaceCubit(),
            ),
            BlocProvider(
              create: (context) => ClassCubit(),
            ),
            BlocProvider(
              create: (context) => StatsCubit(),
            ),
          ],
          child: creationScreen,
        ),
      ),
    );

    final findBuilderState = find.byType(CharacterStatsCreateView);

    expect(findBuilderState, findsOne);
  });

  testWidgets('При выбранных аттрибутах будет открыт превью персонажа',
      (widgetTester) async {
    bloc.add(CharacterCreationBlocEventSelect(
      characterRace: di.get<List<Race>>().first,
      characterClass: di.get<List<Class>>().first,
      characterStats: Attributes.empty(),
    ));

    await widgetTester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => bloc,
            ),
            BlocProvider(
              create: (context) => RaceCubit(),
            ),
            BlocProvider(
              create: (context) => ClassCubit(),
            ),
            BlocProvider(
              create: (context) => StatsCubit(),
            ),
          ],
          child: creationScreen,
        ),
      ),
    );

    final findBuilderState = find.byType(CharacterCreatingPreview);

    expect(findBuilderState, findsOne);
  });
}
