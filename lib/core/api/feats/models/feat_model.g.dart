// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatImpl _$$FeatImplFromJson(Map<String, dynamic> json) => _$FeatImpl(
      slug: json['slug'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String?,
      prerequisite: json['prerequisite'] as String?,
      effectsDesc: (json['effects_desc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FeatImplToJson(_$FeatImpl instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'desc': instance.desc,
      'prerequisite': instance.prerequisite,
      'effects_desc': instance.effectsDesc,
    };
