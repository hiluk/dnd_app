import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/utils/converters/class_converter.dart';
import 'package:flutter_application_1/core/utils/converters/race_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class Character with _$Character {
  factory Character({
    @Default("") String name,
    @Default(0) int level,
    @CharacterRaceTypeConverter() Race? characterRace,
    @CharacterClassTypeConverter() Class? characterClass,
    required Attributes characterStats,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
