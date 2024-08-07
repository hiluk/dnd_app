import 'package:flutter_application_1/core/utils/constants/races_constants.dart';

enum CharacterRaceType {
  human(RacesConstants.human, 1),
  halfElf(RacesConstants.halfElf, 2);

  final String name;
  final int jsonValue;
  const CharacterRaceType(this.name, this.jsonValue);
}
