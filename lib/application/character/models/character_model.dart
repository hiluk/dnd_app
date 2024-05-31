import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/api/feats/models/feat_model.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/api/weapons/models/weapon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class Character with _$Character {
  factory Character({
    required Race race,
    required Class charClass,
    required Attributes attributes,
    @Default([]) List<Feat> feats,
    required Weapon weapon,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
