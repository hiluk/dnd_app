// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_roll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbilityRollImpl _$$AbilityRollImplFromJson(Map<String, dynamic> json) =>
    _$AbilityRollImpl(
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$AbilityRollImplToJson(_$AbilityRollImpl instance) =>
    <String, dynamic>{
      'values': instance.values,
      'token': instance.token,
    };
