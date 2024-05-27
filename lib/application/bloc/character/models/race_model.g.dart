// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RaceImpl _$$RaceImplFromJson(Map<String, dynamic> json) => _$RaceImpl(
      name: json['name'] as String,
      slug: json['slug'] as String,
      desc: json['desc'] as String,
      asiDesc: json['asiDesc'] as String,
      asi: (json['asi'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList())
          .toList(),
      age: json['age'] as String,
      alignment: json['alignment'] as String,
      size: json['size'] as String,
      sizeRaw: json['sizeRaw'] as String,
      speed: Map<String, int>.from(json['speed'] as Map),
      speedDesc: json['speedDesc'] as String,
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
      'asiDesc': instance.asiDesc,
      'asi': instance.asi,
      'age': instance.age,
      'alignment': instance.alignment,
      'size': instance.size,
      'sizeRaw': instance.sizeRaw,
      'speed': instance.speed,
      'speedDesc': instance.speedDesc,
      'languages': instance.languages,
      'vision': instance.vision,
      'traits': instance.traits,
      'subraces': instance.subraces,
    };
