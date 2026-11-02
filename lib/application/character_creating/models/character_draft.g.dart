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
      background: _$JsonConverterFromJson<int, Background>(
          json['background'], const BackgroundConverter().fromJson),
      backgroundSkills: (json['backgroundSkills'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkillEnumMap, e))
              .toList() ??
          const [],
      raceSkills: (json['raceSkills'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkillEnumMap, e))
              .toList() ??
          const [],
      classSkills: (json['classSkills'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkillEnumMap, e))
              .toList() ??
          const [],
      expertise: (json['expertise'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkillEnumMap, e))
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

  writeNotNull(
      'background',
      _$JsonConverterToJson<int, Background>(
          instance.background, const BackgroundConverter().toJson));
  val['backgroundSkills'] =
      instance.backgroundSkills.map((e) => _$SkillEnumMap[e]!).toList();
  val['raceSkills'] =
      instance.raceSkills.map((e) => _$SkillEnumMap[e]!).toList();
  val['classSkills'] =
      instance.classSkills.map((e) => _$SkillEnumMap[e]!).toList();
  val['expertise'] = instance.expertise.map((e) => _$SkillEnumMap[e]!).toList();
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$SkillEnumMap = {
  Skill.acrobatics: 1,
  Skill.animalHandling: 2,
  Skill.arcana: 3,
  Skill.athletics: 4,
  Skill.deception: 5,
  Skill.history: 6,
  Skill.insight: 7,
  Skill.intimidation: 8,
  Skill.investigation: 9,
  Skill.medicine: 10,
  Skill.nature: 11,
  Skill.perception: 12,
  Skill.performance: 13,
  Skill.persuasion: 14,
  Skill.religion: 15,
  Skill.sleightOfHand: 16,
  Skill.stealth: 17,
  Skill.survival: 18,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
