import 'package:dio/dio.dart';
import 'package:flutter_application_1/application/core/components/backgrounds/models/background_model.dart';
import 'package:flutter_application_1/application/core/components/backgrounds/repositories/backgrounds_repository.dart';
import 'package:flutter_application_1/application/core/components/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/components/classes/repositories/classes_repository.dart';
import 'package:flutter_application_1/application/core/components/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/components/races/repositories/races_repository.dart';
import 'package:flutter_application_1/application/core/http_client/http_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void registerDependencies() {
  locator.registerSingleton<AppHttpClient>(AppHttpClient(
    Dio(
      BaseOptions(baseUrl: 'https://api.open5e.com/v1/'),
    ),
  ));

  locator.registerSingletonAsync<List<Race>>(() async {
    return RacesRepository(
      locator.get<AppHttpClient>(),
    ).fetch();
  });

  locator.registerSingletonAsync<List<Class>>(() async {
    return ClassesRepository(
      locator.get<AppHttpClient>(),
    ).fetch();
  });

  locator.registerSingletonAsync<List<Background>>(() async {
    return BackgroundsRepository(
      locator.get<AppHttpClient>(),
    ).fetch();
  });
}
