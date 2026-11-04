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

  @override
  Future<T?> put<T>(String url, dynamic data) async {
    final response = await _client.put<T>(url, data: data);

    return response.data;
  }

  @override
  Future<T?> patch<T>(String url, dynamic data) async {
    final response = await _client.patch<T>(url, data: data);

    return response.data;
  }

  @override
  Future<List<int>> getBytes(String url) async {
    final response = await _client.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    return response.data ?? const [];
  }
}
