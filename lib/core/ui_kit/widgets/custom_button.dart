import 'package:flutter/material.dart';
import 'package:dnd_app/core/ui_kit/theme_extensions/button_text_extension.dart';
import 'package:dnd_app/core/ui_kit/widgets/scale_listener.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onTap;
  const CustomButton({
    required this.title,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Size size;
  late ThemeData theme;
  late ButtonThemeExtension themeExtension;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onTap != null && !widget.isLoading;

    return ScaleListener(
      child: GestureDetector(
        onTap: isEnabled ? widget.onTap : null,
        child: Material(
          elevation: 8,
          borderRadius: themeExtension.boxDecoration.borderRadius,
          child: Container(
            height: size.height * 0.065,
            width: size.width * 0.5,
            decoration: themeExtension.boxDecoration,
            foregroundDecoration: widget.onTap == null
                ? BoxDecoration(
                    color: Colors.black26,
                    borderRadius: themeExtension.boxDecoration.borderRadius,
                  )
                : null,
            child: Center(
              child: !widget.isLoading
                  ? Text(
                      widget.title,
                      style: themeExtension.textStyle,
                    )
                  : CircularProgressIndicator(
                      color: themeExtension.textStyle.color,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.sizeOf(context);
    theme = Theme.of(context);
    themeExtension =
        theme.extension<ButtonThemeExtension>() ?? ButtonThemeExtension.dark;
  }
}
