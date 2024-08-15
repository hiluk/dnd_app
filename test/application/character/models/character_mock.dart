// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/application/character/models/attributes_model.dart';

class CharacterMock {
  final int characterClass;
  final int characterRace;
  final Attributes characterStats;
  final String id;
  final int level;
  final String name;

  CharacterMock({
    this.characterClass = 1,
    this.characterRace = 1,
    this.characterStats = const Attributes(),
    this.id = '',
    this.level = 0,
    this.name = '',
  });

  factory CharacterMock.fromJson(Map<String, dynamic> map) {
    return CharacterMock(
      characterClass: map['characterClass'] as int,
      characterRace: map['characterRace'] as int,
      characterStats: Attributes.fromJson(
        map['characterStats'] as Map<String, dynamic>,
      ),
      id: map['id'] as String,
      level: map['level'] as int,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'characterClass': characterClass,
      'characterRace': characterRace,
      'characterStats': characterStats.toJson(),
      'id': id,
      'level': level,
      'name': name,
    };
  }
}
