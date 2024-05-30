// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackgroundImpl _$$BackgroundImplFromJson(Map<String, dynamic> json) =>
    _$BackgroundImpl(
      name: json['name'] as String,
      slug: json['slug'] as String,
      desc: json['desc'] as String,
      skillProficiencies: json['skill_proficiencies'] as String?,
      toolProficiencies: json['tool_proficiencies'] as String?,
      languages: json['languages'] as String?,
      equipment: json['equipment'] as String,
      feature: json['feature'] as String,
      featureDesc: json['feature_desc'] as String,
      suggestedCharacteristics: json['suggested_characteristics'] as String,
    );

Map<String, dynamic> _$$BackgroundImplToJson(_$BackgroundImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'desc': instance.desc,
      'skill_proficiencies': instance.skillProficiencies,
      'tool_proficiencies': instance.toolProficiencies,
      'languages': instance.languages,
      'equipment': instance.equipment,
      'feature': instance.feature,
      'feature_desc': instance.featureDesc,
      'suggested_characteristics': instance.suggestedCharacteristics,
    };
