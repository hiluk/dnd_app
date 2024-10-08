import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/mock_di.dart';

void main() {
  late CharacterCreationBloc bloc;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    HttpOverrides.global = MyHttpOverrides();

    await configureMockDependencies();
    await mockDi.allReady();

    bloc = CharacterCreationBloc(
      di.get<CharactersRepository>(),
      Logger(),
    );
  });

  group('Character Creation BloC', () {
    test('При создании создает пустой CharacterRequest', () {
      expect(bloc.state, CharacterCreationBlocState());
    });

    test('При эвенте Select выбирает одно новое свойство', () async {
      const name = 'test';
      bloc.add(CharacterCreationBlocEventSelect(characterName: name));

      await null;

      expect(
        bloc.state,
        CharacterCreationBlocState(
          characterName: name,
          previousState: bloc.state.previousState,
        ),
      );
    });

    test('При эвенте Return возвращает предыдущее состояния Bloc', () async {
      final savedState = bloc.state;
      const name = 'test';

      bloc.add(CharacterCreationBlocEventSelect(characterName: name));

      bloc.add(CharacterCreationBlocEventReturn());

      expect(bloc.state, same(savedState));
    });
  });
}
