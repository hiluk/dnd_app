import 'package:dnd_app/application/auth/models/tokens.dart';

abstract interface class ITokensDatabase {
  /// Срабатывает, когда токены удалены (выход или истёкшая сессия)
  Stream<void> get onCleared;

  /// Загрузить токены из хранилища в память. Вызывается один раз при старте.
  Future<void> load();

  Future<void> cacheTokens(Tokens tokens);

  Future<void> clearTokens();

  Tokens getTokens();
}
