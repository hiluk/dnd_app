part of 'characters_bloc.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState.error(String message) = CharactersError;
  const factory CharactersState.loaded(List<Character> characters) =
      CharactersLoaded;
  const factory CharactersState.loading() = CharactersLoading;
}
