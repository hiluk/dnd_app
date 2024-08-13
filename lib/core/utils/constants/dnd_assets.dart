import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/utils/constants/races_constants.dart';

abstract class DndAssets {
  static const human = 'assets/images/human.png';
  static const halfElf = 'assets/images/half_elf.png';

  static String findRaceAsset(Race race) {
    return switch (race.name) {
      RacesConstants.human => DndAssets.human,
      RacesConstants.halfElf => DndAssets.halfElf,
      _ => DndAssets.human,
    };
  }
}
