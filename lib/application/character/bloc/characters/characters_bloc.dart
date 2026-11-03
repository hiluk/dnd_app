import 'package:bloc/bloc.dart';
import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'characters_bloc.freezed.dart';
part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository charactersRepository;
  final Logger? logger;

  CharactersBloc({required this.charactersRepository, this.logger})
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
    } catch (e, st) {
      logger?.e('Не удалось загрузить персонажей', error: e, stackTrace: st);
      emit(CharactersState.error(apiErrorMessage(e)));
    }
  }

  Future<void> _onRefresh(
    CharactersRefresh event,
    Emitter<CharactersState> emit,
  ) async {
    emit(const CharactersState.loading());
    await _onFetch(const CharactersFetch(), emit);
  }
}
