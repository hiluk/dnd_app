import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'custom_button.dart';

class SlideButton extends StatelessWidget {
  final VoidCallback onTap;
  const SlideButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Animate(
        delay: const Duration(milliseconds: 500),
        effects: const [
          SlideEffect(
            begin: Offset(2, 0),
            end: Offset.zero,
            curve: Curves.easeOutCubic,
            duration: Duration(milliseconds: 700),
          ),
          FadeEffect(
            begin: 0,
            end: 1,
            duration: Duration(milliseconds: 700),
          ),
        ],
        child: const CustomButton(title: "Создать персонажа"),
      ),
    );
  }
}
