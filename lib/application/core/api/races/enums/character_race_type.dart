enum CharacterRaceType {
  human("Человек", 1),
  halfElf("Полуэльф", 2);

  final String name;
  final int jsonValue;
  const CharacterRaceType(this.name, this.jsonValue);
}
