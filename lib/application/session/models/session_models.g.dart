// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionStateImpl _$$SessionStateImplFromJson(Map<String, dynamic> json) =>
    _$SessionStateImpl(
      currentHp: (json['currentHp'] as num).toInt(),
      tempHp: (json['tempHp'] as num?)?.toInt() ?? 0,
      hitDiceSpent: (json['hitDiceSpent'] as num?)?.toInt() ?? 0,
      deathSuccesses: (json['deathSuccesses'] as num?)?.toInt() ?? 0,
      deathFailures: (json['deathFailures'] as num?)?.toInt() ?? 0,
      isStable: json['isStable'] as bool? ?? false,
      isDead: json['isDead'] as bool? ?? false,
      conditions: (json['conditions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ConditionEnumMap, e))
              .toList() ??
          const [],
      exhaustion: (json['exhaustion'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SessionStateImplToJson(_$SessionStateImpl instance) =>
    <String, dynamic>{
      'currentHp': instance.currentHp,
      'tempHp': instance.tempHp,
      'hitDiceSpent': instance.hitDiceSpent,
      'deathSuccesses': instance.deathSuccesses,
      'deathFailures': instance.deathFailures,
      'isStable': instance.isStable,
      'isDead': instance.isDead,
      'conditions':
          instance.conditions.map((e) => _$ConditionEnumMap[e]!).toList(),
      'exhaustion': instance.exhaustion,
    };

const _$ConditionEnumMap = {
  Condition.blinded: 1,
  Condition.charmed: 2,
  Condition.deafened: 3,
  Condition.frightened: 4,
  Condition.grappled: 5,
  Condition.incapacitated: 6,
  Condition.invisible: 7,
  Condition.paralyzed: 8,
  Condition.petrified: 9,
  Condition.poisoned: 10,
  Condition.prone: 11,
  Condition.restrained: 12,
  Condition.stunned: 13,
  Condition.unconscious: 14,
};

_$SessionContextImpl _$$SessionContextImplFromJson(Map<String, dynamic> json) =>
    _$SessionContextImpl(
      baseMaxHp: (json['baseMaxHp'] as num).toInt(),
      hitDie: (json['hitDie'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      conModifier: (json['conModifier'] as num).toInt(),
    );

Map<String, dynamic> _$$SessionContextImplToJson(
        _$SessionContextImpl instance) =>
    <String, dynamic>{
      'baseMaxHp': instance.baseMaxHp,
      'hitDie': instance.hitDie,
      'level': instance.level,
      'conModifier': instance.conModifier,
    };
