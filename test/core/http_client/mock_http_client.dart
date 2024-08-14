import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IHttpClient)
class MockHttpClient implements IHttpClient {
  @override
  final Dio client = Dio();
  @override
  void addInterceptor(Interceptor interceptor) {}

  @override
  Future<T?> delete<T>(String url, [Map<String, dynamic>? queryParams]) {
    throw UnimplementedError();
  }

  @override
  Future<T> get<T>(String url, [Map<String, dynamic>? queryParams]) {
    throw UnimplementedError();
  }

  @override
  Future<T?> post<T>(String url, data, [Map<String, dynamic>? queryParams]) {
    throw UnimplementedError();
  }
}
