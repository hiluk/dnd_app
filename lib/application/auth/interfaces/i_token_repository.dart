import 'package:dnd_app/application/auth/models/login_request.dart';
import 'package:dnd_app/application/auth/models/tokens.dart';

abstract interface class ITokensRepository {
  /// Срабатывает, когда сессия завершилась (в том числе по истечении токенов)
  Stream<void> get onSessionEnded;

  Future<Tokens> login(LoginRequest request);

  Future<void> register(RegisterRequest request);

  Tokens getFromCache();

  Future<void> cache(Tokens tokens);

  Future<void> clearTokens();
}
