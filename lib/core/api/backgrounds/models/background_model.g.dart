// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackgroundImpl _$$BackgroundImplFromJson(Map<String, dynamic> json) =>
    _$BackgroundImpl(
      type: (json['type'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkillEnumMap, e))
              .toList() ??
          const [],
      skillChoices: (json['skillChoices'] as num?)?.toInt() ?? 0,
      tools: json['tools'] as String? ?? '',
      languages: json['languages'] as String? ?? '',
      equipment: json['equipment'] as String? ?? '',
      feature: json['feature'] as String? ?? '',
    );

Map<String, dynamic> _$$BackgroundImplToJson(_$BackgroundImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'skills': instance.skills.map((e) => _$SkillEnumMap[e]!).toList(),
      'skillChoices': instance.skillChoices,
      'tools': instance.tools,
      'languages': instance.languages,
      'equipment': instance.equipment,
      'feature': instance.feature,
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
