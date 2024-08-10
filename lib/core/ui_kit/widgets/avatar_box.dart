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
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            assetPath ?? 'assets/images/human_plug.jpeg',
          ),
        ),
      ),
    );
  }
}
