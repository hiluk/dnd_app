abstract interface class IHttpClient {
  Future<T> get<T>(
    String url, [
    Map<String, dynamic>? queryParams,
  ]);

  Future<T?> post<T>(
    String url,
    dynamic data, [
    Map<String, dynamic>? queryParams,
  ]);

  Future<T?> put<T>(String url, dynamic data);

  Future<T?> patch<T>(String url, dynamic data);

  Future<T?> delete<T>(
    String url, [
    Map<String, dynamic>? queryParams,
  ]);

  /// Скачать файл целиком (с авторизацией и обновлением токена)
  Future<List<int>> getBytes(String url);
}
