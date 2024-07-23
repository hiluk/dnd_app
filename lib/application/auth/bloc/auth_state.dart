part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.error(String message) = AuthError;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.logged(Tokens tokens) = AuthLogged;
  const factory AuthState.notLogged() = AuthNotLogged;
}
