import 'dart:typed_data';

import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

/// Скачанные картинки персонажей. Адрес содержит версию файла,
/// поэтому по одному адресу картинка не меняется и её можно хранить.
@lazySingleton
class AvatarCache {
  static const _capacity = 32;

  final CharactersRepository _repository;
  final _loaded = <String, Future<Uint8List>>{};

  AvatarCache(this._repository);

  Future<Uint8List> load(String url) {
    final cached = _loaded.remove(url);
    if (cached != null) {
      // Последний использованный — в конец очереди
      _loaded[url] = cached;
      return cached;
    }

    final future = _repository
        .fetchAvatarBytes(url)
        .then((bytes) => Uint8List.fromList(bytes));
    _loaded[url] = future;
    // Ошибку не храним: следующий показ попробует снова
    future.catchError((Object _) {
      _loaded.remove(url);
      return Uint8List(0);
    });
    if (_loaded.length > _capacity) _loaded.remove(_loaded.keys.first);

    return future;
  }

  /// Положить только что загруженную картинку, чтобы не скачивать её обратно
  void put(String url, Uint8List bytes) => _loaded[url] = Future.value(bytes);
}
