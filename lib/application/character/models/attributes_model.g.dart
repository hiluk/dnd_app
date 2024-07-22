// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttributesImpl _$$AttributesImplFromJson(Map<String, dynamic> json) =>
    _$AttributesImpl(
      strength: (json['strength'] as num?)?.toInt() ?? 0,
      dexterity: (json['dexterity'] as num?)?.toInt() ?? 0,
      wisdom: (json['wisdom'] as num?)?.toInt() ?? 0,
      constitution: (json['constitution'] as num?)?.toInt() ?? 0,
      intelligence: (json['intelligence'] as num?)?.toInt() ?? 0,
      charisma: (json['charisma'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AttributesImplToJson(_$AttributesImpl instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'dexterity': instance.dexterity,
      'wisdom': instance.wisdom,
      'constitution': instance.constitution,
      'intelligence': instance.intelligence,
      'charisma': instance.charisma,
    };
