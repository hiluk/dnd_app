import 'package:dio/dio.dart';
import 'package:dnd_app/core/config/app_config.dart';
import 'package:dnd_app/core/http_client/interceptors/auth_interceptor.dart';
import 'package:dnd_app/core/http_client/interceptors/logger_interceptor.dart';
import 'package:dnd_app/core/router/dnd_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class CoreModule {
  @lazySingleton
  Dio dio(
      AuthInterceptor authInterceptor, LoggerInterceptor loggerInterceptor) {
    return Dio(AppConfig.baseOptions)
      ..interceptors.addAll([authInterceptor, loggerInterceptor]);
  }

  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  @singleton
  GoRouter get router => AppRouter.router;
}
