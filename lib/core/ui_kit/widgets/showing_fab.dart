import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/button_text_extension.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/scale_listener.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class OpacityFAB extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isShow;
  const OpacityFAB({
    required this.title,
    required this.onTap,
    this.isShow = false,
    super.key,
  });

  @override
  State<OpacityFAB> createState() => _OpacityFABState();
}

class _OpacityFABState extends State<OpacityFAB> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: DndDurations.fast,
      opacity: widget.isShow ? 1 : 0,
      child: ScaleListener(
        child: FloatingActionButton.extended(
          onPressed: widget.onTap,
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
          label: Text(
            widget.title,
            style: Theme.of(context)
                    .extension<ButtonThemeExtension>()
                    ?.textStyle ??
                ButtonThemeExtension.dark.textStyle,
          ),
        ),
      ),
    );
  }
}
