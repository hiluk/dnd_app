import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DndTheme {
  /// Шрифт заголовков: имена, заголовки экранов и разделов.
  /// Alegreya SC (капитель) из той же семьи, что и текстовый [textFont].
  static const decorativeFont = 'AlegreyaSC';

  /// Шрифт текста и чисел
  static const textFont = 'AlegreyaSans';

  /// Табличные цифры одной высоты: значения в листе не «прыгают»
  static const numbers = [
    FontFeature.tabularFigures(),
    FontFeature.liningFigures(),
  ];

  /// Обычный текст. Оставлен для мест, где стиль задаётся вручную.
  static const readableText = TextStyle(fontFamily: textFont, fontSize: 16);

  /// Заголовок экрана или крупное имя
  static TextStyle display(Color color, {double size = 32}) => TextStyle(
        fontFamily: decorativeFont,
        fontSize: size,
        fontWeight: FontWeight.w500,
        height: 1.1,
        color: color,
      );

  ThemeData get dark => _build(DndPalette.dark, Brightness.dark);
  ThemeData get light => _build(DndPalette.light, Brightness.light);

  ThemeData _build(DndPalette p, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: p.gules,
      onPrimary: p.onGules,
      secondary: p.gold,
      onSecondary: p.field,
      error: p.gules,
      onError: p.onGules,
      surface: p.surface,
      onSurface: p.ink,
      onSurfaceVariant: p.muted,
      surfaceContainerHighest: p.raised,
      outline: p.line,
      outlineVariant: p.line,
    );

    final text = TextTheme(
      displaySmall: display(p.ink, size: 36),
      headlineMedium: display(p.ink, size: 30),
      headlineSmall: display(p.ink, size: 26),
      titleLarge: display(p.ink, size: 22),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: p.ink,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: p.ink,
      ),
      bodyLarge: TextStyle(fontSize: 17, height: 1.4, color: p.ink),
      bodyMedium: TextStyle(fontSize: 16, height: 1.4, color: p.ink),
      bodySmall: TextStyle(fontSize: 14, height: 1.35, color: p.muted),
      labelLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: p.ink,
      ),
      labelMedium: TextStyle(fontSize: 14, color: p.muted),
      labelSmall: TextStyle(fontSize: 13, color: p.muted),
    ).apply(fontFamily: textFont);

    // apply перезаписывает семейство у всех стилей — возвращаем декоративное
    final textTheme = text.copyWith(
      displaySmall: display(p.ink, size: 36),
      headlineMedium: display(p.ink, size: 30),
      headlineSmall: display(p.ink, size: 26),
      titleLarge: display(p.ink, size: 22),
    );

    final controlShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      fontFamily: textFont,
      textTheme: textTheme,
      scaffoldBackgroundColor: p.field,
      canvasColor: p.field,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      extensions: [p],
      appBarTheme: AppBarTheme(
        backgroundColor: p.field,
        surfaceTintColor: Colors.transparent,
        foregroundColor: p.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: display(p.ink, size: 24),
      ),
      iconTheme: IconThemeData(color: p.ink),
      dividerTheme: DividerThemeData(color: p.line, thickness: 1, space: 1),
      cardTheme: CardTheme(
        color: p.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: p.line),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: p.muted,
        textColor: p.ink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: p.surface,
        selectedColor: p.gold.withOpacity(0.18),
        disabledColor: p.raised,
        // Выбранный чип — с золотой рамкой, как выбранная карточка
        side: WidgetStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: states.contains(WidgetState.selected) ? p.gold : p.line,
          ),
        ),
        labelStyle: TextStyle(fontFamily: textFont, fontSize: 15, color: p.ink),
        secondaryLabelStyle:
            TextStyle(fontFamily: textFont, fontSize: 15, color: p.ink),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        shape: const StadiumBorder(),
        showCheckmark: false,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: p.gules,
          foregroundColor: p.onGules,
          disabledBackgroundColor: p.raised,
          disabledForegroundColor: p.muted,
          minimumSize: const Size.fromHeight(54),
          shape: controlShape,
          textStyle: const TextStyle(
            fontFamily: textFont,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: p.ink,
          side: BorderSide(color: p.control),
          minimumSize: const Size(0, 48),
          shape: controlShape,
          textStyle: const TextStyle(fontFamily: textFont, fontSize: 16),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: p.ink,
          textStyle: const TextStyle(
            fontFamily: textFont,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: p.ink),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surface,
        hintStyle: TextStyle(color: p.muted),
        labelStyle: TextStyle(color: p.muted),
        floatingLabelStyle: TextStyle(color: p.gold),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: p.gold, width: 1.5),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: p.gold,
        selectionColor: p.gold.withOpacity(0.3),
        selectionHandleColor: p.gold,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: p.gold,
        linearTrackColor: p.line,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: p.ink,
        contentTextStyle: TextStyle(
          fontFamily: textFont,
          fontSize: 16,
          color: p.field,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: p.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titleTextStyle: display(p.ink, size: 24),
        contentTextStyle:
            TextStyle(fontFamily: textFont, fontSize: 16, color: p.ink),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: p.surface,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: p.surface,
        showDragHandle: true,
        dragHandleColor: p.line,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(fontFamily: textFont, fontSize: 16, color: p.ink),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: p.surface,
        surfaceTintColor: Colors.transparent,
        textStyle: TextStyle(fontFamily: textFont, fontSize: 16, color: p.ink),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: p.ink,
        unselectedLabelColor: p.muted,
        indicatorColor: p.gold,
        dividerColor: p.line,
        overlayColor: WidgetStatePropertyAll(p.gold.withOpacity(0.08)),
        labelStyle: const TextStyle(
          fontFamily: textFont,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(fontFamily: textFont, fontSize: 16),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          foregroundColor: p.muted,
          selectedBackgroundColor: p.gold.withOpacity(0.18),
          selectedForegroundColor: p.ink,
          disabledForegroundColor: p.line,
          side: BorderSide(color: p.line),
          minimumSize: const Size(0, 48),
          textStyle: const TextStyle(
            fontFamily: textFont,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
