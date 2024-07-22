part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(LoginRequest request) = Login;
  const factory AuthEvent.refresh(String token) = Refresh;
  const factory AuthEvent.register(RegisterRequest request) = Register;
  const factory AuthEvent.started() = Started;
}
