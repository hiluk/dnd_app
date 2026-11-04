import 'package:dnd_app/application/character/presentation/widgets/character_card.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/material.dart';

/// Шапка листа: имя слева, фигура справа выходит над плашкой
class CharacterHero extends StatelessWidget {
  final String name;
  final String subtitle;
  final String? details;
  final CardArt art;
  final int? level;

  /// Открыть выбор своей картинки; null — кнопки нет
  final VoidCallback? onEditArt;

  const CharacterHero({
    super.key,
    required this.name,
    required this.subtitle,
    required this.art,
    this.details,
    this.level,
    this.onEditArt,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    const height = 236.0;
    const rise = 56.0;

    return SizedBox(
      height: height,
      child: LayoutBuilder(builder: (context, constraints) {
        final artWidth = constraints.maxWidth * 0.42;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              top: art.isFigure ? rise : 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: p.surface,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: p.line),
                ),
              ),
            ),
            if (art.isFigure)
              Positioned(
                right: 0,
                width: artWidth,
                top: 0,
                bottom: 1,
                child: ClipRect(
                  // Обрезаем только снизу: фигура стоит на нижнем крае
                  clipper: _BottomClipper(),
                  child: ArtImage(art),
                ),
              )
            else
              Positioned(
                right: 12,
                top: 12,
                bottom: 12,
                width: artWidth - 12,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: p.gold.withOpacity(0.6)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: ArtImage(art),
                  ),
                ),
              ),
            Positioned(
              left: 20,
              right: artWidth + 4,
              top: art.isFigure ? rise : 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: DndTheme.display(p.ink, size: 32),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 17, color: p.ink),
                  ),
                  if (details != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      details!,
                      style: TextStyle(fontSize: 14, color: p.muted),
                    ),
                  ],
                  if (level != null) ...[
                    const SizedBox(height: 12),
                    LevelSeal(level: level!, size: 44),
                  ],
                ],
              ),
            ),
            if (onEditArt != null)
              Positioned(
                right: 6,
                bottom: 6,
                child: Tooltip(
                  message: 'Изменить изображение',
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onEditArt,
                      customBorder: const CircleBorder(),
                      child: SizedBox.square(
                        dimension: 44,
                        child: Center(
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: p.raised,
                              shape: BoxShape.circle,
                              border: Border.all(color: p.control),
                            ),
                            child: Icon(Icons.edit_outlined, size: 17, color: p.ink),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}

class _BottomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(-size.width, -size.height, size.width * 2, size.height);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
