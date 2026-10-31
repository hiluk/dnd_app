import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_roll.freezed.dart';
part 'ability_roll.g.dart';

/// Результат бросков 4к6 с сервера и подпись, подтверждающая его
@freezed
class AbilityRoll with _$AbilityRoll {
  const factory AbilityRoll({
    required List<int> values,
    required String token,
  }) = _AbilityRoll;

  factory AbilityRoll.fromJson(Map<String, dynamic> json) =>
      _$AbilityRollFromJson(json);
}
