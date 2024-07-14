import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';

import 'stat_row.dart';

class StatsWidget extends StatelessWidget {
  final Attributes stats;
  const StatsWidget({
    required this.stats,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatRow(
            title: 'Ловкость',
            value: stats.dexterity,
          ),
          StatRow(
            title: 'Сила',
            value: stats.strength,
          ),
          StatRow(
            title: 'Интеллект',
            value: stats.intelligence,
          ),
          StatRow(
            title: 'Мудрость',
            value: stats.wisdom,
          ),
          StatRow(
            title: 'Харизма',
            value: stats.charisma,
          ),
        ],
      ),
    );
  }
}
