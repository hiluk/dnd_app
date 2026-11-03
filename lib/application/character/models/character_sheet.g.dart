// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterSheetImpl _$$CharacterSheetImplFromJson(Map<String, dynamic> json) =>
    _$CharacterSheetImpl(
      stats: Attributes.fromJson(json['stats'] as Map<String, dynamic>),
      modifiers: Attributes.fromJson(json['modifiers'] as Map<String, dynamic>),
      hitPoints: (json['hitPoints'] as num).toInt(),
      armorClass: (json['armorClass'] as num).toInt(),
      initiative: (json['initiative'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
      proficiencyBonus: (json['proficiencyBonus'] as num).toInt(),
      savingThrows: (json['savingThrows'] as List<dynamic>)
          .map((e) => SavingThrow.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => SkillCheck.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      passivePerception: (json['passivePerception'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$CharacterSheetImplToJson(
        _$CharacterSheetImpl instance) =>
    <String, dynamic>{
      'stats': instance.stats.toJson(),
      'modifiers': instance.modifiers.toJson(),
      'hitPoints': instance.hitPoints,
      'armorClass': instance.armorClass,
      'initiative': instance.initiative,
      'speed': instance.speed,
      'proficiencyBonus': instance.proficiencyBonus,
      'savingThrows': instance.savingThrows.map((e) => e.toJson()).toList(),
      'skills': instance.skills.map((e) => e.toJson()).toList(),
      'passivePerception': instance.passivePerception,
    };

_$SavingThrowImpl _$$SavingThrowImplFromJson(Map<String, dynamic> json) =>
    _$SavingThrowImpl(
      ability: $enumDecode(_$AbilityEnumMap, json['ability']),
      bonus: (json['bonus'] as num).toInt(),
      proficient: json['proficient'] as bool,
    );

Map<String, dynamic> _$$SavingThrowImplToJson(_$SavingThrowImpl instance) =>
    <String, dynamic>{
      'ability': _$AbilityEnumMap[instance.ability]!,
      'bonus': instance.bonus,
      'proficient': instance.proficient,
    };

const _$AbilityEnumMap = {
  Ability.strength: 1,
  Ability.dexterity: 2,
  Ability.constitution: 3,
  Ability.intelligence: 4,
  Ability.wisdom: 5,
  Ability.charisma: 6,
};

_$SkillCheckImpl _$$SkillCheckImplFromJson(Map<String, dynamic> json) =>
    _$SkillCheckImpl(
      skill: $enumDecode(_$SkillEnumMap, json['skill']),
      ability: $enumDecode(_$AbilityEnumMap, json['ability']),
      bonus: (json['bonus'] as num).toInt(),
      proficient: json['proficient'] as bool,
      expertise: json['expertise'] as bool,
    );

Map<String, dynamic> _$$SkillCheckImplToJson(_$SkillCheckImpl instance) =>
    <String, dynamic>{
      'skill': _$SkillEnumMap[instance.skill]!,
      'ability': _$AbilityEnumMap[instance.ability]!,
      'bonus': instance.bonus,
      'proficient': instance.proficient,
      'expertise': instance.expertise,
    };

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
