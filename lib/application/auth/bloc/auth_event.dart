part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(LoginRequest request) = Login;
  const factory AuthEvent.register(RegisterRequest request) = Register;
  const factory AuthEvent.signOut() = SignOut;
  const factory AuthEvent.started() = Started;
}
