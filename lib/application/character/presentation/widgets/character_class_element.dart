import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class ClassElement extends StatelessWidget {
  final Class characterClass;

  const ClassElement({
    super.key,
    required this.characterClass,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isExpanded = constraints.biggest.height > 100;

      return Animate(
        key: UniqueKey(),
        delay: DndDurations.fast,
        effects: const [
          FadeEffect(
            begin: 0,
            end: 1,
            duration: DndDurations.fast,
          ),
        ],
        child: isExpanded
            ? PageView(
                children: [
                  Text(characterClass.description),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Экипировка: ${characterClass.equipment}'),
                      Text(
                          'HP на первом уровне: ${characterClass.hpAt1stLevel}'),
                      Text(
                          'HP при повышении уровня: ${characterClass.hpAtHigherLevels}'),
                      Text('Броня: ${characterClass.profArmor}'),
                    ],
                  ),
                ],
              )
            : Text(
                characterClass.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
      );
    });
  }
}
