import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/utils/constants/races_constants.dart';

abstract class DndAssets {
  static const human = 'assets/images/human.png';

  static String findRaceAsset(Race race) {
    return switch (race.name) {
      RacesConstants.human => DndAssets.human,
      _ => DndAssets.human,
    };
  }
}
