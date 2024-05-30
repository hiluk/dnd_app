// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RaceImpl _$$RaceImplFromJson(Map<String, dynamic> json) => _$RaceImpl(
      name: json['name'] as String,
      slug: json['slug'] as String,
      desc: json['desc'] as String,
      asiDesc: json['asi_desc'] as String,
      asi: json['asi'] as List<dynamic>,
      age: json['age'] as String,
      alignment: json['alignment'] as String,
      size: json['size'] as String,
      sizeRaw: json['size_raw'] as String,
      speed: Map<String, int>.from(json['speed'] as Map),
      speedDesc: json['speed_desc'] as String,
      languages: json['languages'] as String,
      vision: json['vision'] as String,
      traits: json['traits'] as String,
      subraces: json['subraces'] as List<dynamic>,
    );

Map<String, dynamic> _$$RaceImplToJson(_$RaceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'desc': instance.desc,
      'asi_desc': instance.asiDesc,
      'asi': instance.asi,
      'age': instance.age,
      'alignment': instance.alignment,
      'size': instance.size,
      'size_raw': instance.sizeRaw,
      'speed': instance.speed,
      'speed_desc': instance.speedDesc,
      'languages': instance.languages,
      'vision': instance.vision,
      'traits': instance.traits,
      'subraces': instance.subraces,
    };
