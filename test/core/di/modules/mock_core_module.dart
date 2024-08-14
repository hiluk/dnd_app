import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/http_client/interceptors/auth_interceptor.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';
import 'package:flutter_application_1/core/router/dnd_router.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mock_di.dart';

@module
abstract class CoreModule {
  List<Class> get classes => [
        Class.mock('Воин'),
        Class.mock('Варвар'),
      ];

  @Order(-1)
  Dio get dio {
    final dio = Dio(BaseOptions(baseUrl: 'https://10.0.2.2:5001'));

    dio.interceptors.add(
      AuthInterceptor(dataBase: DataBase(mockDi.get<SharedPreferences>())),
    );
    return dio;
  }

  @Order(-2)
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  List<Race> get races => [
        Race.mock('Человек'),
        Race.mock('Полуэльф'),
      ];

  @singleton
  GoRouter get router => AppRouter.router;
}
