import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CharacterCreationBloc
    extends Bloc<CharacterCreationBlocEvent, CharacterCreationBlocState> {
  final CharactersRepository charactersRepository;
  final Logger _logger;

  CharacterCreationBloc(this.charactersRepository, this._logger)
      : super(CharacterCreationBlocState()) {
    on<CharacterCreationBlocEventSelect>(_onSelect);
    on<CharacterCreationBlocEventCreate>(_onSave);
    on<CharacterCreationBlocEventReturn>(_onReturn);
  }

  @override
  void onChange(Change<CharacterCreationBlocState> change) {
    final next = change.nextState;
    final stats = next.characterAttributes;
    _logger.d(
      '''
      Стейт создания персонажа изменился!
      Раса: ${next.characterRace?.name ?? "Нет"}
      Класс: ${next.characterClass?.name ?? "Нет"}
      Характеристики:
        Сила: ${stats?.strength ?? 0}
        Ловкость: ${stats?.dexterity ?? 0}
        Телосложение: ${stats?.constitution ?? 0}
        Интеллект: ${stats?.intelligence ?? 0}
        Мудрость: ${stats?.wisdom ?? 0}
        Харизма: ${stats?.charisma ?? 0}
      Имя: ${next.characterName}
      ''',
    );
    super.onChange(change);
  }

  void _onReturn(
    CharacterCreationBlocEventReturn event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.previousState ?? state);
  }

  Future<void> _onSave(
    CharacterCreationBlocEventCreate event,
    Emitter<CharacterCreationBlocState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await charactersRepository.saveCharacter(event.character);

      emit(state.copyWith(isLoading: false, isCreated: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: apiErrorMessage(e)));
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
