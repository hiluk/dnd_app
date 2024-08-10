import 'package:flutter/material.dart';

class CharacterAvatar extends StatelessWidget {
  final double height;
  final String? assetPath;
  const CharacterAvatar({
    required this.height,
    this.assetPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxHeight: height,
      maxWidth: height * 2,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              assetPath ?? 'assets/images/warrior.png',
            ),
          ),
        ),
      ),
    );
  }
}
