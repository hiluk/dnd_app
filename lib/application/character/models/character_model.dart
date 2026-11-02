import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character/models/character_sheet.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/api/backgrounds/converters/background_converter.dart';
import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/api/classes/converters/class_converter.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/converters/race_converter.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class Character with _$Character {
  factory Character({
    required String name,
    required String id,
    required int level,
    @CharacterRaceTypeConverter() required Race characterRace,
    @CharacterClassTypeConverter() required Class characterClass,
    required GenerationMethod generationMethod,

    /// Базовые характеристики (до бонусов расы)
    required Attributes baseStats,
    @Default([]) List<Ability> bonusChoices,

    @BackgroundConverter() required Background background,

    /// Навыки, выбранные для своей предыстории
    @Default([]) List<Skill> backgroundSkills,

    /// Навыки, выбранные от расы (полуэльф)
    @Default([]) List<Skill> raceSkills,

    /// Навыки, выбранные из списка класса
    @Default([]) List<Skill> classSkills,

    /// Навыки с компетентностью (плут)
    @Default([]) List<Skill> expertise,

    /// Итоговые и производные значения, посчитанные сервером
    required CharacterSheet sheet,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
