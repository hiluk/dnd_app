import 'package:flutter/material.dart';

class StatsCreateRow extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onPlusClick;
  final VoidCallback onMinusClick;

  const StatsCreateRow({
    super.key,
    required this.title,
    required this.count,
    required this.onPlusClick,
    required this.onMinusClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(
            children: [
              IconButton(
                onPressed: onMinusClick,
                icon: const Icon(Icons.remove),
                color: Colors.white,
              ),
              Text(count.toString()),
              IconButton(
                onPressed: onPlusClick,
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
