import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';

class RaceElement extends StatelessWidget {
  final Race race;
  final bool isExpanded;
  final Function(String) onSelect;
  const RaceElement({
    super.key,
    required this.race,
    required this.isExpanded,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final notExpandedHeight = size.height * 0.07;
    final expandedHeight = size.height * 0.5;
    const duration = Duration(milliseconds: 400);

    return GestureDetector(
      onTap: () => onSelect(race.name),
      child: AnimatedContainer(
        duration: duration,
        height: isExpanded ? expandedHeight : notExpandedHeight,
        child: Padding(
          padding: EdgeInsets.only(top: notExpandedHeight * 0.25),
          child: Stack(
            children: [
              isExpanded
                  ? Transform.translate(
                      offset: Offset(size.width * 0.3, 0),
                      child: Animate(
                        delay: const Duration(milliseconds: 800),
                        effects: const [
                          FadeEffect(
                            begin: 0,
                            end: 1,
                            duration: Duration(milliseconds: 400),
                          ),
                        ],
                        child: Container(
                          height: 500,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/human.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Column(
                children: [
                  Text(
                    race.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  isExpanded
                      ? Flexible(
                          flex: 1,
                          child: Animate(
                            delay: duration,
                            effects: const [
                              FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: duration,
                              ),
                            ],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return SizedBox(
                                  height: constraints.maxHeight,
                                  child: PageView(
                                    children: [
                                      Text(race.description),
                                      Column(
                                        children: [
                                          Text('Язык: ${race.language}'),
                                          Text('Размеры: ${race.size}'),
                                          Text(
                                              'Характеристики: ${race.traits}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
