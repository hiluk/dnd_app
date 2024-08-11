import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/color_scheme.dart';

class CharacterCardThemeExtension
    extends ThemeExtension<CharacterCardThemeExtension> {
  static final defaultThemeData = CharacterCardThemeExtension(
    bodyTextStyle: const TextStyle(
      color: DndColors.onPrimary,
      fontSize: 27,
    ),
    titleTextStyle: const TextStyle(
      color: DndColors.onPrimary,
      fontSize: 40,
    ),
    cardStyle: BoxDecoration(
      color: DndColors.primary,
      borderRadius: BorderRadius.circular(25),
    ),
  );
  static final light = CharacterCardThemeExtension(
    bodyTextStyle: const TextStyle(
      color: DndColors.onPrimary,
      fontSize: 27,
    ),
    titleTextStyle: const TextStyle(
      color: DndColors.onPrimary,
      fontSize: 40,
    ),
    cardStyle: BoxDecoration(
      color: DndColors.fourth,
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
      return defaultThemeData;
    }

    return CharacterCardThemeExtension(
      bodyTextStyle: TextStyle.lerp(bodyTextStyle, other.bodyTextStyle, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      cardStyle: BoxDecoration.lerp(cardStyle, other.cardStyle, t)!,
    );
  }
}
