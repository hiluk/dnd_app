import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

import 'custom_button.dart';

class SlideButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SlideButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Animate(
        delay: DndDurations.fast,
        effects: const [
          SlideEffect(
            begin: Offset(2, 0),
            end: Offset.zero,
            curve: Curves.easeOutCubic,
            duration: DndDurations.long,
          ),
          FadeEffect(
            begin: 0,
            end: 1,
            duration: DndDurations.long,
          ),
        ],
        child: CustomButton(title: title),
      ),
    );
  }
}
