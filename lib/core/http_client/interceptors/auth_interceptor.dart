import 'package:dio/dio.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/prefs/interfaces/i_tokens_database.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(order: -1)
class AuthInterceptor extends Interceptor {
  final ITokensDatabase dataBase;
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://10.0.2.2:5001'));
  AuthInterceptor({
    required this.dataBase,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      di.get<Logger>().e("Токен устарел");
      final refreshToken = dataBase.getTokens().refreshToken;

      if (refreshToken.isEmpty) {
        quitApp();
      } else {
        final response = await dio.post(
          "/refresh",
          data: {
            "refreshToken": refreshToken,
          },
        );
        final tokens = Tokens.fromJson(response.data);

        switch (response.statusCode) {
          case 200:
            dataBase.cacheTokens(tokens);
            handler.resolve(await _retry(err.requestOptions));
            break;
          case 401:
            quitApp();
            break;
        }
      }
    } else {
      handler.reject(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers.addAll({
    //   "Content-Type": "application/json",
    // });

    final accessToken = dataBase.getTokens().accessToken;
    if (accessToken.isNotEmpty) {
      options.headers.addAll({"Authorization": "Bearer $accessToken"});
    }
    return super.onRequest(options, handler);
  }

  void quitApp() {
    di.get<Logger>().i("Рефреш токена нет, выхожу из приложения.");
    dataBase.clearTokens();
    di.get<GoRouter>().refresh();
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
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
