import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SlideButton extends StatelessWidget {
  final VoidCallback onTap;
  const SlideButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
        child: Container(
          height: size.height * 0.06,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'Создать персонажа',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
