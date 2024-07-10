// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      name: json['name'] as String?,
      level: json['level'] as int?,
      characterRace: _$JsonConverterFromJson<int, Race>(
          json['characterRace'], const CharacterRaceTypeConverter().fromJson),
      characterClass: _$JsonConverterFromJson<int, Class>(
          json['characterClass'], const CharacterClassTypeConverter().fromJson),
      characterStats: json['characterStats'] == null
          ? null
          : Attributes.fromJson(json['characterStats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'characterRace': _$JsonConverterToJson<int, Race>(
          instance.characterRace, const CharacterRaceTypeConverter().toJson),
      'characterClass': _$JsonConverterToJson<int, Class>(
          instance.characterClass, const CharacterClassTypeConverter().toJson),
      'characterStats': instance.characterStats,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
