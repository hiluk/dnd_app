import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'characters_bloc.freezed.dart';
part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersBloc({required this.charactersRepository})
      : super(const CharactersState.loading()) {
    on<CharactersFetch>(_onFetch);
    on<CharactersRefresh>(_onRefresh);

    add(const CharactersEvent.fetch());
  }

  Future<void> _onFetch(
    CharactersFetch event,
    Emitter<CharactersState> emit,
  ) async {
    try {
      final characters = await charactersRepository.fetch();

      emit(CharactersState.loaded(characters));
    } catch (e) {
      emit(CharactersState.error(e.toString()));
    }
  }

  Future<void> _onRefresh(
    CharactersRefresh event,
    Emitter<CharactersState> emit,
  ) async {
    emit(const CharactersState.loading());
    add(const CharactersEvent.fetch());
  }
}
