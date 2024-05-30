// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/application/core/components/classes/models/archetype_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_model.freezed.dart';
part 'class_model.g.dart';

@freezed
class Class with _$Class {
  factory Class({
    required String name,
    required String slug,
    required String desc,
    @JsonKey(name: 'hit_dice') required String hitDice,
    @JsonKey(name: 'hp_at_1st_level') required String hpAtFirstLevel,
    @JsonKey(name: 'hp_at_higher_levels') required String hpAtHigherLevels,
    @JsonKey(name: 'prof_armor') required String profArmor,
    @JsonKey(name: 'prof_weapons') required String profWeapon,
    @JsonKey(name: 'prof_tools') required String profTools,
    @JsonKey(name: 'prof_saving_throws') required String profSavingThrows,
    @JsonKey(name: 'prof_skills') required String profSkills,
    required String equipment,
    required List<Archetype> archetypes,
    @JsonKey(name: 'spellcasting_ability') required String spellcastingAbility,
    @JsonKey(name: 'subtypes_name') required String subtypesName,
  }) = _Class;

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
}
