// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RaceImpl _$$RaceImplFromJson(Map<String, dynamic> json) => _$RaceImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      asi: (json['asi'] as List<dynamic>)
          .map((e) => Asi.fromJson(e as Map<String, dynamic>))
          .toList(),
      age: json['age'] as String,
      size: json['size'] as String,
      speed: (json['speed'] as List<dynamic>)
          .map((e) => Speed.fromJson(e as Map<String, dynamic>))
          .toList(),
      language: json['language'] as String,
      vision: json['vision'] as String,
      traits: json['traits'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkillEnumMap, e))
              .toList() ??
          const [],
      skillChoices: (json['skillChoices'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RaceImplToJson(_$RaceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'asi': instance.asi.map((e) => e.toJson()).toList(),
      'age': instance.age,
      'size': instance.size,
      'speed': instance.speed.map((e) => e.toJson()).toList(),
      'language': instance.language,
      'vision': instance.vision,
      'traits': instance.traits,
      'skills': instance.skills.map((e) => _$SkillEnumMap[e]!).toList(),
      'skillChoices': instance.skillChoices,
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
