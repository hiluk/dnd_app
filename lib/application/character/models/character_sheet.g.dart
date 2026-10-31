// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterSheetImpl _$$CharacterSheetImplFromJson(Map<String, dynamic> json) =>
    _$CharacterSheetImpl(
      stats: Attributes.fromJson(json['stats'] as Map<String, dynamic>),
      modifiers: Attributes.fromJson(json['modifiers'] as Map<String, dynamic>),
      hitPoints: (json['hitPoints'] as num).toInt(),
      armorClass: (json['armorClass'] as num).toInt(),
      initiative: (json['initiative'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
      proficiencyBonus: (json['proficiencyBonus'] as num).toInt(),
      savingThrows: (json['savingThrows'] as List<dynamic>)
          .map((e) => SavingThrow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CharacterSheetImplToJson(
        _$CharacterSheetImpl instance) =>
    <String, dynamic>{
      'stats': instance.stats.toJson(),
      'modifiers': instance.modifiers.toJson(),
      'hitPoints': instance.hitPoints,
      'armorClass': instance.armorClass,
      'initiative': instance.initiative,
      'speed': instance.speed,
      'proficiencyBonus': instance.proficiencyBonus,
      'savingThrows': instance.savingThrows.map((e) => e.toJson()).toList(),
    };

_$SavingThrowImpl _$$SavingThrowImplFromJson(Map<String, dynamic> json) =>
    _$SavingThrowImpl(
      ability: $enumDecode(_$AbilityEnumMap, json['ability']),
      bonus: (json['bonus'] as num).toInt(),
      proficient: json['proficient'] as bool,
    );

Map<String, dynamic> _$$SavingThrowImplToJson(_$SavingThrowImpl instance) =>
    <String, dynamic>{
      'ability': _$AbilityEnumMap[instance.ability]!,
      'bonus': instance.bonus,
      'proficient': instance.proficient,
    };

const _$AbilityEnumMap = {
  Ability.strength: 1,
  Ability.dexterity: 2,
  Ability.constitution: 3,
  Ability.intelligence: 4,
  Ability.wisdom: 5,
  Ability.charisma: 6,
};
