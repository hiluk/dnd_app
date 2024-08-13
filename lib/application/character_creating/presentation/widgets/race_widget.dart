import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_assets.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class RaceWidget extends StatelessWidget {
  final Race race;
  const RaceWidget({
    super.key,
    required this.race,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isExpanded = constraints.biggest.height > 100;

      return Container(
        key: Key(race.name),
        height: constraints.maxHeight,
        alignment: Alignment.topCenter,
        child: Animate(
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
                                  width: constraints.maxWidth / 1.5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(
                                        DndAssets.findRaceAsset(race),
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
                          Text(race.description),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Язык: ${race.language}'),
                              Text('Размеры: ${race.size}'),
                              Text('Характеристики: ${race.traits}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Text(
                  race.name,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
        ),
      );
    });
  }
}
