import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/button_text_extension.dart';

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
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => setState(() {
        isTapped = true;
      }),
      onPointerUp: (event) => setState(() {
        isTapped = false;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Transform.scale(
          scale: isTapped ? 0.95 : 1,
          child: Container(
            height: size.height * 0.06,
            width: size.width * 0.5,
            decoration: themeExtension.boxDecoration,
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
