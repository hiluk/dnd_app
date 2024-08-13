import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class ExpandableWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onToggle;
  final bool isExpanded;

  const ExpandableWidget({
    super.key,
    required this.child,
    required this.onToggle,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final notExpandedHeight = size.height * 0.07;
    final expandedHeight = size.height * 0.5;

    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: AnimatedContainer(
            duration: DndDurations.regular,
            height: isExpanded ? expandedHeight : notExpandedHeight,
            child: Padding(
              padding: EdgeInsets.only(top: notExpandedHeight * 0.25),
              child: child,
            ),
          ),
        ),
        Divider(
          height: 0,
          color: Colors.grey.withOpacity(0.7),
        ),
      ],
    );
  }
}
