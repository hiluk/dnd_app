import 'package:dio/dio.dart';
import 'package:flutter_application_1/application/auth/repositories/tokens_repository.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';

class AuthInterceptor extends Interceptor {
  final DataBase dataBase;
  final TokensRepository repository;
  final IHttpClient httpClient;
  AuthInterceptor({
    required this.dataBase,
    required this.repository,
    required this.httpClient,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = dataBase.getTokens().refreshToken;
      final newTokens = await repository.refresh(refreshToken);

      dataBase.cacheTokens(newTokens);
      try {
        handler.resolve(await _retry(err.requestOptions));
      } catch (e) {
        handler.reject(err);
      }
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Content-Type": "application/json",
    });

    final accessToken = dataBase.getTokens().accessToken;
    if (accessToken.isNotEmpty) {
      options.headers.addAll({"Authorization": "Bearer $accessToken"});
    }
    return super.onRequest(options, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final Dio dio = Dio();
    final accessToken = dataBase.getTokens().accessToken;

    final options = Options(
      method: requestOptions.method,
      headers: {"Authorization": "Bearer $accessToken"},
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
