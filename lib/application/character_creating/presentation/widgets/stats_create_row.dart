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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: onMinusClick,
                    icon: const Icon(
                      Icons.remove,
                      size: 35,
                    ),
                    color: Colors.white,
                  ),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: onPlusClick,
                    icon: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
