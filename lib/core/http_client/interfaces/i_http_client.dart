import 'package:dio/dio.dart';

abstract class IHttpClient {
  Dio get client;

  void addInterceptor(Interceptor interceptor);

  Future<T?> delete<T>(
    String url, [
    Map<String, dynamic>? queryParams,
  ]);

  Future<T> get<T>(
    String url, [
    Map<String, dynamic>? queryParams,
  ]);

  Future<T?> post<T>(
    String url,
    dynamic data, [
    Map<String, dynamic>? queryParams,
  ]);
}
