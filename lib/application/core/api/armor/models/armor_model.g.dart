// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'armor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArmorImpl _$$ArmorImplFromJson(Map<String, dynamic> json) => _$ArmorImpl(
      name: json['name'] as String,
      slug: json['slug'] as String,
      category: json['category'] as String,
      baseAc: json['base_ac'] as int,
      baseDexMod: json['base_dex_mod'] as bool?,
      baseConMod: json['base_con_mod'] as bool?,
      baseWisMod: json['base_wis_mod'] as bool?,
      baseFlatMod: json['base_flat_mod'] as bool?,
      plusMax: json['plus_max'] as int,
      acString: json['ac_string'] as String,
      strengthRequirement: json['strength_requirement'] as int?,
      cost: json['cost'] as String,
      weight: json['weight'] as String,
      stealtDisadvantage: json['stealth_disadvantage'] as bool,
    );

Map<String, dynamic> _$$ArmorImplToJson(_$ArmorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
      'base_ac': instance.baseAc,
      'base_dex_mod': instance.baseDexMod,
      'base_con_mod': instance.baseConMod,
      'base_wis_mod': instance.baseWisMod,
      'base_flat_mod': instance.baseFlatMod,
      'plus_max': instance.plusMax,
      'ac_string': instance.acString,
      'strength_requirement': instance.strengthRequirement,
      'cost': instance.cost,
      'weight': instance.weight,
      'stealth_disadvantage': instance.stealtDisadvantage,
    };
