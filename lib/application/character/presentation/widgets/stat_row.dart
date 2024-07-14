import 'package:flutter/material.dart';

class StatRow extends StatelessWidget {
  final String title;
  final int value;
  const StatRow({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
