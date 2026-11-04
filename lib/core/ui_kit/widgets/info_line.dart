import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:flutter/material.dart';

/// Факт из справочника: подпись над значением
class InfoLine extends StatelessWidget {
  final String label;
  final String value;

  const InfoLine(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    if (value.trim().isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: p.muted)),
          const SizedBox(height: 2),
          Text(value, style: TextStyle(fontSize: 16, color: p.ink, height: 1.4)),
        ],
      ),
    );
  }
}
