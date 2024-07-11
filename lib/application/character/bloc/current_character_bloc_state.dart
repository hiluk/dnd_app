import 'package:flutter_application_1/application/character/models/character_model.dart';

class CurrentCharacterBlocStateLoaded extends CurrentCharacterBlocState {
  final Character character;

  CurrentCharacterBlocStateLoaded(this.character);
}

sealed class CurrentCharacterBlocState {}

class CurrentCharacterBlocStateError extends CurrentCharacterBlocState {
  final String error;

  CurrentCharacterBlocStateError(this.error);
}

class CurrentCharacterBlocStateLoading extends CurrentCharacterBlocState {}
