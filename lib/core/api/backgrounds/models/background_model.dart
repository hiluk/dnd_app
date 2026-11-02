import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_model.freezed.dart';
part 'background_model.g.dart';

/// Предыстория персонажа
@freezed
class Background with _$Background {
  const factory Background({
    /// Код предыстории на сервере
    required int type,
    required String name,
    required String description,

    /// Навыки, которые даёт предыстория
    @Default([]) List<Skill> skills,

    /// Сколько навыков игрок выбирает сам (своя предыстория)
    @Default(0) int skillChoices,
    @Default('') String tools,
    @Default('') String languages,
    @Default('') String equipment,
    @Default('') String feature,
  }) = _Background;

  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);
}
