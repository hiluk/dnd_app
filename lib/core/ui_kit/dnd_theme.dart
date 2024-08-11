import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/button_text_extension.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/character_card_theme_extension.dart';
import 'package:flutter_application_1/core/utils/enums/mode_enums.dart';
import 'package:injectable/injectable.dart';

@injectable
class DndTheme {
  @factory
  ThemeData fromMode(String modeName) {
    if (modeName == ModeType.dark.name) {
      return ThemeData(
        fontFamily: 'Vinque',
        extensions: [
          ButtonThemeExtension.defaultThemeData,
          CharacterCardThemeExtension.defaultThemeData,
        ],
        colorScheme: const ColorScheme.dark(),
      );
    }

    return ThemeData(
      fontFamily: 'Vinque',
      extensions: [
        ButtonThemeExtension.light,
        CharacterCardThemeExtension.light,
      ],
    );
  }
}
