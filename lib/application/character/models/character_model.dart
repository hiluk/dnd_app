import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/core/api/classes/converters/class_converter.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/converters/race_converter.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class Character with _$Character {
  factory Character({
    required String name,
    required String id,
    required int level,
    @CharacterRaceTypeConverter() required Race characterRace,
    @CharacterClassTypeConverter() required Class characterClass,
    required Attributes characterStats,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

}
