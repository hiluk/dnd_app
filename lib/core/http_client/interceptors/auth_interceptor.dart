import 'package:dio/dio.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@Injectable(order: -1)
class AuthInterceptor extends Interceptor {
  final DataBase dataBase;
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5009"));
  AuthInterceptor({
    required this.dataBase,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = dataBase.getTokens().refreshToken;

      if (refreshToken.isEmpty) {
        handler.reject(err);
      } else {
        final response = await dio.post(
          "/refresh",
          data: {
            "refreshToken": refreshToken,
          },
        );
        final tokens = Tokens.fromJson(response.data);

        if (response.statusCode == 200) {
          dataBase.cacheTokens(tokens);
          handler.resolve(await _retry(err.requestOptions));
        } else {
          dataBase.clearTokens();
          di.get<GoRouter>().refresh();
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
