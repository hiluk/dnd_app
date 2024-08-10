import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/core/api/classes/converters/class_converter.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/converters/race_converter.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto {
  factory CharacterDto({
    @Default("") String name,
    @Default(1) int level,
    @CharacterRaceTypeConverter() Race? characterRace,
    @CharacterClassTypeConverter() Class? characterClass,
    required Attributes characterStats,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);
}
