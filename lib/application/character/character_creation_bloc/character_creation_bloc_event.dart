import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';

sealed class CharacterCreationBlocEvent {}

class CharacterCreationBlocEventCreate extends CharacterCreationBlocEvent {
  final Character character;

  CharacterCreationBlocEventCreate(this.character);
}

class CharacterCreationBlocEventSelect extends CharacterCreationBlocEvent {
  final Class? characterClass;
  final String? characterName;
  final Race? characterRace;
  final Attributes? characterStats;

  CharacterCreationBlocEventSelect({
    this.characterClass,
    this.characterName,
    this.characterRace,
    this.characterStats
  });
}
