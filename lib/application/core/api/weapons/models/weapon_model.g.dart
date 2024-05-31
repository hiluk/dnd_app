// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponImpl _$$WeaponImplFromJson(Map<String, dynamic> json) => _$WeaponImpl(
      name: json['name'] as String,
      slug: json['slug'] as String,
      category: json['category'] as String,
      cost: json['cost'] as String,
      damageDice: json['damage_dice'] as String,
      damageType: json['damage_type'] as String,
      weight: json['weight'] as String,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$WeaponImplToJson(_$WeaponImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
      'cost': instance.cost,
      'damage_dice': instance.damageDice,
      'damage_type': instance.damageType,
      'weight': instance.weight,
      'properties': instance.properties,
    };
