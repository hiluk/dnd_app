import 'package:flutter_application_1/application/core/api/classes/enums/character_class_type.dart';
import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CharacterClassTypeConverter implements JsonConverter<Class, int> {
  const CharacterClassTypeConverter();

  @override
  Class fromJson(int json) {
    final classes = locator.get<List<Class>>();
    final classType =
        CharacterClassType.values.firstWhere((e) => e.jsonValue == json);

    return classes.firstWhere((e) => e.name == classType.name);
  }

  @override
  int toJson(Class object) {
    final raceType =
        CharacterClassType.values.firstWhere((e) => e.name == object.name);

    return raceType.jsonValue;
  }
}
