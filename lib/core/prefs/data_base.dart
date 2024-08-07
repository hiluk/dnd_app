import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:flutter_application_1/core/prefs/interfaces/i_tokens_database.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(order: -2, as: ITokensDatabase)
class DataBase implements ITokensDatabase {
  static const String _accessTokenTag = 'accessToken';
  static const String _refreshTokenTag = 'refreshToken';

  final SharedPreferences prefs;
  const DataBase(this.prefs);

  @override
  void cacheTokens(Tokens tokens) {
    prefs.setString(_accessTokenTag, tokens.accessToken);
    prefs.setString(_refreshTokenTag, tokens.refreshToken);
  }

  @override
  void clearTokens() {
    prefs.remove(_accessTokenTag);
    prefs.remove(_refreshTokenTag);
  }

  @override
  Tokens getTokens() {
    final accessToken = prefs.getString(_accessTokenTag);
    final refreshToken = prefs.getString(_refreshTokenTag);

    return Tokens(
      accessToken: accessToken ?? '',
      refreshToken: refreshToken ?? '',
    );
  }
}
