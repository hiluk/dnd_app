import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_selection_view.dart';
import 'package:flutter_application_1/application/core/api/armor/models/armor_model.dart';
import 'package:flutter_application_1/application/core/api/armor/repositories/armor_repository.dart';
import 'package:flutter_application_1/application/core/api/backgrounds/models/background_model.dart';
import 'package:flutter_application_1/application/core/api/backgrounds/repositories/backgrounds_repository.dart';
import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/api/classes/repositories/classes_repository.dart';
import 'package:flutter_application_1/application/core/api/feats/models/feat_model.dart';
import 'package:flutter_application_1/application/core/api/feats/repository/feats_repository.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/api/races/repositories/races_repository.dart';
import 'package:flutter_application_1/application/core/api/weapons/models/weapon_model.dart';
import 'package:flutter_application_1/application/core/api/weapons/repository/weapons_repository.dart';
import 'package:flutter_application_1/application/core/http_client/http_client.dart';
import 'package:flutter_application_1/application/main_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

GetIt locator = GetIt.instance;

void registerDependencies() {
  locator.registerSingleton<AppHttpClient>(
    AppHttpClient(
      Dio(
        BaseOptions(baseUrl: 'https://api.open5e.com/v1/'),
      ),
    ),
  );

  locator.registerSingleton<GoRouter>(
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
                )
              ],
              builder: (context, state) => const CharacterSelectionView(),
            ),
          ],
        ),
      ],
    ),
  );

  locator.registerSingleton<ThemeData>(
    ThemeData(
      fontFamily: 'Vinque',
      colorScheme: const ColorScheme.dark().copyWith(
        background: Colors.black,
      ),
    ),
  );

  locator.registerSingletonAsync<List<Race>>(
    () async {
      return await RacesRepository(
        locator.get<AppHttpClient>(),
      ).fetch();
    },
  );

  locator.registerSingletonAsync<List<Weapon>>(
    () async {
      return await WeaponsRepository(
        locator.get<AppHttpClient>(),
      ).fetch();
    },
  );

  locator.registerSingletonAsync<List<Armor>>(
    () async {
      return await ArmorRepository(
        locator.get<AppHttpClient>(),
      ).fetch();
    },
  );

  locator.registerSingletonAsync<List<Feat>>(
    () async {
      return await FeatsRepository(
        locator.get<AppHttpClient>(),
      ).fetch();
    },
  );

  locator.registerSingletonAsync<List<Class>>(() async {
    return await ClassesRepository(
      locator.get<AppHttpClient>(),
    ).fetch();
  });

  locator.registerSingletonAsync<List<Background>>(() async {
    return await BackgroundsRepository(
      locator.get<AppHttpClient>(),
    ).fetch();
  });
}
