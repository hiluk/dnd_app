import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

typedef FakeHandler = ({int status, Object? body}) Function(
    RequestOptions options);

/// Адаптер Dio, который вместо сети вызывает обработчики по пути запроса
class FakeAdapter implements HttpClientAdapter {
  final Map<String, FakeHandler> handlers;
  final List<RequestOptions> requests = [];

  FakeAdapter(this.handlers);

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final handler = handlers[options.path];
    if (handler == null) {
      return ResponseBody.fromString('', 404);
    }

    final result = handler(options);
    return ResponseBody.fromString(
      result.body == null ? '' : jsonEncode(result.body),
      result.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
