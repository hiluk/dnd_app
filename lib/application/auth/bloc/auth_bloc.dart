import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dnd_app/application/auth/interfaces/i_token_repository.dart';
import 'package:dnd_app/application/auth/models/login_request.dart';
import 'package:dnd_app/application/auth/models/tokens.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ITokensRepository repository;
  late final StreamSubscription<void> _sessionEnded;

  AuthBloc(this.repository) : super(_stateFromCache(repository)) {
    on<Started>(_onStarted);
    on<Login>(_onLogin);
    on<Register>(_onRegister);
    on<SignOut>(_onSignOut);
    on<SessionExpired>(_onSessionExpired);

    _sessionEnded = repository.onSessionEnded
        .listen((_) => add(const AuthEvent.sessionExpired()));

  }

  // Токены уже загружены в память до запуска приложения, поэтому
  // начальное состояние известно сразу и роутер не мигает экранами
  static AuthState _stateFromCache(ITokensRepository repository) {
    return repository.getFromCache().accessToken.isNotEmpty
        ? AuthState.logged(repository.getFromCache())
        : const AuthState.notLogged();
  }

  @override
  Future<void> close() async {
    await _sessionEnded.cancel();
    return super.close();
  }

  void _onStarted(Started event, Emitter<AuthState> emit) {
    emit(_stateFromCache(repository));
  }

  Future<void> _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final tokens = await repository.login(event.request);
      await repository.cache(tokens);

      emit(AuthState.logged(tokens));
    } catch (e) {
      emit(AuthState.error(apiErrorMessage(e)));
    }
  }

  Future<void> _onRegister(Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await repository.register(event.request);

      add(AuthEvent.login(LoginRequest(
        login: event.request.login,
        password: event.request.password,
      )));
    } catch (e) {
      emit(AuthState.error(apiErrorMessage(e)));
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    await repository.clearTokens();

    emit(const AuthState.notLogged());
  }

  void _onSessionExpired(SessionExpired event, Emitter<AuthState> emit) {
    if (state is AuthLogged) {
      emit(const AuthState.error('Сессия истекла, войдите снова'));
      emit(const AuthState.notLogged());
    }
  }
}
