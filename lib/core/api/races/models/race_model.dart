// ignore_for_file: invalid_annotation_target

import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/api/races/models/asi_model.dart';
import 'package:dnd_app/core/api/races/models/speed_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'race_model.freezed.dart';
part 'race_model.g.dart';

@freezed
class Race with _$Race {
  factory Race({
    required String name,
    required String description,
    required List<Asi> asi,
    required String age,
    required String size,
    required List<Speed> speed,
    required String language,
    required String vision,
    required String traits,

    /// Навыки, которыми раса владеет всегда
    @Default([]) List<Skill> skills,

    /// Сколько любых навыков раса даёт выбрать
    @Default(0) int skillChoices,
  }) = _Race;

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);

  factory Race.mock(String raceName) {
    return Race(
      name: raceName,
      description: '',
      asi: [Asi(stat: '', value: 0)],
      age: '',
      size: '',
      speed: [Speed(type: '', value: 0)],
      language: '',
      vision: '',
      traits: '',
    );
  }
}
