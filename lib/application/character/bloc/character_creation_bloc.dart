import 'package:flutter_application_1/application/character/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCreationBloc
    extends Bloc<CharacterCreationBlocEvent, CharacterCreationBlocState> {
  final CharactersRepository charactersRepository;

  CharacterCreationBloc({required this.charactersRepository})
      : super(CharacterCreationBlocState()) {
    on<CharacterCreationBlocEventSelectName>(_selectName);
    on<CharacterCreationBlocEventSelectRace>(_selectRace);
    on<CharacterCreationBlocEventSelectClass>(_selectClass);
    on<CharacterCreationBlocEventSelectStats>(_selectStats);
  }

  void _selectClass(
    CharacterCreationBlocEventSelectClass event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.copyWith(characterClass: event.characterClass));
  }

  void _selectName(
    CharacterCreationBlocEventSelectName event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.copyWith(characterName: event.name));
  }

  void _selectRace(
    CharacterCreationBlocEventSelectRace event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.copyWith(characterRace: event.race));
  }

  void _selectStats(
    CharacterCreationBlocEventSelectStats event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.copyWith(characterAttributes: event.stats));
  }
}
