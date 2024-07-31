import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';

class ClassElement extends StatelessWidget {
  final Class characterClass;
  final bool isExpanded;
  final Function(String) onSelect;
  const ClassElement({
    super.key,
    required this.characterClass,
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
      onTap: () => onSelect(characterClass.name),
      child: AnimatedContainer(
        duration: duration,
        color: Colors.transparent,
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
                            end: 0.5,
                            duration: Duration(milliseconds: 400),
                          ),
                        ],
                        child: Container(
                          height: 500,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                'assets/images/warrior.png',
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
                    characterClass.name,
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
                              child: SizedBox(
                                height: size.height * 0.5,
                                child: PageView(
                                  children: [
                                    Text(characterClass.description),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Экипировка: ${characterClass.equipment}'),
                                        const SizedBox(height: 10),
                                        Text(
                                            'HP на первом уровне: ${characterClass.hpAt1stLevel}'),
                                        const SizedBox(height: 10),
                                        Text(
                                            'HP при повышении уровня: ${characterClass.hpAtHigherLevels}'),
                                        const SizedBox(height: 10),
                                        Text(
                                            'Броня: ${characterClass.profArmor}'),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
