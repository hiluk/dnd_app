/// Сервер ответил успешно, но без тела, хотя оно ожидалось
class EmptyResponseException implements Exception {
  final String path;

  const EmptyResponseException(this.path);

  @override
  String toString() => 'Пустой ответ сервера на $path';
}

extension RequireBody<T extends Object> on T? {
  /// Тело ответа или [EmptyResponseException], если его нет
  T requireBody(String path) => this ?? (throw EmptyResponseException(path));
}
