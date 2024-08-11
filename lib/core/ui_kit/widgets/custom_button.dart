import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/color_scheme.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/button_text_extension.dart';
import 'package:flutter_application_1/core/utils/extensions/context_extension.dart';

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
    final theme = context.getTheme<ButtonThemeExtension>() ??
        ButtonThemeExtension.defaultThemeData;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.5,
        decoration: theme.boxDecoration,
        child: Center(
          child: !isLoading
              ? Text(
                  title,
                  style: theme.textStyle,
                )
              : const CircularProgressIndicator(color: DndColors.onPrimary),
        ),
      ),
    );
  }
}
