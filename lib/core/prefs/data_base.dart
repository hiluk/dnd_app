import 'package:flutter_application_1/application/auth/models/tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase {
  static const String accessTokenTag = 'accessToken';
  static const String refreshTokenTag = 'refreshToken';

  final SharedPreferences prefs;
  const DataBase(this.prefs);

  void cacheTokens(Tokens tokens) {
    prefs.setString(accessTokenTag, tokens.accessToken);
    prefs.setString(refreshTokenTag, tokens.refreshToken);
  }

  Tokens getTokens() {
    final accessToken = prefs.getString(accessTokenTag);
    final refreshToken = prefs.getString(refreshTokenTag);

    return Tokens(
      accessToken: accessToken ?? '',
      refreshToken: refreshToken ?? '',
    );
  }
}
