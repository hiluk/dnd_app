import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? callBack;
  const CustomButton({
    required this.title,
    this.callBack,
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
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
