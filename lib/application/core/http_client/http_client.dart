import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/core/http_client/interfaces/i_http_client.dart';

class RikHttpClient implements IRikHttpClient {
  final Dio client;

  RikHttpClient(this.client);

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
    } on Exception catch (e) {
      debugPrint(e.toString());
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
    } on DioException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
