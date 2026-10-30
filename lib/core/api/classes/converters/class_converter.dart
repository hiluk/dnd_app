import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Класс передаётся по сети как номер [CharacterClassType.jsonValue]
/// и сопоставляется со справочником по названию
class CharacterClassTypeConverter implements JsonConverter<Class, int> {
  static const _types = CharacterClassType.values;
  const CharacterClassTypeConverter();

  @override
  Class fromJson(int json) {
    final classType = _types.firstWhere(
      (e) => e.jsonValue == json,
      orElse: () => throw FormatException('Неизвестный класс: $json'),
    );

    return di
        .get<CatalogRepository>()
        .classes
        .firstWhere((e) => e.name == classType.name, orElse: () {
      throw StateError('Класс «${classType.name}» не найден в справочнике');
    });
  }

  @override
  int toJson(Class object) {
    return _types.firstWhere((e) => e.name == object.name).jsonValue;
  }
}
