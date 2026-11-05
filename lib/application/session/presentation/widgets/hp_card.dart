import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';
import 'package:flutter/material.dart';

/// Хиты крупно и полоса: червлень — хиты, золото — временные.
/// Нажатие на число — ручная правка.
class HpCard extends StatelessWidget {
  final SessionState state;
  final int maxHp;
  final VoidCallback onEdit;

  const HpCard({
    super.key,
    required this.state,
    required this.maxHp,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final total = maxHp + state.tempHp;
    final status = state.isDead
        ? 'Погиб'
        : state.currentHp == 0
            ? (state.isStable ? 'Стабилен' : 'Без сознания')
            : null;

    return Semantics(
      label: 'Хиты ${state.currentHp} из $maxHp'
          '${state.tempHp > 0 ? ', временных ${state.tempHp}' : ''}'
          '${status != null ? ', $status' : ''}',
      button: true,
      hint: 'Изменить хиты вручную',
      excludeSemantics: true,
      child: Material(
        color: p.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: state.isDead ? p.gules : p.line),
        ),
        child: InkWell(
          onTap: onEdit,
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Хиты',
                          style: TextStyle(fontSize: 15, color: p.muted)),
                    ),
                    if (status != null)
                      _Pill(status,
                          color: p.gules, text: const Color(0xFFF07B82)),
                    if (state.tempHp > 0) ...[
                      const SizedBox(width: 6),
                      _Pill('+${state.tempHp} временных',
                          color: p.gold, text: p.gold),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${state.currentHp}',
                      style:
                          DndTheme.display(p.ink, size: 66).copyWith(height: 1),
                    ),
                    const SizedBox(width: 8),
                    Text('из $maxHp',
                        style: TextStyle(fontSize: 22, color: p.muted)),
                    const Spacer(),
                    Icon(Icons.edit_outlined, size: 18, color: p.muted),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    height: 10,
                    child: LayoutBuilder(builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      return Stack(
                        children: [
                          Container(color: p.raised),
                          AnimatedPositioned(
                            duration: DndDurations.regular,
                            curve: Curves.easeOutCubic,
                            left: 0,
                            top: 0,
                            bottom: 0,
                            width: width * state.currentHp / total,
                            child: Container(color: p.gules),
                          ),
                          AnimatedPositioned(
                            duration: DndDurations.regular,
                            curve: Curves.easeOutCubic,
                            left: width * state.currentHp / total,
                            top: 0,
                            bottom: 0,
                            width: width * state.tempHp / total,
                            child: Container(color: p.gold),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color color;
  final Color text;

  const _Pill(this.label, {required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: text),
      ),
    );
  }
}
