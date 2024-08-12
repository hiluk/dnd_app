import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_colors.dart';

class ButtonThemeExtension extends ThemeExtension<ButtonThemeExtension> {
  static ButtonThemeExtension dark = ButtonThemeExtension(
    textStyle: TextStyle(
      fontSize: 17,
      color: const DndColors.dark().onPrimary,
    ),
    boxDecoration: BoxDecoration(
      color: const DndColors.dark().primary,
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static ButtonThemeExtension light = ButtonThemeExtension(
    textStyle: TextStyle(
      fontSize: 17,
      color: const DndColors.light().onPrimary,
    ),
    boxDecoration: BoxDecoration(
      color: const DndColors.light().primary,
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
