import 'package:dnd_app/core/api/races/enums/character_race_type.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Раса передаётся по сети как номер [CharacterRaceType.jsonValue]
/// и сопоставляется со справочником по названию
class CharacterRaceTypeConverter implements JsonConverter<Race, int> {
  static const _types = CharacterRaceType.values;
  const CharacterRaceTypeConverter();

  @override
  Race fromJson(int json) {
    final raceType = _types.firstWhere(
      (e) => e.jsonValue == json,
      orElse: () => throw FormatException('Неизвестная раса: $json'),
    );

    return di
        .get<CatalogRepository>()
        .races
        .firstWhere((e) => e.name == raceType.name, orElse: () {
      throw StateError('Раса «${raceType.name}» не найдена в справочнике');
    });
  }

  @override
  int toJson(Race object) {
    return _types.firstWhere((e) => e.name == object.name).jsonValue;
  }
}
