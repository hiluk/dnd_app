import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_model.freezed.dart';
part 'background_model.g.dart';

@freezed
class Background with _$Background {
  factory Background({
    required String name,
    required String slug,
    required String desc,
    @JsonKey(name: 'skill_proficiencies') String? skillProficiencies,
    @JsonKey(name: 'tool_proficiencies') String? toolProficiencies,
    String? languages,
    required String equipment,
    required String feature,
    @JsonKey(name: 'feature_desc') required String featureDesc,
    @JsonKey(name: 'suggested_characteristics')
    required String suggestedCharacteristics,
  }) = _Background;

  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);
}
