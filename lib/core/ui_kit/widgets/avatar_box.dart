import 'package:flutter/material.dart';

class CharacterAvatar extends StatelessWidget {
  final String? assetPath;
  const CharacterAvatar({
    this.assetPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            assetPath ?? 'assets/images/warrior.png',
          ),
        ),
      ),
    );
  }
}
