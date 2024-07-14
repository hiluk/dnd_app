import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';

sealed class CharacterCreationBlocEvent {}

class CharacterCreationBlocEventCreate extends CharacterCreationBlocEvent {
  final Character character;

  CharacterCreationBlocEventCreate(this.character);
}

class CharacterCreationBlocEventSelectClass extends CharacterCreationBlocEvent {
  final Class characterClass;

  CharacterCreationBlocEventSelectClass(this.characterClass);
}

class CharacterCreationBlocEventSelectName extends CharacterCreationBlocEvent {
  final String name;

  CharacterCreationBlocEventSelectName(this.name);
}

class CharacterCreationBlocEventSelectRace extends CharacterCreationBlocEvent {
  final Race race;

  CharacterCreationBlocEventSelectRace(this.race);
}

class CharacterCreationBlocEventSelectStats extends CharacterCreationBlocEvent {
  final Attributes stats;

  CharacterCreationBlocEventSelectStats(this.stats);
}
