import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCreationBloc
    extends Bloc<CharacterCreationBlocEvent, CharacterCreationBlocState> {
  final CharactersRepository charactersRepository;

  CharacterCreationBloc({required this.charactersRepository})
      : super(CharacterCreationBlocState()) {
    on<CharacterCreationBlocEventSelect>(_onSelect);
    on<CharacterCreationBlocEventCreate>(_onSave);
    on<CharacterCreationBlocEventReturn>(_onReturn);
  }

  Future<void> _onReturn(
    CharacterCreationBlocEventReturn event,
    Emitter<CharacterCreationBlocState> emit,
  ) async {
    emit(state.previousState ?? state);
  }

  Future<void> _onSave(
    CharacterCreationBlocEventCreate event,
    Emitter<CharacterCreationBlocState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, isError: false));
      await charactersRepository.saveCharacter(event.character);
      emit(state.copyWith(isLoading: false, isCreated: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }

  void _onSelect(
    CharacterCreationBlocEventSelect event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.copyWith(
      previousState: state,
      characterClass: event.characterClass ?? state.characterClass,
      characterRace: event.characterRace ?? state.characterRace,
      characterName: event.characterName ?? state.characterName,
      characterAttributes: event.characterStats ?? state.characterAttributes,
    ));
  }
}
