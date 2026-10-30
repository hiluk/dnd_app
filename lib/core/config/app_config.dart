import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Настройки окружения.
///
/// Адрес бэкенда задаётся при сборке:
/// `flutter run --dart-define=API_URL=http://192.168.1.10:5000`
abstract final class AppConfig {
  static const _apiUrlOverride = String.fromEnvironment('API_URL');

  static String get apiUrl {
    if (_apiUrlOverride.isNotEmpty) return _apiUrlOverride;

    // Android-эмулятор видит localhost хост-машины по адресу 10.0.2.2
    final isAndroid =
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    return isAndroid ? 'http://10.0.2.2:5000' : 'http://localhost:5000';
  }

  static const connectTimeout = Duration(seconds: 10);
  static const receiveTimeout = Duration(seconds: 20);

  static BaseOptions get baseOptions => BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        contentType: Headers.jsonContentType,
      );
}
