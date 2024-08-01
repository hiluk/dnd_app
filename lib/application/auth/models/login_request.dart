import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
class AuthRequest with _$AuthRequest {
  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);

  const factory AuthRequest.login({
    @Default('') String login,
    @Default('') String password,
  }) = LoginRequest;

  const factory AuthRequest.register({
    @Default('') String email,
    @Default('') String login,
    @Default('') String password,
  }) = RegisterRequest;
}
