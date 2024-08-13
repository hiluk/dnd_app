import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_colors.dart';

class CharacterCardThemeExtension
    extends ThemeExtension<CharacterCardThemeExtension> {
  static final dark = CharacterCardThemeExtension(
    bodyTextStyle: TextStyle(
      color: const DndColors.dark().onPrimary,
      fontSize: 27,
    ),
    titleTextStyle: TextStyle(
      color: const DndColors.dark().onPrimary,
      fontSize: 40,
    ),
    cardStyle: BoxDecoration(
      color: const DndColors.dark().primary,
      borderRadius: BorderRadius.circular(25),
    ),
  );

  static final light = CharacterCardThemeExtension(
    bodyTextStyle: TextStyle(
      color: const DndColors.light().onPrimary,
      fontSize: 27,
    ),
    titleTextStyle: TextStyle(
      color: const DndColors.light().onPrimary,
      fontSize: 40,
    ),
    cardStyle: BoxDecoration(
      color: const DndColors.light().primary,
      borderRadius: BorderRadius.circular(25),
    ),
  );

  final TextStyle titleTextStyle;
  final TextStyle bodyTextStyle;
  final BoxDecoration cardStyle;

  const CharacterCardThemeExtension({
    required this.bodyTextStyle,
    required this.titleTextStyle,
    required this.cardStyle,
  });

  @override
  ThemeExtension<CharacterCardThemeExtension> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<CharacterCardThemeExtension> lerp(
      covariant ThemeExtension<CharacterCardThemeExtension>? other, double t) {
    if (other is! CharacterCardThemeExtension) {
      return dark;
    }

    return CharacterCardThemeExtension(
      bodyTextStyle: TextStyle.lerp(bodyTextStyle, other.bodyTextStyle, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      cardStyle: BoxDecoration.lerp(cardStyle, other.cardStyle, t)!,
    );
  }
}
