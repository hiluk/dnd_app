import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/color_scheme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? callBack;
  const CustomButton({
    required this.title,
    this.callBack,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: DndColors.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: !isLoading
              ? Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                )
              : const CircularProgressIndicator(color: Colors.black),
        ),
      ),
    );
  }
}
