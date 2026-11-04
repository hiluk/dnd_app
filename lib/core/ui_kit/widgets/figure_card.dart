import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';

/// Папка вырезанных фигур на прозрачном фоне
const figuresDir = 'assets/figures/';

/// Папка картинок со сценой (гравюр)
const platesDir = 'assets/images/';

/// Картинка для карточки: из ассетов или загруженная пользователем.
/// Фигура ([isFigure]) вырезана на прозрачном фоне и выходит за верх карточки.
/// Гравюра или фото лежит внутри рамки и кадрируется по [alignment] и [scale].
class CardArt {
  /// Путь к ассету; null — картинка из [bytes]
  final String? path;

  /// Загруженная картинка
  final Uint8List? bytes;

  final bool isFigure;

  /// Какую часть картинки показывать, если она не помещается в рамку
  final Alignment alignment;

  /// Увеличение кадра внутри рамки, от 1
  final double scale;

  /// Линейный рисунок (чёрные линии): тонируется в цвет текста,
  /// иначе пропадает на тёмной теме
  final bool isLineArt;

  const CardArt.figure(String this.path, {this.isLineArt = false})
      : bytes = null,
        isFigure = true,
        alignment = Alignment.bottomCenter,
        scale = 1;

  const CardArt.plate(String this.path, {this.alignment = Alignment.topCenter})
      : bytes = null,
        isFigure = false,
        isLineArt = false,
        scale = 1;

  /// Своя картинка персонажа
  const CardArt.memory(
    Uint8List this.bytes, {
    required this.isFigure,
    this.alignment = Alignment.center,
    this.scale = 1,
  })  : path = null,
        isLineArt = false;

  ImageProvider get provider {
    final asset = path;
    if (asset != null) return AssetImage(asset);
    return MemoryImage(bytes!);
  }
}

/// Изображение из [CardArt] с нужным вписыванием, кадром и тонированием
class ArtImage extends StatelessWidget {
  final CardArt art;
  final double opacity;

  const ArtImage(this.art, {super.key, this.opacity = 1});

  @override
  Widget build(BuildContext context) {
    Widget image = Image(
      image: art.provider,
      fit: art.isFigure ? BoxFit.contain : BoxFit.cover,
      alignment: art.isFigure ? Alignment.bottomCenter : art.alignment,
      excludeFromSemantics: true,
      gaplessPlayback: true,
      // Повреждённый файл не роняет экран: показываем значок вместо картинки
      errorBuilder: (context, _, __) => Center(
        child: Icon(
          Icons.broken_image_outlined,
          size: 40,
          color: DndPalette.of(context).muted,
        ),
      ),
    );

    if (!art.isFigure && art.scale > 1) {
      image = Transform.scale(
        scale: art.scale,
        alignment: art.alignment,
        child: image,
      );
    }

    if (art.isLineArt) {
      image = ColorFiltered(
        colorFilter: ColorFilter.mode(DndPalette.of(context).ink, BlendMode.srcIn),
        child: image,
      );
    }

    return AnimatedOpacity(
      duration: DndDurations.regular,
      opacity: opacity,
      child: image,
    );
  }
}

/// Карточка персонажа, расы или класса: фигура стоит за табличкой
/// с подписью и выходит за верхний край карточки.
class FigureCard extends StatelessWidget {
  final CardArt art;

  /// Содержимое таблички внизу карточки
  final Widget plaque;

  /// Высота таблички
  final double plaqueHeight;

  /// Насколько фигура выходит над карточкой, доля от высоты всего виджета
  final double rise;

  /// Карточка в центре внимания: фигура видна полностью
  final bool inFocus;

  /// Выбрана: золотая рамка и отметка
  final bool selected;

  final double radius;
  final VoidCallback? onTap;
  final String? semanticLabel;

  const FigureCard({
    super.key,
    required this.art,
    required this.plaque,
    this.plaqueHeight = 96,
    this.rise = 0.16,
    this.inFocus = true,
    this.selected = false,
    this.radius = 22,
    this.onTap,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Semantics(
      button: onTap != null,
      selected: selected,
      label: semanticLabel,
      excludeSemantics: semanticLabel != null,
      child: LayoutBuilder(builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        // Верх карточки одинаковый для всех: за него выходит только фигура
        final top = height * rise;
        final innerRadius = radius - 6;
        final frameColor =
            selected ? p.gold : p.gold.withOpacity(inFocus ? 0.45 : 0.2);
        final border = selected ? 2.0 : 1.0;

        return GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Сама карточка
              Positioned.fill(
                top: top,
                child: AnimatedContainer(
                  duration: DndDurations.fast,
                  decoration: BoxDecoration(
                    color: p.raised,
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(
                      color: selected ? p.gold : p.line,
                      width: border,
                    ),
                  ),
                ),
              ),
              if (!art.isFigure)
                // Гравюра со сценой — внутри карточки
                Positioned.fill(
                  left: border,
                  right: border,
                  top: top + border,
                  bottom: plaqueHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(radius - border),
                    ),
                    child: ArtImage(art, opacity: inFocus ? 1 : 0.55),
                  ),
                ),
              // Внутренняя рамка, как у игральной карты
              Positioned.fill(
                top: top + 7,
                left: 7,
                right: 7,
                bottom: plaqueHeight + 7,
                child: IgnorePointer(
                  child: AnimatedContainer(
                    duration: DndDurations.fast,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(innerRadius),
                      border: Border.all(
                        color: art.isFigure
                            ? frameColor
                            : (selected ? p.gold : p.gold.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ),
              ),
              if (art.isFigure)
                // Фигура стоит за табличкой и выходит за верх карточки
                Positioned(
                  left: -width * 0.08,
                  right: -width * 0.08,
                  top: 0,
                  bottom: plaqueHeight - 18,
                  child: AnimatedSlide(
                    duration: DndDurations.regular,
                    curve: Curves.easeOutCubic,
                    offset: Offset(0, inFocus ? 0 : 0.05),
                    child: ArtImage(art, opacity: inFocus ? 1 : 0.4),
                  ),
                ),
              // Табличка с подписью
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: plaqueHeight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(border, 0, border, border),
                  padding: const EdgeInsets.fromLTRB(18, 10, 14, 12),
                  decoration: BoxDecoration(
                    color: p.surface,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(radius - border),
                    ),
                    border: Border(top: BorderSide(color: frameColor)),
                  ),
                  child: plaque,
                ),
              ),
              if (selected)
                Positioned(
                  right: 13,
                  top: top + 13,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: p.gold,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, size: 16, color: p.field),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
