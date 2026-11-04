import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';
import 'package:flutter/material.dart';

/// Плитка выбора: заголовок, пояснение и значение справа.
/// Выбранная плитка получает золотую рамку.
class ChoiceTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;

  /// Значок слева (вместо отметки выбора)
  final Widget? leading;
  final bool selected;
  final VoidCallback? onTap;

  /// Показывать круглую отметку выбора слева
  final bool showMark;

  /// Заголовок декоративным шрифтом
  final TextStyle? titleStyle;

  const ChoiceTile({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.selected = false,
    this.onTap,
    this.showMark = false,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final enabled = onTap != null || selected;

    return Semantics(
      selected: selected,
      button: true,
      enabled: enabled,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: DndDurations.fast,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: selected ? p.gold.withOpacity(0.12) : p.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? p.gold : p.line,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Opacity(
              opacity: enabled ? 1 : 0.5,
              child: Row(
                children: [
                  if (showMark) ...[
                    _Mark(selected: selected),
                    const SizedBox(width: 14),
                  ] else if (leading != null) ...[
                    leading!,
                    const SizedBox(width: 14),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: titleStyle ??
                              TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: p.ink,
                              ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 3),
                          Text(
                            subtitle!,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.35,
                              color: p.muted,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: 12),
                    trailing!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Mark extends StatelessWidget {
  final bool selected;

  const _Mark({required this.selected});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return AnimatedContainer(
      duration: DndDurations.fast,
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? p.gold : Colors.transparent,
        border: Border.all(color: selected ? p.gold : p.muted, width: 1.5),
      ),
      child: selected ? Icon(Icons.check, size: 15, color: p.field) : null,
    );
  }
}
