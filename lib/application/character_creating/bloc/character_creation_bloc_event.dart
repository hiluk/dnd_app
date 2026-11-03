import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character_creating/models/character_draft.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';

sealed class CharacterCreationBlocEvent {}

/// Создать персонажа из текущего черновика
class CharacterCreationBlocEventCreate extends CharacterCreationBlocEvent {
  final String name;

  CharacterCreationBlocEventCreate(this.name);
}

class CharacterCreationBlocEventReturn extends CharacterCreationBlocEvent {
  CharacterCreationBlocEventReturn();
}

/// Зафиксировать выбор на текущем шаге и перейти к следующему
class CharacterCreationBlocEventSelect extends CharacterCreationBlocEvent {
  final Race? characterRace;
  final Class? characterClass;
  final GenerationMethod? generationMethod;
  final Attributes? baseStats;
  final String? rollToken;
  final List<Ability>? bonusChoices;
  final Background? background;
  final SkillSelection? skills;

  CharacterCreationBlocEventSelect({
    this.background,
    this.skills,
    this.characterRace,
    this.characterClass,
    this.generationMethod,
    this.baseStats,
    this.rollToken,
    this.bonusChoices,
  });
}

/// Посчитать лист для черновика (живой предпросмотр)
class CharacterCreationBlocEventPreview extends CharacterCreationBlocEvent {
  final CharacterDraft draft;

  CharacterCreationBlocEventPreview(this.draft);
}
