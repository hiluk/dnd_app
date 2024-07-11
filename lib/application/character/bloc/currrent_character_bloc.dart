import 'package:flutter_application_1/application/character/bloc/current_character_bloc_event.dart';
import 'package:flutter_application_1/application/character/bloc/current_character_bloc_state.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCharacterBloc
    extends Bloc<CurrentCharacterBlocEvent, CurrentCharacterBlocState> {
  final CharactersRepository repository;
  final String name;
  CurrentCharacterBloc(this.repository, this.name)
      : super(CurrentCharacterBlocStateLoading()) {
    on<CurrentCharacterBlocEventFetch>(_onFetch);
    on<CurrentCharacterBlocEventRefresh>(_onRefresh);

    add(CurrentCharacterBlocEventFetch());
  }

  Future<void> _onFetch(
    CurrentCharacterBlocEventFetch event,
    Emitter<CurrentCharacterBlocState> emit,
  ) async {
    try {
      final character = await repository.fetchByName(
        name: name,
        email: "kestos1243@mail.ru",
      );

      emit(CurrentCharacterBlocStateLoaded(character));
    } catch (e) {
      emit(CurrentCharacterBlocStateError(e.toString()));
    }
  }

  Future<void> _onRefresh(
    CurrentCharacterBlocEventRefresh event,
    Emitter<CurrentCharacterBlocState> emit,
  ) async {
    emit(CurrentCharacterBlocStateLoading());

    add(CurrentCharacterBlocEventFetch(

    ));
  }
}
