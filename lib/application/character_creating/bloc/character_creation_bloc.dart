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

  /// Номер последнего запроса превью: ответы на устаревшие запросы игнорируются
  int _previewRequest = 0;

  CharacterCreationBloc(this.charactersRepository, this._logger)
      : super(CharacterCreationBlocState()) {
    on<CharacterCreationBlocEventSelect>(_onSelect);
    on<CharacterCreationBlocEventCreate>(_onSave);
    on<CharacterCreationBlocEventReturn>(_onReturn);
    on<CharacterCreationBlocEventPreview>(_onPreview);
  }

  @override
  void onChange(Change<CharacterCreationBlocState> change) {
    final next = change.nextState;
    _logger.d(
      'Мастер создания: шаг ${next.step.name}, '
      'раса ${next.characterRace?.name ?? "—"}, '
      'класс ${next.characterClass?.name ?? "—"}, '
      'способ ${next.generationMethod?.title ?? "—"}, '
      'база ${next.baseStats}, бонусы ${next.bonusChoices}, '
      'предыстория ${next.background?.name ?? "—"}, навыки ${next.skills}',
    );
    super.onChange(change);
  }

  void _onReturn(
    CharacterCreationBlocEventReturn event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    _previewRequest++;
    emit(state.previousState ?? state);
  }

  void _onSelect(
    CharacterCreationBlocEventSelect event,
    Emitter<CharacterCreationBlocState> emit,
  ) {
    emit(state.copyWith(
      previousState: state,
      characterRace: event.characterRace ?? state.characterRace,
      characterClass: event.characterClass ?? state.characterClass,
      generationMethod: event.generationMethod ?? state.generationMethod,
      baseStats: event.baseStats ?? state.baseStats,
      rollToken: event.rollToken ?? state.rollToken,
      bonusChoices: event.bonusChoices ?? state.bonusChoices,
      background: event.background ?? state.background,
      skills: event.skills ?? state.skills,
      errorMessage: null,
      previewError: null,
    ));

    if (state.step == CreationStep.summary) {
      add(CharacterCreationBlocEventPreview(state.draft()!));
    }
  }

  Future<void> _onPreview(
    CharacterCreationBlocEventPreview event,
    Emitter<CharacterCreationBlocState> emit,
  ) async {
    final request = ++_previewRequest;
    emit(state.copyWith(isPreviewLoading: true, previewError: null));
    try {
      final sheet = await charactersRepository.preview(event.draft);
      if (request != _previewRequest) return;

      emit(state.copyWith(sheet: sheet, isPreviewLoading: false));
    } catch (e) {
      if (request != _previewRequest) return;

      emit(state.copyWith(
        sheet: null,
        isPreviewLoading: false,
        previewError: apiErrorMessage(e),
      ));
    }
  }

  Future<void> _onSave(
    CharacterCreationBlocEventCreate event,
    Emitter<CharacterCreationBlocState> emit,
  ) async {
    final draft = state.draft(name: event.name.trim());
    if (draft == null) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await charactersRepository.saveCharacter(draft);

      emit(state.copyWith(isLoading: false, isCreated: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: apiErrorMessage(e)));
    }
  }
}
