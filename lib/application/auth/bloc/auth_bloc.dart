import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/application/auth/interfaces/i_token_repository.dart';
import 'package:flutter_application_1/application/auth/models/error_response.dart';
import 'package:flutter_application_1/application/auth/models/login_request.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ITokensRepository repository;

  AuthBloc(this.repository) : super(const AuthState.loading()) {
    on<Started>(_onStarted);
    on<Login>(_onLogin);
    on<Register>(_onRegister);
    on<SignOut>(_onSingOut);

    add(const AuthEvent.started());
  }

  Future<void> _onLogin(
    Login event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final tokens = await repository.fetch(event.request);

      repository.cache(tokens);

      emit(AuthState.logged(tokens));
    } on DioException catch (e) {
      final errorResponse = ErrorResponse.fromJson(e.response?.data);
      String message = switch (errorResponse.detail) {
        "Failed" => "Ошибка авторизации",
        _ => "Неизвестная ошибка",
      };

      emit(AuthState.error(message));
    }
  }

  Future<void> _onRegister(
    Register event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await repository.fetch(event.request);

      add(AuthEvent.login(
        LoginRequest(
          login: event.request.login,
          password: event.request.password,
        ),
      ));
    } on DioException catch (e) {
      final errorResponse = ErrorResponse.fromJson(e.response?.data);
      String message = switch (errorResponse.detail) {
        "Failed" => "Ошибка авторизации",
        _ => "Неизвестная ошибка",
      };

      emit(AuthState.error(message));
    }
  }

  Future<void> _onSingOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    repository.clearTokens();

    emit(const AuthState.notLogged());
  }

  Future<void> _onStarted(
    Started event,
    Emitter<AuthState> emit,
  ) async {
    final tokens = repository.getFromCache();
    final isAuth = tokens.accessToken.isNotEmpty;

    isAuth ? emit(AuthState.logged(tokens)) : emit(const AuthState.notLogged());
  }
}
