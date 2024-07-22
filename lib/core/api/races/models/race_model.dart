// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/api/races/models/asi_model.dart';
import 'package:flutter_application_1/core/api/races/models/speed_model.dart';
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
  }) = _Race;

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);
}
