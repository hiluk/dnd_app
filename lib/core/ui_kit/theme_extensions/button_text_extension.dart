import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/color_scheme.dart';

class ButtonThemeExtension extends ThemeExtension<ButtonThemeExtension> {
  static ButtonThemeExtension defaultThemeData = ButtonThemeExtension(
    textStyle: const TextStyle(
      fontSize: 17,
      color: DndColors.onPrimary,
    ),
    boxDecoration: BoxDecoration(
      color: DndColors.primary,
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static ButtonThemeExtension light = ButtonThemeExtension(
    textStyle: const TextStyle(
      fontSize: 17,
      color: DndColors.onPrimary,
    ),
    boxDecoration: BoxDecoration(
      color: DndColors.onFourth,
      borderRadius: BorderRadius.circular(15),
    ),
  );

  final TextStyle textStyle;
  final BoxDecoration boxDecoration;

  const ButtonThemeExtension({
    required this.textStyle,
    required this.boxDecoration,
  });

  @override
  ThemeExtension<ButtonThemeExtension> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ButtonThemeExtension> lerp(
    covariant ThemeExtension<ButtonThemeExtension>? other,
    double t,
  ) {
    if (other is! ButtonThemeExtension) {
      return this;
    }

    return ButtonThemeExtension(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      boxDecoration: BoxDecoration.lerp(boxDecoration, other.boxDecoration, t)!,
    );
  }
}
