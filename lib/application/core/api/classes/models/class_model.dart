// ignore_for_file: invalid_annotation_target

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
  }) = _Class;

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
}
