import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/auth/repositories/tokens_repository.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/classes/repositories/classes_repository.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/api/races/repositories/races_repository.dart';
import 'package:flutter_application_1/core/http_client/http_client.dart';
import 'package:flutter_application_1/core/http_client/interceptors/auth_interceptor.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';
import 'package:flutter_application_1/core/router/dnd_router.dart';
import 'package:flutter_application_1/core/utils/extensions/hex_color.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.instance;

void registerDependencies() {
  di.allowReassignment = true;
  di.registerSingletonAsync(() async {
    return await SharedPreferences.getInstance();
  });

  di.registerSingletonAsync<DataBase>(
    () async {
      return DataBase(di.get<SharedPreferences>());
    },
    dependsOn: [SharedPreferences],
  );

  di.registerSingletonAsync<AppHttpClient>(
    () async {
      final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:5009'));

      dio.interceptors.add(AuthInterceptor(
        dataBase: di.get<DataBase>(),
      ));

      return AppHttpClient(dio);
    },
    dependsOn: [DataBase],
  );

  di.registerSingletonAsync<GoRouter>(() async {
    return DndRouter.getInstance(di.get<DataBase>());
  }, dependsOn: [DataBase]);

  di.registerSingleton<ThemeData>(
    ThemeData(
      fontFamily: 'Vinque',
      colorScheme: ColorScheme.dark(
        onBackground: HexColor.fromHex('#FAFBFC'),
        background: HexColor.fromHex('#141414'),
        surface: HexColor.fromHex('#141414'),
      ),
    ),
  );

  di.registerSingletonAsync<List<Race>>(
    () async {
      return await RacesRepository(
        di.get<AppHttpClient>(),
      ).fetch();
    },
    dependsOn: [AppHttpClient],
  );

  di.registerSingletonAsync<TokensRepository>(
    () async {
      return TokensRepository(
        di.get<AppHttpClient>(),
      );
    },
    dependsOn: [AppHttpClient],
  );

  di.registerSingletonAsync<AuthBloc>(
    () async {
      return AuthBloc(
        dataBase: di.get<DataBase>(),
        repository: di.get<TokensRepository>(),
      );
    },
    dependsOn: [DataBase, TokensRepository],
  );

  di.registerSingletonAsync<CharactersRepository>(
    () async {
      AppHttpClient httpClient = di.get<AppHttpClient>();
      return CharactersRepository(httpClient);
    },
    dependsOn: [AppHttpClient],
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

  di.registerSingletonAsync<List<Class>>(
    () async {
      AppHttpClient httpClient = di.get<AppHttpClient>();
      return await ClassesRepository(
        httpClient,
      ).fetch();
    },
    dependsOn: [AppHttpClient],
  );

  // locator.registerSingletonAsync<List<Background>>(() async {
  //   return await BackgroundsRepository(
  //     locator.get<AppHttpClient>(),
  //   ).fetch();
  // });
}
