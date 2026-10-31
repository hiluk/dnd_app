import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asi_model.freezed.dart';
part 'asi_model.g.dart';

@freezed
class Asi with _$Asi {
  factory Asi({
    required String stat,
    required int value,

    /// Характеристика; null — бонус на выбор игрока
    Ability? ability,

    /// Сколько разных характеристик выбирается для бонуса на выбор
    @Default(1) int choices,
  }) = _Asi;

  factory Asi.fromJson(Map<String, dynamic> json) => _$AsiFromJson(json);
}
