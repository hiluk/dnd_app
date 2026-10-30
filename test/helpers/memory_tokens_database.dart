import 'dart:async';

import 'package:dnd_app/application/auth/models/tokens.dart';
import 'package:dnd_app/core/prefs/interfaces/i_tokens_database.dart';

class MemoryTokensDatabase implements ITokensDatabase {
  final _cleared = StreamController<void>.broadcast();
  Tokens _tokens;

  MemoryTokensDatabase([Tokens? tokens])
      : _tokens = tokens ?? Tokens(accessToken: '', refreshToken: '');

  @override
  Stream<void> get onCleared => _cleared.stream;

  @override
  Future<void> load() async {}

  @override
  Future<void> cacheTokens(Tokens tokens) async => _tokens = tokens;

  @override
  Future<void> clearTokens() async {
    _tokens = Tokens(accessToken: '', refreshToken: '');
    _cleared.add(null);
  }

  @override
  Tokens getTokens() => _tokens;
}
