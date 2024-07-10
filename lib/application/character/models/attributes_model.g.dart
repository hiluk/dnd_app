// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttributesImpl _$$AttributesImplFromJson(Map<String, dynamic> json) =>
    _$AttributesImpl(
      strength: json['strength'] as int? ?? 0,
      dexterity: json['dexterity'] as int? ?? 0,
      agility: json['agility'] as int? ?? 0,
      constitution: json['constitution'] as int? ?? 0,
      intelligence: json['intelligence'] as int? ?? 0,
      charisma: json['charisma'] as int? ?? 0,
    );

Map<String, dynamic> _$$AttributesImplToJson(_$AttributesImpl instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'dexterity': instance.dexterity,
      'agility': instance.agility,
      'constitution': instance.constitution,
      'intelligence': instance.intelligence,
      'charisma': instance.charisma,
    };
