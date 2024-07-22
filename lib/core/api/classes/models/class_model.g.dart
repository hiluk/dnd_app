// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassImpl _$$ClassImplFromJson(Map<String, dynamic> json) => _$ClassImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      hitDice: json['hitDice'] as String,
      hpAt1stLevel: json['hpAt1stLevel'] as String,
      hpAtHigherLevels: json['hpAtHigherLevels'] as String,
      profArmor: json['profArmor'] as String,
      profWeapon: json['profWeapon'] as String,
      profTool: json['profTool'] as String,
      profSavingThrows: json['profSavingThrows'] as String,
      profSkills: json['profSkills'] as String,
      equipment: json['equipment'] as String,
      spellCastingAbility: json['spellCastingAbility'] as String,
    );

Map<String, dynamic> _$$ClassImplToJson(_$ClassImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'hitDice': instance.hitDice,
      'hpAt1stLevel': instance.hpAt1stLevel,
      'hpAtHigherLevels': instance.hpAtHigherLevels,
      'profArmor': instance.profArmor,
      'profWeapon': instance.profWeapon,
      'profTool': instance.profTool,
      'profSavingThrows': instance.profSavingThrows,
      'profSkills': instance.profSkills,
      'equipment': instance.equipment,
      'spellCastingAbility': instance.spellCastingAbility,
    };
