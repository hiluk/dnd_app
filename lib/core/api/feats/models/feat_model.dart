import 'package:freezed_annotation/freezed_annotation.dart';

part 'feat_model.freezed.dart';
part 'feat_model.g.dart';

@freezed
class Feat with _$Feat {
  factory Feat({
    required String slug,
    required String name,
    required String? desc,
    required String? prerequisite,
    @JsonKey(name: 'effects_desc') required List<String>? effectsDesc,
  }) = _Feat;

  factory Feat.fromJson(Map<String, dynamic> json) => _$FeatFromJson(json);
}
