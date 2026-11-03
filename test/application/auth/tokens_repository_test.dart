import 'package:dnd_app/application/auth/models/login_request.dart';
import 'package:dnd_app/application/auth/repositories/tokens_repository.dart';
import 'package:dnd_app/core/http_client/empty_response_exception.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/memory_tokens_database.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient client;
  late TokensRepository repository;
  const request = LoginRequest(login: 'tester', password: 'Passw0rd');

  setUp(() {
    client = MockHttpClient();
    repository = TokensRepository(client, MemoryTokensDatabase());
  });

  test('Вход возвращает токены из ответа', () async {
    when(() => client.post<Map<String, dynamic>>('/login', any()))
        .thenAnswer((_) async => {'accessToken': 'a', 'refreshToken': 'r'});

    final tokens = await repository.login(request);

    expect(tokens.accessToken, 'a');
    expect(tokens.refreshToken, 'r');
  });

  test('Пустой ответ на вход — понятная ошибка, а не падение', () async {
    when(() => client.post<Map<String, dynamic>>('/login', any()))
        .thenAnswer((_) async => null);

    await expectLater(
      repository.login(request),
      throwsA(isA<EmptyResponseException>()
          .having((e) => e.path, 'path', '/login')),
    );
  });
}
