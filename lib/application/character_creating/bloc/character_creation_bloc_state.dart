import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_creation_bloc_state.freezed.dart';

@freezed
class CharacterCreationBlocState with _$CharacterCreationBlocState {
  factory CharacterCreationBlocState({
    @Default('') String characterName,
    @Default(false) bool isLoading,
    @Default(false) bool isCreated,
    CharacterCreationBlocState? previousState,
    Attributes? characterAttributes,
    Race? characterRace,
    Class? characterClass,
  }) = _CharacterCreationBlocState;
}
