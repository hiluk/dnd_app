// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      name: json['name'] as String,
      level: json['level'] as int,
      characterRace: const CharacterRaceTypeConverter()
          .fromJson(json['characterRace'] as int),
      characterClass: const CharacterClassTypeConverter()
          .fromJson(json['characterClass'] as int),
      characterStats:
          Attributes.fromJson(json['characterStats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'characterRace':
          const CharacterRaceTypeConverter().toJson(instance.characterRace),
      'characterClass':
          const CharacterClassTypeConverter().toJson(instance.characterClass),
      'characterStats': instance.characterStats,
    };
