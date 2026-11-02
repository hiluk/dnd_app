// ignore_for_file: invalid_annotation_target

import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_model.freezed.dart';
part 'class_model.g.dart';

@freezed
class Class with _$Class {
  factory Class({
    required String name,
    required String description,
    required String hitDice,
    required String hpAt1stLevel,
    required String hpAtHigherLevels,
    required String profArmor,
    required String profWeapon,
    required String profTool,
    required String profSavingThrows,
    required String profSkills,
    required String equipment,
    required String spellCastingAbility,
    @Default(0) int hitDie,
    @Default([]) List<Ability> savingThrows,

    /// Сколько навыков выбирается из [skillOptions]
    @Default(0) int skillChoices,
    @Default([]) List<Skill> skillOptions,

    /// Сколько навыков получают компетентность на 1 уровне (плут — 2)
    @Default(0) int expertiseChoices,
  }) = _Class;

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

  factory Class.mock(String className) {
    return Class(
      name: className,
      description: '',
      hitDice: '',
      hpAt1stLevel: '',
      hpAtHigherLevels: '',
      profArmor: '',
      profWeapon: '',
      profTool: '',
      profSavingThrows: '',
      profSkills: '',
      equipment: '',
      spellCastingAbility: '',
    );
  }
}
