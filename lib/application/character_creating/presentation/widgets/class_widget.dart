import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/api/classes/enums/character_class_type.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class ClassWidget extends StatelessWidget {
  final Class characterClass;

  const ClassWidget({
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
            ? Stack(
                children: [
                  isExpanded
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: UnconstrainedBox(
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                height: constraints.maxHeight,
                                width: constraints.maxHeight / 1.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(
                                      CharacterClassType.getAssetByName(
                                        characterClass.name,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView(
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
                    ),
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
