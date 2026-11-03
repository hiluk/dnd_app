import 'package:dio/dio.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:dnd_app/core/http_client/empty_response_exception.dart';
import 'package:flutter_test/flutter_test.dart';

DioException _response(int status, Object? data) {
  final options = RequestOptions(path: '/test');
  return DioException.badResponse(
    statusCode: status,
    requestOptions: options,
    response: Response(requestOptions: options, statusCode: status, data: data),
  );
}

void main() {
  test('Берёт detail из ProblemDetails', () {
    final error = _response(401, {'detail': 'Неверный логин или пароль'});

    expect(apiErrorMessage(error), 'Неверный логин или пароль');
  });

  test('Собирает все ошибки валидации', () {
    final error = _response(400, {
      'title': 'One or more validation errors occurred.',
      'errors': {
        'DuplicateUserName': ['Логин занят'],
        'DuplicateEmail': ['Эмейл занят'],
      },
    });

    expect(apiErrorMessage(error), 'Логин занят\nЭмейл занят');
  });

  test('Ответ без тела не приводит к падению', () {
    expect(apiErrorMessage(_response(500, null)), 'Ошибка сервера');
    expect(apiErrorMessage(_response(404, '')), 'Не найдено');
  });

  test('Нет соединения', () {
    final error = DioException.connectionError(
      requestOptions: RequestOptions(path: '/test'),
      reason: 'refused',
    );

    expect(apiErrorMessage(error), 'Сервер недоступен, проверьте подключение');
  });

  test('Пустой ответ сервера', () {
    expect(
      apiErrorMessage(const EmptyResponseException('/login')),
      'Сервер вернул пустой ответ, попробуйте ещё раз',
    );
  });

  test('Не сетевая ошибка', () {
    expect(apiErrorMessage(const FormatException()), 'Неизвестная ошибка');
  });
}
