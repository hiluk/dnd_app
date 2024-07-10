import 'package:flutter_application_1/application/core/api/classes/enums/character_class_type.dart';
import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CharacterClassTypeConverter implements JsonConverter<Class, int> {
  static const _types = CharacterClassType.values;
  const CharacterClassTypeConverter();

  @override
  Class fromJson(int json) {
    final classType = _types.firstWhere((e) => e.jsonValue == json);

    return di.get<List<Class>>().firstWhere((e) => e.name == classType.name);
  }

  @override
  int toJson(Class object) {
    final raceType = _types.firstWhere((e) => e.name == object.name);

    return raceType.jsonValue;
  }
}
