import 'package:flutter_application_1/application/auth/models/tokens.dart';

abstract interface class ITokensDatabase {
  void cacheTokens(Tokens tokens);
  void clearTokens();
  Tokens getTokens();
}
