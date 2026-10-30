import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';

/// Ответы сервера в том виде, в каком их отдаёт dnd_api
Map<String, dynamic> raceJson(String name) => {
      'name': name,
      'description': '',
      'age': '',
      'size': 'Средний',
      'language': '',
      'vision': '',
      'traits': '',
      'asi': [
        {'stat': 'Харизма', 'value': 2},
      ],
      'speed': [
        {'type': 'Ходьба', 'value': 30},
      ],
    };

Map<String, dynamic> classJson(String name) => {
      'name': name,
      'description': '',
      'hitDice': '1к10',
      'hpAt1stLevel': '',
      'hpAtHigherLevels': '',
      'profArmor': '',
      'profWeapon': '',
      'profTool': '',
      'profSavingThrows': '',
      'profSkills': '',
      'equipment': '',
      'spellCastingAbility': '',
    };

final racesJson = [raceJson('Человек'), raceJson('Полуэльф')];
final classesJson = [
  classJson('Воин'),
  classJson('Варвар'),
  classJson('Рейнджер'),
  classJson('Вор'),
];

List<Race> get races => racesJson.map(Race.fromJson).toList();
List<Class> get classes => classesJson.map(Class.fromJson).toList();

Map<String, dynamic> characterJson({
  String id = '3be0ae8e-2035-4f79-95d9-da152f746d2f',
  String name = 'Арагорн',
  int characterClass = 3,
  int characterRace = 1,
}) =>
    {
      'id': id,
      'name': name,
      'level': 3,
      'characterClass': characterClass,
      'characterRace': characterRace,
      'characterStats': {
        'strength': 15,
        'intelligence': 10,
        'wisdom': 12,
        'constitution': 13,
        'dexterity': 14,
        'charisma': 8,
      },
    };
