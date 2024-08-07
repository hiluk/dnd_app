import 'package:flutter_application_1/application/auth/interfaces/i_token_repository.dart';
import 'package:flutter_application_1/application/auth/models/login_request.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/core/prefs/interfaces/i_tokens_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ITokensRepository)
class TokensRepository implements ITokensRepository {
  static const String accessTokenTag = 'accessToken';
  static const String refreshTokenTag = 'refreshToken';
  @override
  final IHttpClient httpClient;
  final ITokensDatabase dataBase;

  const TokensRepository(this.httpClient, this.dataBase);

  @override
  void cache(Tokens tokens) {
    dataBase.cacheTokens(tokens);
  }

  @override
  void clearTokens() {
    dataBase.clearTokens();
  }

  @override
  Future<Tokens> fetch(AuthRequest request) async {
    try {
      final url = switch (request) {
        LoginRequest _ => '/login',
        RegisterRequest _ => '/register',
        _ => throw Exception()
      };
      final tokensRaw = await httpClient.post(url, request.toJson());

      return Tokens.fromJson(tokensRaw);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Tokens getFromCache() {
    return dataBase.getTokens();
  }
}
