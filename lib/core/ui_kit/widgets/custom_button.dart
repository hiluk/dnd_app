import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/button_text_extension.dart';

class CustomButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final themeExtenstion =
        theme.extension<ButtonThemeExtension>() ?? ButtonThemeExtension.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.5,
        decoration: themeExtenstion.boxDecoration,
        child: Center(
          child: !isLoading
              ? Text(
                  title,
                  style: themeExtenstion.textStyle,
                )
              : CircularProgressIndicator(color: theme.primaryColor),
        ),
      ),
    );
  }
}
