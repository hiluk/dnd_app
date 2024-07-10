import 'package:freezed_annotation/freezed_annotation.dart';

part 'attributes_model.freezed.dart';
part 'attributes_model.g.dart';

@freezed
class Attributes with _$Attributes {
  factory Attributes({
    @Default(0) int strength,
    @Default(0) int dexterity,
    @Default(0) int agility,
    @Default(0) int constitution,
    @Default(0) int intelligence,
    @Default(0) int charisma,
  }) = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}
