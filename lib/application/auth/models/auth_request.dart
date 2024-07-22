import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';
part 'auth_request.g.dart';

@freezed
sealed class AuthRequest with _$AuthRequest {
  factory AuthRequest() = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);

  factory AuthRequest.login({
    required String login,
    required String password,
  }) = LoginRequest;

  factory AuthRequest.register({
    required String email,
    required String login,
    required String password,
  }) = RegisterRequest;
}

@freezed
class LoginRequest extends AuthRequest with _$LoginRequest {
  factory LoginRequest({
    required String login,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class RegisterRequest extends AuthRequest with _$RegisterRequest {
  factory RegisterRequest({
    required String email,
    required String login,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
