import 'package:flutter_application_1/application/character/models/character_model.dart';

sealed class CharactersBlocState {}

class CharactersBlocStateError extends CharactersBlocState {
  final String error;

  CharactersBlocStateError(this.error);
}

class CharactersBlocStateLoaded extends CharactersBlocState {
  final List<Character> characters;

  CharactersBlocStateLoaded(this.characters);
}

class CharactersBlocStateLoading extends CharactersBlocState {}
