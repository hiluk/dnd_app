part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.error(String message) = Error;
  const factory AuthState.loading() = Loading;
  const factory AuthState.logged(Tokens tokens) = Logged;
  const factory AuthState.notLogged() = NotLogged;
}
