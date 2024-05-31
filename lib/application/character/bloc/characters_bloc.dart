import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/characters_bloc_state.dart';

class CharactersBloc extends Bloc<CharactersBlocEvent, CharactersBlocState> {
  CharactersBloc() : super(CharactersStateLoading()) {
    on<CharactersBlocFetch>(_onFetch);
    on<CharactersBlocRefresh>(_onRefresh);
  }

  Future<void> _onFetch(
    CharactersBlocFetch event,
    Emitter<CharactersBlocState> emit,
  ) async {}

  Future<void> _onRefresh(
    CharactersBlocRefresh event,
    Emitter<CharactersBlocState> emit,
  ) async {}
}
