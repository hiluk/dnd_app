// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AsiImpl _$$AsiImplFromJson(Map<String, dynamic> json) => _$AsiImpl(
      stat: json['stat'] as String,
      value: (json['value'] as num).toInt(),
      ability: $enumDecodeNullable(_$AbilityEnumMap, json['ability']),
      choices: (json['choices'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$AsiImplToJson(_$AsiImpl instance) => <String, dynamic>{
      'stat': instance.stat,
      'value': instance.value,
      'ability': _$AbilityEnumMap[instance.ability],
      'choices': instance.choices,
    };

const _$AbilityEnumMap = {
  Ability.strength: 1,
  Ability.dexterity: 2,
  Ability.constitution: 3,
  Ability.intelligence: 4,
  Ability.wisdom: 5,
  Ability.charisma: 6,
};
