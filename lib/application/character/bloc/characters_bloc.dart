import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc_state.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';

class CharactersBloc extends Bloc<CharactersBlocEvent, CharactersBlocState> {
  final CharactersRepository charactersRepository;
  CharactersBloc({required this.charactersRepository})
      : super(CharactersBlocStateLoading()) {
    on<CharactersBlocEventFetch>(_onFetch);
    on<CharactersBlocEventRefresh>(_onRefresh);

    add(CharactersBlocEventFetch());
  }

  Future<void> _onFetch(
    CharactersBlocEventFetch event,
    Emitter<CharactersBlocState> emit,
  ) async {
    try {
      final characters = await charactersRepository.fetch();

      emit(CharactersBlocStateLoaded(characters));
    } catch (e) {
      emit(CharactersBlocStateError(e.toString()));
    }
  }

  Future<void> _onRefresh(
    CharactersBlocEventRefresh event,
    Emitter<CharactersBlocState> emit,
  ) async {
    emit(CharactersBlocStateLoading());
    add(CharactersBlocEventFetch());
  }
}
