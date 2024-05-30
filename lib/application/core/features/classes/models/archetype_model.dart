import 'package:freezed_annotation/freezed_annotation.dart';

part 'archetype_model.freezed.dart';
part 'archetype_model.g.dart';

@freezed
class Archetype with _$Archetype {
  factory Archetype({
    required String name,
    required String slug,
    required String desc,
  }) = _Archetype;

  factory Archetype.fromJson(Map<String, dynamic> json) =>
      _$ArchetypeFromJson(json);
}
