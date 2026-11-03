// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassImpl _$$ClassImplFromJson(Map<String, dynamic> json) => _$ClassImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      hitDice: json['hitDice'] as String,
      hpAt1stLevel: json['hpAt1stLevel'] as String,
      hpAtHigherLevels: json['hpAtHigherLevels'] as String,
      profArmor: json['profArmor'] as String,
      profWeapon: json['profWeapon'] as String,
      profTool: json['profTool'] as String,
      profSavingThrows: json['profSavingThrows'] as String,
      profSkills: json['profSkills'] as String,
      equipment: json['equipment'] as String,
      spellCastingAbility: json['spellCastingAbility'] as String,
      hitDie: (json['hitDie'] as num?)?.toInt() ?? 0,
      savingThrows: (json['savingThrows'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AbilityEnumMap, e))
              .toList() ??
          const [],
      skillChoices: (json['skillChoices'] as num?)?.toInt() ?? 0,
      skillOptions: (json['skillOptions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkillEnumMap, e))
              .toList() ??
          const [],
      expertiseChoices: (json['expertiseChoices'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ClassImplToJson(_$ClassImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'hitDice': instance.hitDice,
      'hpAt1stLevel': instance.hpAt1stLevel,
      'hpAtHigherLevels': instance.hpAtHigherLevels,
      'profArmor': instance.profArmor,
      'profWeapon': instance.profWeapon,
      'profTool': instance.profTool,
      'profSavingThrows': instance.profSavingThrows,
      'profSkills': instance.profSkills,
      'equipment': instance.equipment,
      'spellCastingAbility': instance.spellCastingAbility,
      'hitDie': instance.hitDie,
      'savingThrows':
          instance.savingThrows.map((e) => _$AbilityEnumMap[e]!).toList(),
      'skillChoices': instance.skillChoices,
      'skillOptions':
          instance.skillOptions.map((e) => _$SkillEnumMap[e]!).toList(),
      'expertiseChoices': instance.expertiseChoices,
    };

const _$AbilityEnumMap = {
  Ability.strength: 1,
  Ability.dexterity: 2,
  Ability.constitution: 3,
  Ability.intelligence: 4,
  Ability.wisdom: 5,
  Ability.charisma: 6,
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
