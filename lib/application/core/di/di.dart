import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_selection_view.dart';
import 'package:flutter_application_1/application/character/presentation/character_view.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/api/classes/repositories/classes_repository.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/api/races/repositories/races_repository.dart';
import 'package:flutter_application_1/application/core/http_client/http_client.dart';
import 'package:flutter_application_1/application/main_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

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
              path: CharacterSelectionView.path,
              name: CharacterSelectionView.routeName,
              routes: [
                GoRoute(
                  path: CharacterCreationScreen.routePath,
                  name: CharacterCreationScreen.routePath,
                  builder: (context, state) => const CharacterCreationScreen(),
                ),
                GoRoute(
                  path: CharacterView.path,
                  name: CharacterView.routeName,
                  builder: (context, state) => const CharacterView(),
                )
              ],
              builder: (context, state) => const CharacterSelectionView(),
            ),
          ],
        ),
      ],
    ),
  );

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
      return CharactersRepository(di.get<AppHttpClient>());
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
    return await ClassesRepository(
      di.get<AppHttpClient>(),
    ).fetch();
  });

  // locator.registerSingletonAsync<List<Background>>(() async {
  //   return await BackgroundsRepository(
  //     locator.get<AppHttpClient>(),
  //   ).fetch();
  // });
}
