import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:json_annotation/json_annotation.dart';

/// Характеристика персонажа. [jsonValue] совпадает с enum на сервере.
@JsonEnum(valueField: 'jsonValue')
enum Ability {
  strength(1, 'Сила'),
  dexterity(2, 'Ловкость'),
  constitution(3, 'Телосложение'),
  intelligence(4, 'Интеллект'),
  wisdom(5, 'Мудрость'),
  charisma(6, 'Харизма');

  final int jsonValue;
  final String title;
  const Ability(this.jsonValue, this.title);

  /// Сокращение: «Сил», «Лов» и т.д.
  String get short => title.substring(0, 3);
}

/// Навык и его характеристика. [jsonValue] совпадает с enum на сервере.
@JsonEnum(valueField: 'jsonValue')
enum Skill {
  acrobatics(1, 'Акробатика', Ability.dexterity),
  animalHandling(2, 'Уход за животными', Ability.wisdom),
  arcana(3, 'Магия', Ability.intelligence),
  athletics(4, 'Атлетика', Ability.strength),
  deception(5, 'Обман', Ability.charisma),
  history(6, 'История', Ability.intelligence),
  insight(7, 'Проницательность', Ability.wisdom),
  intimidation(8, 'Запугивание', Ability.charisma),
  investigation(9, 'Анализ', Ability.intelligence),
  medicine(10, 'Медицина', Ability.wisdom),
  nature(11, 'Природа', Ability.intelligence),
  perception(12, 'Внимательность', Ability.wisdom),
  performance(13, 'Выступление', Ability.charisma),
  persuasion(14, 'Убеждение', Ability.charisma),
  religion(15, 'Религия', Ability.intelligence),
  sleightOfHand(16, 'Ловкость рук', Ability.dexterity),
  stealth(17, 'Скрытность', Ability.dexterity),
  survival(18, 'Выживание', Ability.wisdom);

  final int jsonValue;
  final String title;
  final Ability ability;
  const Skill(this.jsonValue, this.title, this.ability);

  /// Все навыки по алфавиту русских названий
  static List<Skill> get sorted =>
      [...values]..sort((a, b) => a.title.compareTo(b.title));
}

/// Способ генерации характеристик. [jsonValue] совпадает с enum на сервере.
@JsonEnum(valueField: 'jsonValue')
enum GenerationMethod {
  standardArray(1, 'Стандартный набор',
      '15, 14, 13, 12, 10 и 8 — распределите по характеристикам'),
  pointBuy(2, 'Покупка очков', '27 очков на значения от 8 до 15'),
  roll(3, 'Броски', '4к6 без наименьшего для каждой характеристики');

  final int jsonValue;
  final String title;
  final String description;
  const GenerationMethod(this.jsonValue, this.title, this.description);
}

extension AttributesByAbility on Attributes {
  int valueOf(Ability ability) => switch (ability) {
        Ability.strength => strength,
        Ability.dexterity => dexterity,
        Ability.constitution => constitution,
        Ability.intelligence => intelligence,
        Ability.wisdom => wisdom,
        Ability.charisma => charisma,
      };

  Attributes withValue(Ability ability, int value) => switch (ability) {
        Ability.strength => copyWith(strength: value),
        Ability.dexterity => copyWith(dexterity: value),
        Ability.constitution => copyWith(constitution: value),
        Ability.intelligence => copyWith(intelligence: value),
        Ability.wisdom => copyWith(wisdom: value),
        Ability.charisma => copyWith(charisma: value),
      };

  static Attributes fromMap(Map<Ability, int> values) => Ability.values.fold(
        const Attributes(),
        (attributes, ability) =>
            attributes.withValue(ability, values[ability] ?? 0),
      );
}

/// Модификатор в виде «+2» / «−1»
String formatBonus(int value) => value >= 0 ? '+$value' : '−${-value}';
