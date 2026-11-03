import 'package:flutter/material.dart';

/// Главная кнопка экрана: червлёная, во всю ширину
class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onTap;
  final IconData? icon;

  const CustomButton({
    required this.title,
    this.onTap,
    this.isLoading = false,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final enabled = onTap != null && !isLoading;

    return FilledButton(
      onPressed: enabled ? onTap : null,
      style: isLoading
          ? FilledButton.styleFrom(
              disabledBackgroundColor: colors.primary,
              disabledForegroundColor: colors.onPrimary,
            )
          : null,
      child: isLoading
          ? SizedBox.square(
              dimension: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: colors.onPrimary,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20),
                  const SizedBox(width: 10),
                ],
                Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
              ],
            ),
    );
  }
}
