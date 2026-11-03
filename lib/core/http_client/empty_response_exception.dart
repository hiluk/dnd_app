/// Сервер ответил успешно, но без тела, хотя оно ожидалось
class EmptyResponseException implements Exception {
  final String path;

  const EmptyResponseException(this.path);

  @override
  String toString() => 'Пустой ответ сервера на $path';
}
