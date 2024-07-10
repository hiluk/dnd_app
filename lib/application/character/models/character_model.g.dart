// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      name: json['name'] as String,
      level: json['level'] as int,
      characterRace:
          Race.fromJson(json['characterRace'] as Map<String, dynamic>),
      characterClass:
          Class.fromJson(json['characterClass'] as Map<String, dynamic>),
      characterStats:
          Attributes.fromJson(json['characterStats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'characterRace': instance.characterRace,
      'characterClass': instance.characterClass,
      'characterStats': instance.characterStats,
    };
