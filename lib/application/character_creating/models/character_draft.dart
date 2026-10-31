import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/api/classes/converters/class_converter.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/converters/race_converter.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_draft.freezed.dart';
part 'character_draft.g.dart';

/// Черновик персонажа для превью и создания
@freezed
class CharacterDraft with _$CharacterDraft {
  const factory CharacterDraft({
    @Default('') String name,
    @CharacterRaceTypeConverter() required Race characterRace,
    @CharacterClassTypeConverter() required Class characterClass,
    required GenerationMethod generationMethod,

    /// Базовые характеристики (до бонусов расы)
    required Attributes baseStats,
    @Default([]) List<Ability> bonusChoices,

    /// Подпись результата бросков с сервера
    @JsonKey(includeIfNull: false) String? rollToken,
  }) = _CharacterDraft;

  factory CharacterDraft.fromJson(Map<String, dynamic> json) =>
      _$CharacterDraftFromJson(json);
}
