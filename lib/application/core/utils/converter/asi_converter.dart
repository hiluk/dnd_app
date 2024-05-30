import 'package:freezed_annotation/freezed_annotation.dart';

class AsiConverter extends JsonConverter<String, List<String>> {
  @override
  String fromJson(List<String> json) {
    return json[0];
  }

  @override
  toJson(object) {
    throw UnimplementedError();
  }
}
