import 'package:dio/dio.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHttpClient)
class AppHttpClient implements IHttpClient {
  final Dio _client;

  AppHttpClient(this._client);

  @override
  Future<T> get<T>(String url, [Map<String, dynamic>? queryParams]) async {
    final response = await _client.get<T>(url, queryParameters: queryParams);

    return response.data as T;
  }

  @override
  Future<T?> post<T>(
    String url,
    dynamic data, [
    Map<String, dynamic>? queryParams,
  ]) async {
    final response = await _client.post<T>(
      url,
      data: data,
      queryParameters: queryParams,
    );

    return response.data;
  }

  @override
  Future<T?> delete<T>(String url, [Map<String, dynamic>? queryParams]) async {
    final response = await _client.delete<T>(url, queryParameters: queryParams);

    return response.data;
  }
}
