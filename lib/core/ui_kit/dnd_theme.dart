import 'package:flutter/material.dart';
import 'package:dnd_app/core/ui_kit/theme_extensions/button_text_extension.dart';
import 'package:dnd_app/core/ui_kit/theme_extensions/character_card_theme_extension.dart';
import 'package:dnd_app/core/utils/constants/dnd_colors.dart';
import 'package:injectable/injectable.dart';

@injectable
class DndTheme {
  /// Декоративный шрифт заголовков. В нём нет части символов
  /// (например, «+» и кавычек-ёлочек), поэтому длинные тексты
  /// справочника выводятся [readableText].
  static const decorativeFont = 'Orpheus';

  /// Стиль для описаний: системный шрифт со всеми символами
  static const readableText = TextStyle(
    fontFamily: 'Roboto',
    fontFamilyFallback: ['sans-serif'],
    fontSize: 14,
  );

  late DndColors colors;
  ThemeData get dark {
    colors = const DndColors.dark();
    return ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
      ),
      fontFamily: decorativeFont,
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

  ThemeData get light {
    colors = const DndColors.light();
    return ThemeData(
      fontFamily: decorativeFont,
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
