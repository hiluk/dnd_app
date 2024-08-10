import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character_creating/models/character_dto.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';

sealed class CharacterCreationBlocEvent {}

class CharacterCreationBlocEventCreate extends CharacterCreationBlocEvent {
  final CharacterDto character;

  CharacterCreationBlocEventCreate(this.character);
}

class CharacterCreationBlocEventReturn extends CharacterCreationBlocEvent {
  CharacterCreationBlocEventReturn();
}

class CharacterCreationBlocEventSelect extends CharacterCreationBlocEvent {
  final Class? characterClass;
  final CharacterCreationBlocState? previousState;
  final String? characterName;
  final Race? characterRace;
  final Attributes? characterStats;

  CharacterCreationBlocEventSelect(
      {this.characterClass,
      this.characterName,
      this.previousState,
      this.characterRace,
      this.characterStats});
}
