import 'package:flutter_application_1/application/auth/models/login_request.dart';
import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

abstract interface class ITokensRepository {
  IHttpClient get httpClient;

  void cache(Tokens tokens);

  Future<Tokens> fetch(AuthRequest request);

  Tokens getFromCache();

  void clearTokens();
}
