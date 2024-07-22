// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RaceImpl _$$RaceImplFromJson(Map<String, dynamic> json) => _$RaceImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      asi: (json['asi'] as List<dynamic>)
          .map((e) => Asi.fromJson(e as Map<String, dynamic>))
          .toList(),
      age: json['age'] as String,
      size: json['size'] as String,
      speed: (json['speed'] as List<dynamic>)
          .map((e) => Speed.fromJson(e as Map<String, dynamic>))
          .toList(),
      language: json['language'] as String,
      vision: json['vision'] as String,
      traits: json['traits'] as String,
    );

Map<String, dynamic> _$$RaceImplToJson(_$RaceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'asi': instance.asi,
      'age': instance.age,
      'size': instance.size,
      'speed': instance.speed,
      'language': instance.language,
      'vision': instance.vision,
      'traits': instance.traits,
    };
