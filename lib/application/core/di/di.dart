import 'package:dio/dio.dart';
import 'package:flutter_application_1/application/core/features/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/features/races/repositories/races_repository.dart';
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
}
