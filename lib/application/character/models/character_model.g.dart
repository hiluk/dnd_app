// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      race: Race.fromJson(json['race'] as Map<String, dynamic>),
      charClass: Class.fromJson(json['charClass'] as Map<String, dynamic>),
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      feats: (json['feats'] as List<dynamic>?)
              ?.map((e) => Feat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weapon: Weapon.fromJson(json['weapon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'race': instance.race,
      'charClass': instance.charClass,
      'attributes': instance.attributes,
      'feats': instance.feats,
      'weapon': instance.weapon,
    };
