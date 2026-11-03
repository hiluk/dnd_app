import 'package:dio/dio.dart';
import 'package:dnd_app/core/http_client/empty_response_exception.dart';

/// Превращает ошибку запроса в сообщение для пользователя.
///
/// Бэкенд отвечает в формате ProblemDetails:
/// `{ "detail": "..." }` или `{ "errors": { "Поле": ["..."] } }`.
String apiErrorMessage(Object error) {
  if (error is EmptyResponseException) {
    return 'Сервер вернул пустой ответ, попробуйте ещё раз';
  }
  if (error is! DioException) return 'Неизвестная ошибка';

  switch (error.type) {
    case DioExceptionType.connectionError:
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return 'Сервер недоступен, проверьте подключение';
    default:
      break;
  }

  final data = error.response?.data;
  if (data is Map) {
    final errors = data['errors'];
    if (errors is Map && errors.isNotEmpty) {
      return errors.values
          .expand((messages) => messages is List ? messages : [messages])
          .join('\n');
    }

    final detail = data['detail'] ?? data['title'];
    if (detail is String && detail.isNotEmpty) return detail;
  }

  return switch (error.response?.statusCode) {
    401 => 'Требуется авторизация',
    404 => 'Не найдено',
    final code? when code >= 500 => 'Ошибка сервера',
    _ => 'Неизвестная ошибка',
  };
}
