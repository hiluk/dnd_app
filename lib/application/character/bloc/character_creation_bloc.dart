import 'package:flutter_application_1/application/character/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/character_creation_bloc_state.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCreationBloc
    extends Bloc<CharacterCreationBlocEvent, CharacterCreationBlocState> {
  final CharactersRepository charactersRepository;

  CharacterCreationBloc({required this.charactersRepository})
      : super(CharacterCreationBlocState()) {
    on<CharacterCreationBlocEventSelect>(_select);
  }

  void _select(
    CharacterCreationBlocEventSelect event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.copyWith(
      characterClass: event.characterClass ?? state.characterClass,
      characterRace: event.characterRace ?? state.characterRace,
      characterName: event.characterName ?? state.characterName,
      characterAttributes: event.characterStats ?? state.characterAttributes,
    ));
    print(state.characterRace?.name);
    print(state.characterClass?.name);
  }
}
