import 'package:flutter_application_1/application/core/api/races/enums/character_race_type.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CharacterRaceTypeConverter implements JsonConverter<Race, int> {
  static const _types = CharacterRaceType.values;
  const CharacterRaceTypeConverter();

  @override
  Race fromJson(int json) {
    final raceType = _types.firstWhere((e) => e.jsonValue == json);

    return di.get<List<Race>>().firstWhere((e) => e.name == raceType.name);
  }

  @override
  int toJson(Race object) {
    final raceType = _types.firstWhere((e) => e.name == object.name);

    return raceType.jsonValue;
  }
}
