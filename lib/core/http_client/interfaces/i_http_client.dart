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

  Future<T?> delete<T>(
    String url, [
    Map<String, dynamic>? queryParams,
  ]);
}
