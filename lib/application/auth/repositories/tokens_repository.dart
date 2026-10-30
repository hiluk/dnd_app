import 'package:dnd_app/application/auth/interfaces/i_token_repository.dart';
import 'package:dnd_app/application/auth/models/login_request.dart';
import 'package:dnd_app/application/auth/models/tokens.dart';
import 'package:dnd_app/core/http_client/interfaces/i_http_client.dart';
import 'package:dnd_app/core/prefs/interfaces/i_tokens_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ITokensRepository)
class TokensRepository implements ITokensRepository {
  final IHttpClient _httpClient;
  final ITokensDatabase _dataBase;

  const TokensRepository(this._httpClient, this._dataBase);

  @override
  Stream<void> get onSessionEnded => _dataBase.onCleared;

  @override
  Future<Tokens> login(LoginRequest request) async {
    final tokensRaw = await _httpClient.post<Map<String, dynamic>>(
      '/login',
      request.toJson(),
    );

    return Tokens.fromJson(tokensRaw!);
  }

  @override
  Future<void> register(RegisterRequest request) async {
    // В ответ на регистрацию сервер возвращает пустой 200
    await _httpClient.post<void>('/register', request.toJson());
  }

  @override
  Tokens getFromCache() => _dataBase.getTokens();

  @override
  Future<void> cache(Tokens tokens) => _dataBase.cacheTokens(tokens);

  @override
  Future<void> clearTokens() => _dataBase.clearTokens();
}
