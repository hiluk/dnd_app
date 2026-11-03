import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';
import 'package:flutter/material.dart';

/// Прогресс мастера: отрезок на каждый шаг, пройденные — золотые
class StepProgress extends StatelessWidget {
  final int current;
  final int total;

  const StepProgress({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Semantics(
      label: 'Шаг ${current + 1} из $total',
      excludeSemantics: true,
      child: Row(
        children: [
          for (var i = 0; i < total; i++) ...[
            if (i > 0) const SizedBox(width: 4),
            Expanded(
              child: AnimatedContainer(
                duration: DndDurations.regular,
                height: 3,
                decoration: BoxDecoration(
                  color: i <= current ? p.gold : p.line,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
