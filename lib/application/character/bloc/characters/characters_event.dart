part of 'characters_bloc.dart';

@freezed
class CharactersEvent with _$CharactersEvent {
  const factory CharactersEvent.fetch() = CharactersFetch;
  const factory CharactersEvent.refresh() = CharactersRefresh;
}
