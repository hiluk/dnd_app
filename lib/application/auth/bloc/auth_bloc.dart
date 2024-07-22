import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/auth/models/auth_request.dart';
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
  }) : super(const NotLogged()) {
    on<Started>(_onStarted);
    on<Login>(_onLogin);
    on<Register>(_onRegister);

    add(const Started());
  }

  Future<void> _onLogin(
    Login event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final tokens = await repository.login("/login", event.request);

      dataBase.cacheTokens(tokens);
      emit(Logged(tokens));
    } catch (e) {
      emit(Error((e as Error).message));
    }
  }

  Future<void> _onRegister(
    Register event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await repository.register("/register", event.request);

      add(Login(
        LoginRequest(
          login: event.request.login,
          password: event.request.password,
        ),
      ));
    } catch (e) {
      emit(Error((e as Error).message));
    }
  }

  Future<void> _onStarted(
    Started event,
    Emitter<AuthState> emit,
  ) async {
    final tokens = dataBase.getTokens();
    final isAuth = tokens.accessToken.isNotEmpty;

    isAuth ? emit(Logged(tokens)) : emit(const NotLogged());
  }
}
