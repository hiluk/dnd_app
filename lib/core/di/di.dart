import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_selection_screen.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/main_screen.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/classes/repositories/classes_repository.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/api/races/repositories/races_repository.dart';
import 'package:flutter_application_1/core/http_client/http_client.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.instance;

void registerDependencies() {
  di.registerSingleton<AppHttpClient>(
    AppHttpClient(
      Dio(
        BaseOptions(baseUrl: 'http://10.0.2.2:5009'),
      ),
    ),
  );

  di.registerSingleton<GoRouter>(
    GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/',
          name: 'main',
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: CharacterSelectionScreen.path,
              name: CharacterSelectionScreen.routeName,
              routes: [
                GoRoute(
                  path: CharacterCreationScreen.routePath,
                  name: CharacterCreationScreen.routePath,
                  builder: (context, state) => const CharacterCreationScreen(),
                ),
                GoRoute(
                  path: CharacterScreen.path,
                  name: CharacterScreen.routeName,
                  builder: (context, state) => const CharacterScreen(),
                )
              ],
              builder: (context, state) => const CharacterSelectionScreen(),
            ),
          ],
        ),
      ],
    ),
  );

  di.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  di.registerSingleton<DataBase>(DataBase(di.get<SharedPreferences>()));

  di.registerSingleton<ThemeData>(
    ThemeData(
      fontFamily: 'Vinque',
      colorScheme: const ColorScheme.dark().copyWith(
        background: Colors.black,
      ),
    ),
  );

  di.registerSingletonAsync<List<Race>>(
    () async {
      return await RacesRepository(
        di.get<AppHttpClient>(),
      ).fetch();
    },
  );

  di.registerSingletonAsync<CharactersRepository>(
    () async {
      AppHttpClient httpClient = di.get<AppHttpClient>();
      return CharactersRepository(httpClient);
    },
  );

  // locator.registerSingletonAsync<List<Weapon>>(
  //   () async {
  //     return await WeaponsRepository(
  //       locator.get<AppHttpClient>(),
  //     ).fetch();
  //   },
  // );

  // locator.registerSingletonAsync<List<Armor>>(
  //   () async {
  //     return await ArmorRepository(
  //       locator.get<AppHttpClient>(),
  //     ).fetch();
  //   },
  // );

  // locator.registerSingletonAsync<List<Feat>>(
  //   () async {
  //     return await FeatsRepository(
  //       locator.get<AppHttpClient>(),
  //     ).fetch();
  //   },
  // );

  di.registerSingletonAsync<List<Class>>(() async {
    AppHttpClient httpClient = di.get<AppHttpClient>();
    return await ClassesRepository(
      httpClient,
    ).fetch();
  });

  // locator.registerSingletonAsync<List<Background>>(() async {
  //   return await BackgroundsRepository(
  //     locator.get<AppHttpClient>(),
  //   ).fetch();
  // });
}
