import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
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

  CharacterCreationBlocState get _emptyState => CharacterCreationBlocState();

  @override
  void onChange(Change<CharacterCreationBlocState> change) {
    _logger.i(
      '''
      Стейт создания персонажа изменился!
      Текущий персонаж:
      Раса: ${change.nextState.characterRace?.name ?? "Нет"} 
      Класс: ${change.nextState.characterClass?.name ?? "Нет"}
      Характеристики: 
        Ловкость: ${change.nextState.characterAttributes?.dexterity ?? 0}
        Сила: ${change.nextState.characterAttributes?.strength ?? 0}
        Телосложение: ${change.nextState.characterAttributes?.intelligence ?? 0}
        Мудрость: ${change.nextState.characterAttributes?.wisdom ?? 0}
        Харизма: ${change.nextState.characterAttributes?.charisma ?? 0}
      Имя: ${change.nextState.characterName}
      ''',
    );
    super.onChange(change);
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

      await Future.delayed(const Duration(seconds: 1));
      await charactersRepository.saveCharacter(event.character);
      emit(state.copyWith(isLoading: false, isCreated: true));

      await null;

      emit(_emptyState);
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
