// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      level: (json['level'] as num).toInt(),
      characterRace: const CharacterRaceTypeConverter()
          .fromJson((json['characterRace'] as num).toInt()),
      characterClass: const CharacterClassTypeConverter()
          .fromJson((json['characterClass'] as num).toInt()),
      generationMethod:
          $enumDecode(_$GenerationMethodEnumMap, json['generationMethod']),
      baseStats: Attributes.fromJson(json['baseStats'] as Map<String, dynamic>),
      bonusChoices: (json['bonusChoices'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AbilityEnumMap, e))
              .toList() ??
          const [],
      sheet: CharacterSheet.fromJson(json['sheet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'level': instance.level,
      'characterRace':
          const CharacterRaceTypeConverter().toJson(instance.characterRace),
      'characterClass':
          const CharacterClassTypeConverter().toJson(instance.characterClass),
      'generationMethod': _$GenerationMethodEnumMap[instance.generationMethod]!,
      'baseStats': instance.baseStats.toJson(),
      'bonusChoices':
          instance.bonusChoices.map((e) => _$AbilityEnumMap[e]!).toList(),
      'sheet': instance.sheet.toJson(),
    };

const _$GenerationMethodEnumMap = {
  GenerationMethod.standardArray: 1,
  GenerationMethod.pointBuy: 2,
  GenerationMethod.roll: 3,
};

const _$AbilityEnumMap = {
  Ability.strength: 1,
  Ability.dexterity: 2,
  Ability.constitution: 3,
  Ability.intelligence: 4,
  Ability.wisdom: 5,
  Ability.charisma: 6,
};
