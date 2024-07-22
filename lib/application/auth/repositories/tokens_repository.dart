import 'package:flutter_application_1/application/auth/models/auth_request.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

class TokensRepository {
  final IHttpClient httpClient;

  const TokensRepository(this.httpClient);

  Future<Tokens> login(String url, AuthRequest data) async {
    try {
      final tokensRaw = await httpClient.post(url, data.toJson());

      return Tokens.fromJson(tokensRaw);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String url, AuthRequest data) async {
    try {
      await httpClient.post(url, data.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
