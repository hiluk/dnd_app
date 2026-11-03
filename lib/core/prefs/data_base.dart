import 'dart:async';

import 'package:dnd_app/application/auth/models/tokens.dart';
import 'package:dnd_app/core/prefs/interfaces/i_tokens_database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Хранит токены в защищённом хранилище и кэширует их в памяти,
/// чтобы интерсептор мог читать их синхронно.
@LazySingleton(as: ITokensDatabase)
class DataBase implements ITokensDatabase {
  static const String _accessTokenTag = 'accessToken';
  static const String _refreshTokenTag = 'refreshToken';

  final FlutterSecureStorage _storage;
  final Logger _logger;
  final _cleared = StreamController<void>.broadcast();

  Tokens _tokens = Tokens(accessToken: '', refreshToken: '');

  DataBase(this._storage, this._logger);

  @override
  Stream<void> get onCleared => _cleared.stream;

  @override
  Future<void> load() async {
    try {
      _tokens = Tokens(
        accessToken: await _storage.read(key: _accessTokenTag) ?? '',
        refreshToken: await _storage.read(key: _refreshTokenTag) ?? '',
      );
    } catch (e) {
      // Повреждённое хранилище не должно мешать запуску: просто войдём заново
      _logger.w('Не удалось прочитать токены: $e');
      await _storage.deleteAll();
    }
  }

  @override
  Future<void> cacheTokens(Tokens tokens) async {
    _tokens = tokens;
    await _storage.write(key: _accessTokenTag, value: tokens.accessToken);
    await _storage.write(key: _refreshTokenTag, value: tokens.refreshToken);
    _logger.i('Токены сохранены');
  }

  @override
  Future<void> clearTokens() async {
    final hadTokens = _tokens.accessToken.isNotEmpty;
    _tokens = Tokens(accessToken: '', refreshToken: '');
    await _storage.delete(key: _accessTokenTag);
    await _storage.delete(key: _refreshTokenTag);
    _logger.i('Токены удалены');
    if (hadTokens) _cleared.add(null);
  }

  @override
  Tokens getTokens() => _tokens;
}
