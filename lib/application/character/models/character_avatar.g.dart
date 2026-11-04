// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterAvatarImpl _$$CharacterAvatarImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterAvatarImpl(
      url: json['url'] as String,
      hasTransparency: json['hasTransparency'] as bool? ?? false,
      mode: $enumDecodeNullable(_$AvatarModeEnumMap, json['mode']) ??
          AvatarMode.frame,
      offsetX: (json['offsetX'] as num?)?.toDouble() ?? 0,
      offsetY: (json['offsetY'] as num?)?.toDouble() ?? 0,
      scale: (json['scale'] as num?)?.toDouble() ?? 1,
    );

Map<String, dynamic> _$$CharacterAvatarImplToJson(
        _$CharacterAvatarImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'hasTransparency': instance.hasTransparency,
      'mode': _$AvatarModeEnumMap[instance.mode]!,
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'scale': instance.scale,
    };

const _$AvatarModeEnumMap = {
  AvatarMode.frame: 1,
  AvatarMode.figure: 2,
};

_$AvatarLayoutImpl _$$AvatarLayoutImplFromJson(Map<String, dynamic> json) =>
    _$AvatarLayoutImpl(
      mode: $enumDecodeNullable(_$AvatarModeEnumMap, json['mode']) ??
          AvatarMode.frame,
      offsetX: (json['offsetX'] as num?)?.toDouble() ?? 0,
      offsetY: (json['offsetY'] as num?)?.toDouble() ?? 0,
      scale: (json['scale'] as num?)?.toDouble() ?? 1,
    );

Map<String, dynamic> _$$AvatarLayoutImplToJson(_$AvatarLayoutImpl instance) =>
    <String, dynamic>{
      'mode': _$AvatarModeEnumMap[instance.mode]!,
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'scale': instance.scale,
    };
