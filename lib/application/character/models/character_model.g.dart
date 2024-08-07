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
      characterStats:
          Attributes.fromJson(json['characterStats'] as Map<String, dynamic>),
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
      'characterStats': instance.characterStats,
    };
