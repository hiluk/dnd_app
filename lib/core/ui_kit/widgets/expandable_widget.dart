import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class ExpandableWidget extends StatefulWidget {
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
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.sizeOf(context);
    final notExpandedHeight = size.height * 0.07;
    final expandedHeight = size.height * 0.5;

    return Column(
      children: [
        GestureDetector(
          onTap: widget.onToggle,
          child: AnimatedContainer(
            duration: DndDurations.regular,
            height: widget.isExpanded ? expandedHeight : notExpandedHeight,
            child: Padding(
              padding: EdgeInsets.only(top: notExpandedHeight * 0.25),
              child: widget.child,
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
