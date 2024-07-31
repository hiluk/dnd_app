import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/http_client/http_client.dart';
import 'package:flutter_application_1/core/http_client/interceptors/auth_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/classes/models/class_model.dart';
import '../api/races/models/race_model.dart';
import '../http_client/interfaces/i_http_client.dart';

@module
abstract class CoreModule {
  @preResolve
  Future<List<Class>> get classes async {
    final data = await httpClient.get('/classes');
    final classesRawList = data as List<dynamic>;

    return classesRawList
        .map(
          (json) => Class.fromJson(json),
        )
        .toList();
  }

  Dio get dio {
    final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:5009'));

    dio.interceptors.add(di.get<AuthInterceptor>());
    return dio;
  }

  IHttpClient get httpClient => AppHttpClient(dio);

  @Order(-2)
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<List<Race>> get races async {
    final data = await httpClient.get('/races');

    return (data as List)
        .map(
          (raceJson) => Race.fromJson(raceJson),
        )
        .toList();
  }
}
