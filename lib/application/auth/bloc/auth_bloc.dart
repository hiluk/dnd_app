import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/auth/models/login_request.dart';
import 'package:flutter_application_1/application/auth/models/register_request.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/application/auth/repositories/tokens_repository.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final DataBase dataBase;
  final TokensRepository repository;
  AuthBloc({
    required this.dataBase,
    required this.repository,
  }) : super(const AuthState.loading()) {
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
    emit(const Loading());
    try {
      final tokens = await repository.login(event.request);

      dataBase.cacheTokens(tokens);

      emit(AuthState.logged(tokens));
    } catch (e) {
      emit(AuthState.error((e as Error).message));
    }
  }

  Future<void> _onRegister(
    Register event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await repository.register(event.request);

      add(AuthEvent.login(
        LoginRequest(
          login: event.request.login,
          password: event.request.password,
        ),
      ));
    } catch (e) {
      emit(AuthState.error((e as Error).message));
    }
  }

  Future<void> _onSingOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    dataBase.clearTokens();

    emit(const AuthState.notLogged());
  }

  Future<void> _onStarted(
    Started event,
    Emitter<AuthState> emit,
  ) async {
    final tokens = dataBase.getTokens();
    final isAuth = tokens.accessToken.isNotEmpty;

    isAuth ? emit(AuthState.logged(tokens)) : emit(const AuthState.notLogged());
  }
}
