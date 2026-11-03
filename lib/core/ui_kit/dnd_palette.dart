import 'package:flutter/material.dart';

/// Цвета приложения «Уголь и кровь»: поле — уголь (или светлый камень),
/// червлень — единственное главное действие на экране,
/// золото — выбранное и владение (рамки, отметки).
@immutable
class DndPalette extends ThemeExtension<DndPalette> {
  /// Фон экрана
  final Color field;

  /// Поверхность карточек
  final Color surface;

  /// Приподнятая поверхность: подложка фигур, плашки внутри карточек
  final Color raised;

  /// Тонкие линии и рамки
  final Color line;

  /// Рамка контролов, которые видны только по рамке (контраст 3:1)
  final Color control;

  /// Основной текст
  final Color ink;

  /// Второстепенный текст
  final Color muted;

  /// Червлень: главное действие
  final Color gules;
  final Color onGules;

  /// Золото: выбранное, владение, рамки
  final Color gold;

  const DndPalette({
    required this.field,
    required this.surface,
    required this.raised,
    required this.line,
    required this.control,
    required this.ink,
    required this.muted,
    required this.gules,
    required this.onGules,
    required this.gold,
  });

  static const dark = DndPalette(
    field: Color(0xFF0F0F10),
    surface: Color(0xFF1A1A1C),
    raised: Color(0xFF242427),
    line: Color(0xFF3A3A40),
    control: Color(0xFF66666E),
    ink: Color(0xFFEEEAE3),
    muted: Color(0xFFA9A6A0),
    gules: Color(0xFFD32430),
    onGules: Color(0xFFFFFFFF),
    gold: Color(0xFFC9A35A),
  );

  static const light = DndPalette(
    field: Color(0xFFECEBE8),
    surface: Color(0xFFFFFFFF),
    raised: Color(0xFFF3F2EF),
    line: Color(0xFFD0CEC8),
    control: Color(0xFF8C8982),
    ink: Color(0xFF1A1A1C),
    muted: Color(0xFF5F5D58),
    gules: Color(0xFFB3202A),
    onGules: Color(0xFFFFFFFF),
    gold: Color(0xFF7D6124),
  );

  static DndPalette of(BuildContext context) =>
      Theme.of(context).extension<DndPalette>() ?? dark;

  @override
  DndPalette copyWith({
    Color? field,
    Color? surface,
    Color? raised,
    Color? line,
    Color? control,
    Color? ink,
    Color? muted,
    Color? gules,
    Color? onGules,
    Color? gold,
  }) =>
      DndPalette(
        field: field ?? this.field,
        surface: surface ?? this.surface,
        raised: raised ?? this.raised,
        line: line ?? this.line,
        control: control ?? this.control,
        ink: ink ?? this.ink,
        muted: muted ?? this.muted,
        gules: gules ?? this.gules,
        onGules: onGules ?? this.onGules,
        gold: gold ?? this.gold,
      );

  @override
  DndPalette lerp(covariant ThemeExtension<DndPalette>? other, double t) {
    if (other is! DndPalette) return this;
    return DndPalette(
      field: Color.lerp(field, other.field, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      raised: Color.lerp(raised, other.raised, t)!,
      line: Color.lerp(line, other.line, t)!,
      control: Color.lerp(control, other.control, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      gules: Color.lerp(gules, other.gules, t)!,
      onGules: Color.lerp(onGules, other.onGules, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
    );
  }
}
