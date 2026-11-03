import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_sheet.freezed.dart';
part 'character_sheet.g.dart';

/// Вычисленные сервером значения персонажа
@freezed
class CharacterSheet with _$CharacterSheet {
  const factory CharacterSheet({
    required Attributes stats,
    required Attributes modifiers,
    required int hitPoints,
    required int armorClass,
    required int initiative,
    required int speed,
    required int proficiencyBonus,
    required List<SavingThrow> savingThrows,
    @Default([]) List<SkillCheck> skills,
    @Default(10) int passivePerception,
  }) = _CharacterSheet;

  factory CharacterSheet.fromJson(Map<String, dynamic> json) =>
      _$CharacterSheetFromJson(json);
}

@freezed
class SavingThrow with _$SavingThrow {
  const factory SavingThrow({
    required Ability ability,
    required int bonus,
    required bool proficient,
  }) = _SavingThrow;

  factory SavingThrow.fromJson(Map<String, dynamic> json) =>
      _$SavingThrowFromJson(json);
}

@freezed
class SkillCheck with _$SkillCheck {
  const factory SkillCheck({
    required Skill skill,
    required Ability ability,
    required int bonus,
    required bool proficient,
    required bool expertise,
  }) = _SkillCheck;

  factory SkillCheck.fromJson(Map<String, dynamic> json) =>
      _$SkillCheckFromJson(json);
}
