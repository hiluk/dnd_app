import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_request.freezed.dart';
part 'character_request.g.dart';

@freezed
class CharacterRequest with _$CharacterRequest {
  factory CharacterRequest({
    required String email,
    required Character character,
  }) = _CharacterDto;

  factory CharacterRequest.fromJson(Map<String, dynamic> json) =>
      _$CharacterRequestFromJson(json);
}
