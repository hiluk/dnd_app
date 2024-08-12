import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/button_text_extension.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/character_card_theme_extension.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_colors.dart';
import 'package:flutter_application_1/core/utils/enums/mode_enums.dart';
import 'package:injectable/injectable.dart';

@injectable
class DndTheme {
  late DndColors colors;
  @factory
  ThemeData fromMode(ModeType mode) {
    if (mode == ModeType.dark) {
      colors = const DndColors.dark();
      return ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colors.primary,
        ),
        fontFamily: 'Vinque',
        extensions: [
          ButtonThemeExtension.dark,
          CharacterCardThemeExtension.dark,
        ],
        scaffoldBackgroundColor: colors.background,
        colorScheme: ColorScheme.dark(
          primary: colors.primary,
          onPrimary: colors.onPrimary,
        ),
      );
    }

    colors = const DndColors.light();
    return ThemeData(
      fontFamily: 'Vinque',
      extensions: [
        ButtonThemeExtension.light,
        CharacterCardThemeExtension.light,
      ],
      scaffoldBackgroundColor: colors.background,
      colorScheme: ColorScheme.light(
        primary: colors.primary,
        onPrimary: colors.onPrimary,
      ),
    );
  }
}
