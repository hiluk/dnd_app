// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/application/core/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'race_model.freezed.dart';
part 'race_model.g.dart';

@freezed
class Race with _$Race {
  factory Race({
    required String name,
    required String slug,
    required String desc,
    @JsonKey(name: 'asi_desc') required String asiDesc,
    required List<Asi> asi,
    required String age,
    required String alignment,
    required String size,
    @JsonKey(name: 'size_raw') required String sizeRaw,
    required Speed speed,
    @JsonKey(name: 'speed_desc') required String speedDesc,
    required String languages,
    required String vision,
    required String traits,
    required List<dynamic> subraces,
  }) = _Race;

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);
}
