import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/mock_di.dart';

void main() async {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    HttpOverrides.global = MyHttpOverrides();

    await configureMockDependencies();
    await mockDi.allReady();
  });

  test('При создании создает пустой CharacterRequest', () {
    final bloc = CharacterCreationBloc(
      charactersRepository: di.get<CharactersRepository>(),
    );

    expect(bloc.state, CharacterCreationBlocState());
  });

  test('При эвенте Select выбирает одно новое свойство', () {});

  test('При эвенте Return возвращает предыдущее состояния Bloc', () {});

  test('При эвенте Save нет ошибок', () {});

  test('При эвенте Save и некоректных данных будет error state', () {});
}
