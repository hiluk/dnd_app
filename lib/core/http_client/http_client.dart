import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:injectable/injectable.dart';

@Order(-1)
@Injectable(as: IHttpClient)
class AppHttpClient implements IHttpClient {
  @override
  final Dio client;

  AppHttpClient(this.client);

  @override
  void addInterceptor(Interceptor interceptor) {
    client.interceptors.add(interceptor);
  }

  @override
  Future<T> delete<T>(
    String url, [
    Map<String, dynamic>? queryParams,
  ]) async {
    try {
      final response = await client.delete(
        url,
        queryParameters: queryParams,
      );

      return null is T ? response.data : response.data!;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<T> get<T>(
    String url, [
    Map<String, dynamic>? queryParams,
  ]) async {
    try {
      final response = await client.get(
        url,
        queryParameters: queryParams,
      );

      return null is T ? response.data : response.data!;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<T> post<T>(
    String url,
    data, [
    Map<String, dynamic>? queryParams,
  ]) async {
    try {
      final response = await client.post(
        url,
        data: data,
        queryParameters: queryParams,
      );
      return null is T ? response.data : response.data!;
    } on DioException {
      rethrow;
    }
  }
}
