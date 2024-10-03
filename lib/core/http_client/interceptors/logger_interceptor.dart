import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(order: -1)
class LoggerInterceptor extends Interceptor {
  final Logger _logger;

  LoggerInterceptor(this._logger);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e("Ошибка запроса! ${err.message}");
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d(
      '''
      Отправил запрос!
      Путь: ${options.path},
      Данные: ${options.data},
      ''',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      '''
      Получил ответ!
      Код: ${response.statusCode},
      Данные: ${response.data},
      ''',
    );
    super.onResponse(response, handler);
  }
}
