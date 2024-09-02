import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class ScaleListener extends StatefulWidget {
  final Widget child;
  const ScaleListener({
    super.key,
    required this.child,
  });

  @override
  State<ScaleListener> createState() => _ScaleListenerState();
}

class _ScaleListenerState extends State<ScaleListener> {
  bool needScale = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => setState(() {
        needScale = true;
      }),
      onPointerUp: (event) => setState(() {
        needScale = false;
      }),
      behavior: HitTestBehavior.translucent,
      child: AnimatedScale(
        curve: Curves.easeOut,
        scale: needScale ? 0.95 : 1,
        duration: DndDurations.fast,
        child: widget.child,
      ),
    );
  }
}
