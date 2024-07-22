import 'package:freezed_annotation/freezed_annotation.dart';

part 'speed_model.freezed.dart';
part 'speed_model.g.dart';

@freezed
class Speed with _$Speed {
  factory Speed({
    required String type,
    required int value,
  }) = _Speed;

  factory Speed.fromJson(Map<String, dynamic> json) => _$SpeedFromJson(json);
}
