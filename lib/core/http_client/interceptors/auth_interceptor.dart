import 'package:dio/dio.dart';
import 'package:dnd_app/application/auth/models/tokens.dart';
import 'package:dnd_app/core/config/app_config.dart';
import 'package:dnd_app/core/http_client/empty_response_exception.dart';
import 'package:dnd_app/core/prefs/interfaces/i_tokens_database.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Подставляет access токен и обновляет его по refresh токену при 401.
///
/// [QueuedInterceptor] обрабатывает ошибки по очереди, поэтому при нескольких
/// одновременных 401 токен обновляется один раз, а остальные запросы
/// просто повторяются с уже новым токеном.
@lazySingleton
class AuthInterceptor extends QueuedInterceptor {
  static const _refreshPath = '/refresh';
  static const _publicPaths = {'/login', '/register', _refreshPath};

  final ITokensDatabase _dataBase;
  final Logger _logger;

  /// Отдельный клиент без интерсепторов для refresh и повтора запросов
  final Dio _plainDio;

  AuthInterceptor(this._dataBase, this._logger, {@ignoreParam Dio? plainDio})
      : _plainDio = plainDio ?? Dio(AppConfig.baseOptions);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _dataBase.getTokens().accessToken;
    if (accessToken.isNotEmpty && !_publicPaths.contains(options.path)) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final refreshToken = _dataBase.getTokens().refreshToken;

    if (err.response?.statusCode != 401 ||
        _publicPaths.contains(request.path) ||
        refreshToken.isEmpty) {
      return handler.next(err);
    }

    try {
      // Пока запрос ждал в очереди, токен мог обновить другой запрос
      final usedToken = request.headers['Authorization'];
      if (usedToken == 'Bearer ${_dataBase.getTokens().accessToken}') {
        await _refresh(refreshToken);
      }

      handler.resolve(await _retry(request));
    } on EmptyResponseException {
      // Без новой пары токенов продолжать сессию нельзя
      _logger.w('Пустой ответ на /refresh, выходим из аккаунта');
      await _dataBase.clearTokens();
      handler.next(err);
    } on DioException catch (e) {
      final refreshFailed = e.requestOptions.path == _refreshPath;
      if (refreshFailed && e.response?.statusCode == 401) {
        _logger.i('Refresh токен недействителен, выходим из аккаунта');
        await _dataBase.clearTokens();
      }
      // Ошибку refresh отдаём как исходную 401, ошибку повтора — как есть
      handler.next(refreshFailed ? err : e);
    }
  }

  Future<void> _refresh(String refreshToken) async {
    _logger.i('Access токен устарел, обновляем');
    final response = await _plainDio.post<Map<String, dynamic>>(
      _refreshPath,
      data: {'refreshToken': refreshToken},
    );
    final tokensRaw = response.data;
    if (tokensRaw == null) throw const EmptyResponseException(_refreshPath);

    await _dataBase.cacheTokens(Tokens.fromJson(tokensRaw));
  }

  Future<Response<dynamic>> _retry(RequestOptions request) {
    final accessToken = _dataBase.getTokens().accessToken;
    request.headers['Authorization'] = 'Bearer $accessToken';

    return _plainDio.fetch(request);
  }
}
