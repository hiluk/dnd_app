import 'package:dio/dio.dart';
import 'package:dnd_app/application/auth/models/tokens.dart';
import 'package:dnd_app/core/http_client/interceptors/auth_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

import '../../helpers/fake_adapter.dart';
import '../../helpers/memory_tokens_database.dart';

void main() {
  late MemoryTokensDatabase dataBase;
  late FakeAdapter adapter;
  late Dio dio;
  late int refreshCalls;

  ({int status, Object? body}) protected(RequestOptions options) =>
      options.headers['Authorization'] == 'Bearer new-access'
          ? (status: 200, body: ['ok'])
          : (status: 401, body: null);

  void setUpDio({required bool refreshSucceeds, bool emptyRefresh = false}) {
    refreshCalls = 0;
    adapter = FakeAdapter({
      '/characters': protected,
      '/races': protected,
      '/refresh': (options) {
        refreshCalls++;
        if (emptyRefresh) return (status: 200, body: null);
        return refreshSucceeds
            ? (
                status: 200,
                body: {
                  'tokenType': 'Bearer',
                  'accessToken': 'new-access',
                  'refreshToken': 'new-refresh',
                  'expiresIn': 3600,
                }
              )
            : (status: 401, body: null);
      },
      '/login': (options) => (status: 401, body: {'detail': 'nope'}),
    });

    final plainDio = Dio()..httpClientAdapter = adapter;
    dio = Dio()
      ..httpClientAdapter = adapter
      ..interceptors.add(AuthInterceptor(
        dataBase,
        Logger(level: Level.off),
        plainDio: plainDio,
      ));
  }

  setUp(() {
    dataBase = MemoryTokensDatabase(
      Tokens(accessToken: 'old-access', refreshToken: 'old-refresh'),
    );
  });

  test('Подставляет access токен в запросы', () async {
    setUpDio(refreshSucceeds: true);
    await dataBase.cacheTokens(
      Tokens(accessToken: 'new-access', refreshToken: 'r'),
    );

    final response = await dio.get('/characters');

    expect(response.statusCode, 200);
    expect(refreshCalls, 0);
  });

  test('При 401 обновляет токены и повторяет запрос', () async {
    setUpDio(refreshSucceeds: true);

    final response = await dio.get('/characters');

    expect(response.data, ['ok']);
    expect(dataBase.getTokens().accessToken, 'new-access');
    expect(dataBase.getTokens().refreshToken, 'new-refresh');
  });

  test('Параллельные 401 обновляют токен только один раз', () async {
    setUpDio(refreshSucceeds: true);

    final responses = await Future.wait([
      dio.get('/characters'),
      dio.get('/races'),
      dio.get('/characters'),
    ]);

    expect(responses.map((r) => r.statusCode), everyElement(200));
    expect(refreshCalls, 1);
  });

  test('Если refresh отклонён — выходит из аккаунта и отдаёт 401', () async {
    setUpDio(refreshSucceeds: false);
    final cleared = expectLater(dataBase.onCleared, emits(null));

    await expectLater(
      dio.get('/characters'),
      throwsA(isA<DioException>()
          .having((e) => e.response?.statusCode, 'status', 401)),
    );
    await cleared;
    expect(dataBase.getTokens().accessToken, isEmpty);
  });

  test('Ошибки входа не запускают refresh', () async {
    setUpDio(refreshSucceeds: true);

    await expectLater(dio.post('/login'), throwsA(isA<DioException>()));
    expect(refreshCalls, 0);
    expect(adapter.requests.single.headers['Authorization'], isNull);
  });

  test('Пустой ответ на refresh не подвешивает запрос и завершает сессию',
      () async {
    setUpDio(refreshSucceeds: true, emptyRefresh: true);

    await expectLater(
      dio.get('/characters').timeout(const Duration(seconds: 2)),
      throwsA(isA<DioException>()
          .having((e) => e.response?.statusCode, 'status', 401)),
    );
    expect(dataBase.getTokens().accessToken, isEmpty);
  });
}
