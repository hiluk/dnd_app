import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class ExpandableElement extends StatefulWidget {
  final Widget child;
  final Function(bool) onToggle;

  const ExpandableElement({
    super.key,
    required this.child,
    required this.onToggle,
  });

  @override
  State<ExpandableElement> createState() => _ExpandableElementState();
}

class _ExpandableElementState extends State<ExpandableElement> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final notExpandedHeight = size.height * 0.07;
    final expandedHeight = size.height * 0.5;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onToggle(),
      child: AnimatedContainer(
        duration: DndDurations.regular,
        height: isExpanded ? expandedHeight : notExpandedHeight,
        child: Padding(
          padding: EdgeInsets.only(top: notExpandedHeight * 0.25),
          child: widget.child,
        ),
      ),
    );
  }

  void onToggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
    widget.onToggle(isExpanded);
  }
}
