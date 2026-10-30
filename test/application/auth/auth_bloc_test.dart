import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/application/auth/interfaces/i_token_repository.dart';
import 'package:dnd_app/application/auth/models/login_request.dart';
import 'package:dnd_app/application/auth/models/tokens.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTokensRepository extends Mock implements ITokensRepository {}

void main() {
  late MockTokensRepository repository;
  late StreamController<void> sessionEnded;
  final empty = Tokens(accessToken: '', refreshToken: '');
  final tokens = Tokens(accessToken: 'a', refreshToken: 'r');
  const login = LoginRequest(login: 'tester', password: 'Passw0rd');
  const register = RegisterRequest(
    email: 't@t.ru',
    login: 'tester',
    password: 'Passw0rd',
  );

  setUpAll(() {
    registerFallbackValue(const LoginRequest());
    registerFallbackValue(const RegisterRequest());
    registerFallbackValue(empty);
  });

  setUp(() {
    repository = MockTokensRepository();
    sessionEnded = StreamController<void>.broadcast();
    when(() => repository.onSessionEnded).thenAnswer((_) => sessionEnded.stream);
    when(() => repository.getFromCache()).thenReturn(empty);
    when(() => repository.cache(any())).thenAnswer((_) async {});
    when(() => repository.clearTokens()).thenAnswer((_) async {});
  });

  test('Без сохранённых токенов стартует неавторизованным', () {
    expect(AuthBloc(repository).state, const AuthState.notLogged());
  });

  test('С сохранёнными токенами стартует авторизованным', () {
    when(() => repository.getFromCache()).thenReturn(tokens);

    expect(AuthBloc(repository).state, AuthState.logged(tokens));
  });

  blocTest<AuthBloc, AuthState>(
    'Успешный вход сохраняет токены',
    setUp: () =>
        when(() => repository.login(any())).thenAnswer((_) async => tokens),
    build: () => AuthBloc(repository),
    act: (bloc) => bloc.add(const AuthEvent.login(login)),
    expect: () => [const AuthState.loading(), AuthState.logged(tokens)],
    verify: (_) => verify(() => repository.cache(tokens)).called(1),
  );

  blocTest<AuthBloc, AuthState>(
    'Ошибка входа показывает сообщение сервера',
    setUp: () => when(() => repository.login(any())).thenThrow(
      DioException.badResponse(
        statusCode: 401,
        requestOptions: RequestOptions(path: '/login'),
        response: Response(
          requestOptions: RequestOptions(path: '/login'),
          statusCode: 401,
          data: {'detail': 'Неверный логин или пароль'},
        ),
      ),
    ),
    build: () => AuthBloc(repository),
    act: (bloc) => bloc.add(const AuthEvent.login(login)),
    expect: () => [
      const AuthState.loading(),
      const AuthState.error('Неверный логин или пароль'),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'После регистрации выполняется вход',
    setUp: () {
      when(() => repository.register(any())).thenAnswer((_) async {});
      when(() => repository.login(any())).thenAnswer((_) async => tokens);
    },
    build: () => AuthBloc(repository),
    act: (bloc) => bloc.add(const AuthEvent.register(register)),
    expect: () => [
      const AuthState.loading(),
      AuthState.logged(tokens),
    ],
    verify: (_) => verify(() => repository.login(login)).called(1),
  );

  blocTest<AuthBloc, AuthState>(
    'Без соединения регистрация не зависает в загрузке',
    setUp: () => when(() => repository.register(any())).thenThrow(
      DioException.connectionError(
        requestOptions: RequestOptions(path: '/register'),
        reason: 'refused',
      ),
    ),
    build: () => AuthBloc(repository),
    act: (bloc) => bloc.add(const AuthEvent.register(register)),
    expect: () => [
      const AuthState.loading(),
      const AuthState.error('Сервер недоступен, проверьте подключение'),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'Истёкшая сессия разлогинивает',
    setUp: () => when(() => repository.getFromCache()).thenReturn(tokens),
    build: () => AuthBloc(repository),
    act: (_) => sessionEnded.add(null),
    expect: () => [
      const AuthState.error('Сессия истекла, войдите снова'),
      const AuthState.notLogged(),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'Выход очищает токены',
    setUp: () => when(() => repository.getFromCache()).thenReturn(tokens),
    build: () => AuthBloc(repository),
    act: (bloc) => bloc.add(const AuthEvent.signOut()),
    expect: () => [const AuthState.notLogged()],
    verify: (_) => verify(() => repository.clearTokens()).called(1),
  );
}
