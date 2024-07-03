import 'package:freezed_annotation/freezed_annotation.dart';

part 'asi_model.freezed.dart';
part 'asi_model.g.dart';

@freezed
class Asi with _$Asi {
  factory Asi({
    required String stat,
    required int value,
  }) = _Asi;

  factory Asi.fromJson(Map<String, dynamic> json) => _$AsiFromJson(json);
}
