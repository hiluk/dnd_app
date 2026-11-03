import 'package:dnd_app/application/character/bloc/current_character/current_character_event.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_state.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCharacterBloc
    extends Bloc<CurrentCharacterBlocEvent, CurrentCharacterBlocState> {
  final CharactersRepository repository;
  final String id;

  CurrentCharacterBloc(this.repository, this.id)
      : super(CurrentCharacterBlocStateLoading()) {
    on<CurrentCharacterBlocEventFetch>(_onFetch);
    on<CurrentCharacterBlocEventRefresh>(_onRefresh);
    on<CurrentCharacterBlocEventDelete>(_onDelete);

    add(CurrentCharacterBlocEventFetch());
  }

  Future<void> _onFetch(
    CurrentCharacterBlocEventFetch event,
    Emitter<CurrentCharacterBlocState> emit,
  ) async {
    try {
      final character = await repository.fetchById(id);

      emit(CurrentCharacterBlocStateLoaded(character));
    } catch (e) {
      emit(CurrentCharacterBlocStateError(apiErrorMessage(e)));
    }
  }

  Future<void> _onRefresh(
    CurrentCharacterBlocEventRefresh event,
    Emitter<CurrentCharacterBlocState> emit,
  ) async {
    emit(CurrentCharacterBlocStateLoading());
    await _onFetch(CurrentCharacterBlocEventFetch(), emit);
  }

  Future<void> _onDelete(
    CurrentCharacterBlocEventDelete event,
    Emitter<CurrentCharacterBlocState> emit,
  ) async {
    emit(CurrentCharacterBlocStateLoading());
    try {
      await repository.deleteCharacter(id);

      emit(CurrentCharacterBlocStateDeleted());
    } catch (e) {
      emit(CurrentCharacterBlocStateError(apiErrorMessage(e)));
    }
  }
}
