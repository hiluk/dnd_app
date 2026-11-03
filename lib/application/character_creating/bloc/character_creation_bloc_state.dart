import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character/models/character_sheet.dart';
import 'package:dnd_app/application/character_creating/models/character_draft.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_creation_bloc_state.freezed.dart';

/// Шаги мастера создания персонажа
enum CreationStep {
  race,
  characterClass,
  method,
  assignment,
  bonusChoice,
  background,
  skills,
  summary,
}

@freezed
class CharacterCreationBlocState with _$CharacterCreationBlocState {
  const CharacterCreationBlocState._();

  factory CharacterCreationBlocState({
    @Default(false) bool isLoading,
    @Default(false) bool isCreated,
    String? errorMessage,
    CharacterCreationBlocState? previousState,
    Race? characterRace,
    Class? characterClass,
    GenerationMethod? generationMethod,

    /// Базовые характеристики (до бонусов расы)
    Attributes? baseStats,
    String? rollToken,

    /// Выбор бонусов расы; null — ещё не выбраны
    List<Ability>? bonusChoices,
    Background? background,

    /// Выбор навыков; null — шаг навыков ещё не пройден
    SkillSelection? skills,

    /// Лист, посчитанный сервером для текущего черновика
    CharacterSheet? sheet,
    @Default(false) bool isPreviewLoading,
    String? previewError,
  }) = _CharacterCreationBlocState;

  /// Сколько характеристик раса даёт выбрать для бонуса «на выбор»
  int get requiredBonusChoices => characterRace == null
      ? 0
      : characterRace!.asi
          .where((e) => e.ability == null)
          .fold(0, (sum, e) => sum + e.choices);

  /// Характеристики с фиксированными бонусами расы (их нельзя выбрать)
  Set<Ability> get fixedBonusAbilities => {
        for (final asi in characterRace?.asi ?? const [])
          if (asi.ability != null) asi.ability!,
      };

  CreationStep get step {
    if (characterRace == null) return CreationStep.race;
    if (characterClass == null) return CreationStep.characterClass;
    if (generationMethod == null) return CreationStep.method;
    if (baseStats == null) return CreationStep.assignment;
    if (requiredBonusChoices > 0 && bonusChoices == null) {
      return CreationStep.bonusChoice;
    }
    if (background == null) return CreationStep.background;
    if (skills == null) return CreationStep.skills;
    return CreationStep.summary;
  }

  /// Черновик для сервера, если для него хватает данных
  CharacterDraft? draft({
    String name = '',
    Attributes? baseStats,
    String? rollToken,
    List<Ability>? bonusChoices,
    SkillSelection? skills,
  }) {
    final stats = baseStats ?? this.baseStats;
    if (characterRace == null ||
        characterClass == null ||
        generationMethod == null ||
        stats == null) {
      return null;
    }

    return CharacterDraft(
      name: name,
      characterRace: characterRace!,
      characterClass: characterClass!,
      generationMethod: generationMethod!,
      baseStats: stats,
      rollToken: rollToken ?? this.rollToken,
      bonusChoices: bonusChoices ?? this.bonusChoices ?? const [],
      // Пока навыки не выбраны, превью считается без предыстории
      background: (skills ?? this.skills) == null ? null : background,
      backgroundSkills: (skills ?? this.skills)?.background ?? const [],
      raceSkills: (skills ?? this.skills)?.race ?? const [],
      classSkills: (skills ?? this.skills)?.characterClass ?? const [],
      expertise: (skills ?? this.skills)?.expertise ?? const [],
    );
  }
}

/// Выбор навыков по источникам
@freezed
class SkillSelection with _$SkillSelection {
  const SkillSelection._();

  const factory SkillSelection({
    /// Навыки своей предыстории
    @Default([]) List<Skill> background,

    /// Навыки расы на выбор (полуэльф)
    @Default([]) List<Skill> race,
    @Default([]) List<Skill> characterClass,

    /// Компетентность (плут)
    @Default([]) List<Skill> expertise,
  }) = _SkillSelection;
}
