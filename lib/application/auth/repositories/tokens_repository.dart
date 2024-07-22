import 'package:flutter_application_1/application/auth/models/login_request.dart';
import 'package:flutter_application_1/application/auth/models/register_request.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

class TokensRepository {
  final IHttpClient httpClient;

  const TokensRepository(this.httpClient);

  Future<Tokens> login(LoginRequest data) async {
    try {
      final tokensRaw = await httpClient.post("/login", data.toJson());

      return Tokens.fromJson(tokensRaw);
    } catch (e) {
      rethrow;
    }
  }

  Future<Tokens> refresh(String token) async {
    try {
      return await httpClient.post("/refresh", {"refreshToken": token});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(RegisterRequest data) async {
    try {
      await httpClient.post("/register", data.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
