sealed class CurrentCharacterBlocEvent {}

class CurrentCharacterBlocEventFetch extends CurrentCharacterBlocEvent {
  CurrentCharacterBlocEventFetch();
}

class CurrentCharacterBlocEventRefresh extends CurrentCharacterBlocEvent {
  CurrentCharacterBlocEventRefresh();
}

class CurrentCharacterBlocEventDelete extends CurrentCharacterBlocEvent {
  CurrentCharacterBlocEventDelete();
}
