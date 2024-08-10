import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/utils/constants/classes_constants.dart';
import 'package:flutter_application_1/core/utils/constants/races_constants.dart';

abstract class DndAssets {
  static const human = 'assets/images/human.png';
  static const warrior = 'assets/images/warrior.png';

  static String findRaceAsset(Race race) {
    return switch (race.name) {
      RacesConstants.human => DndAssets.human,
      _ => DndAssets.human,
    };
  }

  static String findClassAsset(Class characterClass) {
    return switch (characterClass.name) {
      CharacterClassConstants.warrior => DndAssets.warrior,
      _ => DndAssets.human,
    };
  }
}
