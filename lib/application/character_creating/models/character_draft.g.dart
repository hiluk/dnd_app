// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterDraftImpl _$$CharacterDraftImplFromJson(Map<String, dynamic> json) =>
    _$CharacterDraftImpl(
      name: json['name'] as String? ?? '',
      characterRace: const CharacterRaceTypeConverter()
          .fromJson((json['characterRace'] as num).toInt()),
      characterClass: const CharacterClassTypeConverter()
          .fromJson((json['characterClass'] as num).toInt()),
      generationMethod:
          $enumDecode(_$GenerationMethodEnumMap, json['generationMethod']),
      baseStats: Attributes.fromJson(json['baseStats'] as Map<String, dynamic>),
      bonusChoices: (json['bonusChoices'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AbilityEnumMap, e))
              .toList() ??
          const [],
      rollToken: json['rollToken'] as String?,
    );

Map<String, dynamic> _$$CharacterDraftImplToJson(
    _$CharacterDraftImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'characterRace':
        const CharacterRaceTypeConverter().toJson(instance.characterRace),
    'characterClass':
        const CharacterClassTypeConverter().toJson(instance.characterClass),
    'generationMethod': _$GenerationMethodEnumMap[instance.generationMethod]!,
    'baseStats': instance.baseStats.toJson(),
    'bonusChoices':
        instance.bonusChoices.map((e) => _$AbilityEnumMap[e]!).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rollToken', instance.rollToken);
  return val;
}

const _$GenerationMethodEnumMap = {
  GenerationMethod.standardArray: 1,
  GenerationMethod.pointBuy: 2,
  GenerationMethod.roll: 3,
};

const _$AbilityEnumMap = {
  Ability.strength: 1,
  Ability.dexterity: 2,
  Ability.constitution: 3,
  Ability.intelligence: 4,
  Ability.wisdom: 5,
  Ability.charisma: 6,
};
