import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/api/races/enums/character_race_type.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';

class RaceWidget extends StatefulWidget {
  final Race race;
  const RaceWidget({
    super.key,
    required this.race,
  });

  @override
  State<RaceWidget> createState() => _RaceWidgetState();
}

class _RaceWidgetState extends State<RaceWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isExpanded = constraints.biggest.height > 100;

      return Container(
        height: constraints.maxHeight,
        alignment: Alignment.topCenter,
        child: isExpanded
            ? Animate(
                key: UniqueKey(),
                delay: DndDurations.fast,
                effects: const [
                  FadeEffect(
                    begin: 0,
                    end: 1,
                    duration: DndDurations.fast,
                  ),
                ],
                child: Stack(
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
                                        CharacterRaceType.findRaceAsset(
                                          widget.race,
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
                          Text(widget.race.description),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Язык: ${widget.race.language}'),
                              Text('Размеры: ${widget.race.size}'),
                              Text('Характеристики: ${widget.race.traits}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                key: ValueKey(widget.race.name),
                widget.race.name,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
      );
    });
  }
}
