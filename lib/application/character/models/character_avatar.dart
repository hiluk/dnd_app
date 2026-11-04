import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_avatar.freezed.dart';
part 'character_avatar.g.dart';

/// Как показывать свою картинку. [jsonValue] совпадает с enum на сервере.
@JsonEnum(valueField: 'jsonValue')
enum AvatarMode {
  /// Внутри рамки карточки, с кадрированием
  frame(1),

  /// Фигура выходит за верх карточки; только при прозрачном фоне
  figure(2);

  final int jsonValue;
  const AvatarMode(this.jsonValue);
}

/// Своя картинка персонажа
@freezed
class CharacterAvatar with _$CharacterAvatar {
  const CharacterAvatar._();

  const factory CharacterAvatar({
    /// Адрес файла относительно API; меняется при каждой загрузке
    required String url,

    /// Фон по краям прозрачный: можно показать фигурой
    @Default(false) bool hasTransparency,
    @Default(AvatarMode.frame) AvatarMode mode,
    @Default(0) double offsetX,
    @Default(0) double offsetY,
    @Default(1) double scale,
  }) = _CharacterAvatar;

  factory CharacterAvatar.fromJson(Map<String, dynamic> json) =>
      _$CharacterAvatarFromJson(json);

  AvatarLayout get layout => AvatarLayout(
        mode: mode,
        offsetX: offsetX,
        offsetY: offsetY,
        scale: scale,
      );
}

/// Вид и кадр картинки, которые меняет пользователь
@freezed
class AvatarLayout with _$AvatarLayout {
  static const minScale = 1.0;
  static const maxScale = 4.0;

  const factory AvatarLayout({
    @Default(AvatarMode.frame) AvatarMode mode,
    @Default(0) double offsetX,
    @Default(0) double offsetY,
    @Default(1) double scale,
  }) = _AvatarLayout;

  factory AvatarLayout.fromJson(Map<String, dynamic> json) =>
      _$AvatarLayoutFromJson(json);
}
