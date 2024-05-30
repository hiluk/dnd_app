// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassImpl _$$ClassImplFromJson(Map<String, dynamic> json) => _$ClassImpl(
      name: json['name'] as String,
      slug: json['slug'] as String,
      desc: json['desc'] as String,
      hitDice: json['hit_dice'] as String,
      hpAtFirstLevel: json['hp_at_1st_level'] as String,
      hpAtHigherLevels: json['hp_at_higher_levels'] as String,
      profArmor: json['prof_armor'] as String,
      profWeapon: json['prof_weapons'] as String,
      profTools: json['prof_tools'] as String,
      profSavingThrows: json['prof_saving_throws'] as String,
      profSkills: json['prof_skills'] as String,
      equipment: json['equipment'] as String,
      archetypes: (json['archetypes'] as List<dynamic>)
          .map((e) => Archetype.fromJson(e as Map<String, dynamic>))
          .toList(),
      spellcastingAbility: json['spellcasting_ability'] as String,
      subtypesName: json['subtypes_name'] as String,
    );

Map<String, dynamic> _$$ClassImplToJson(_$ClassImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'desc': instance.desc,
      'hit_dice': instance.hitDice,
      'hp_at_1st_level': instance.hpAtFirstLevel,
      'hp_at_higher_levels': instance.hpAtHigherLevels,
      'prof_armor': instance.profArmor,
      'prof_weapons': instance.profWeapon,
      'prof_tools': instance.profTools,
      'prof_saving_throws': instance.profSavingThrows,
      'prof_skills': instance.profSkills,
      'equipment': instance.equipment,
      'archetypes': instance.archetypes,
      'spellcasting_ability': instance.spellcastingAbility,
      'subtypes_name': instance.subtypesName,
    };
