import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';

/// Ответы сервера в том виде, в каком их отдаёт dnd_api
const _abilityCodes = {
  'Сила': 1,
  'Ловкость': 2,
  'Телосложение': 3,
  'Интеллект': 4,
  'Мудрость': 5,
  'Харизма': 6,
};

/// Бонусы рас как на сервере; у полуэльфа есть бонус на выбор
List<Map<String, dynamic>> asiJson(String race) => switch (race) {
      'Полуэльф' => [
          {'stat': 'Харизма', 'value': 2, 'ability': 6, 'choices': 1},
          {
            'stat': 'Две другие на выбор',
            'value': 1,
            'ability': null,
            'choices': 2
          },
        ],
      'Дварф' => [
          {'stat': 'Телосложение', 'value': 2, 'ability': 3, 'choices': 1},
        ],
      _ => [
          for (final MapEntry(key: stat, value: code) in _abilityCodes.entries)
            {'stat': stat, 'value': 1, 'ability': code, 'choices': 1},
        ],
    };

Map<String, dynamic> raceJson(String name) => {
      'name': name,
      'description': '',
      'age': '',
      'size': 'Средний',
      'language': '',
      'vision': '',
      'traits': '',
      'asi': asiJson(name),
      'skills': name == 'Эльф' ? [12] : <int>[],
      'skillChoices': name == 'Полуэльф' ? 2 : 0,
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
      'hitDie': 10,
      'savingThrows': [1, 3],
      'skillChoices': name == 'Плут' ? 4 : 2,
      'skillOptions': name == 'Плут'
          ? [1, 4, 5, 7, 8, 9, 12, 13, 14, 16, 17]
          : [1, 2, 4, 6, 7, 8, 12, 18],
      'expertiseChoices': name == 'Плут' ? 2 : 0,
    };

final racesJson = [
  for (final name in [
    'Человек',
    'Полуэльф',
    'Дварф',
    'Эльф',
    'Полурослик',
    'Драконорождённый',
    'Гном',
    'Полуорк',
    'Тифлинг',
  ])
    raceJson(name),
];
final classesJson = [
  for (final name in [
    'Воин',
    'Варвар',
    'Следопыт',
    'Плут',
    'Бард',
    'Жрец',
    'Друид',
    'Монах',
    'Паладин',
    'Чародей',
    'Колдун',
    'Волшебник',
  ])
    classJson(name),
];

Map<String, dynamic> backgroundJson(int type, String name, List<int> skills,
        {int skillChoices = 0}) =>
    {
      'type': type,
      'name': name,
      'description': '',
      'skills': skills,
      'skillChoices': skillChoices,
      'tools': '',
      'languages': '',
      'equipment': '',
      'feature': '',
    };

final backgroundsJson = [
  backgroundJson(3, 'Преступник', [5, 17]),
  backgroundJson(12, 'Солдат', [4, 8]),
  backgroundJson(14, 'Своя предыстория', [], skillChoices: 2),
];

List<Background> get backgrounds =>
    backgroundsJson.map(Background.fromJson).toList();

List<Race> get races => racesJson.map(Race.fromJson).toList();
List<Class> get classes => classesJson.map(Class.fromJson).toList();

Map<String, int> statsJson(
        int str, int dex, int con, int int_, int wis, int cha) =>
    {
      'strength': str,
      'dexterity': dex,
      'constitution': con,
      'intelligence': int_,
      'wisdom': wis,
      'charisma': cha,
    };

/// Лист, как его считает сервер для дварфа-воина со стандартным набором
Map<String, dynamic> sheetJson() => {
      'stats': statsJson(15, 14, 15, 12, 10, 8),
      'modifiers': statsJson(2, 2, 2, 1, 0, -1),
      'hitPoints': 12,
      'armorClass': 12,
      'initiative': 2,
      'speed': 25,
      'proficiencyBonus': 2,
      'passivePerception': 10,
      'skills': [
        for (final (skill, ability) in [
          (4, 1),
          (8, 6),
          (12, 5),
          (18, 5),
          (17, 2),
          (1, 2),
        ])
          {
            'skill': skill,
            'ability': ability,
            'bonus': 2,
            'proficient': skill <= 12,
            'expertise': false,
          },
      ],
      'savingThrows': [
        for (final (ability, bonus, proficient) in [
          (1, 4, true),
          (2, 2, false),
          (3, 4, true),
          (4, 1, false),
          (5, 0, false),
          (6, -1, false),
        ])
          {'ability': ability, 'bonus': bonus, 'proficient': proficient},
      ],
    };

Map<String, dynamic> characterJson({
  String id = '3be0ae8e-2035-4f79-95d9-da152f746d2f',
  String name = 'Арагорн',
  int characterClass = 3,
  int characterRace = 1,
}) =>
    {
      'id': id,
      'name': name,
      'level': 1,
      'characterClass': characterClass,
      'characterRace': characterRace,
      'generationMethod': 1,
      'baseStats': statsJson(15, 14, 13, 12, 10, 8),
      'bonusChoices': <int>[],
      'background': 12,
      'classSkills': [12, 18],
      'sheet': sheetJson(),
    };
