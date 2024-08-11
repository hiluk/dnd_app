import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/character_screen.dart';
import 'package:flutter_application_1/core/api/classes/enums/character_class_type.dart';
import 'package:flutter_application_1/core/ui_kit/color_scheme.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui_kit/widgets/avatar_box.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final bool inFocus;
  const CharacterCard({
    required this.character,
    required this.inFocus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final assetPath = CharacterClassType.getRandomAsset();

    return GestureDetector(
      onTap: () {
        context.pushNamed(CharacterScreen.routeName, extra: character.id);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: inFocus ? 1 : 0.8,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: constraints.maxHeight * 0.25),
                  child: AnimatedContainer(
                    duration: DndDurations.fast,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: inFocus
                          ? DndColors.primary
                          : DndColors.primary.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              inFocus
                  ? Stack(
                      children: [
                        Animate(
                          effects: const [
                            FadeEffect(
                              begin: 0,
                              end: 1,
                              duration: DndDurations.long,
                            ),
                          ],
                          child: Transform.translate(
                            offset: Offset(constraints.maxWidth * 0.15, 0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Opacity(
                                opacity: 1,
                                child: OverflowBox(
                                  maxHeight: constraints.maxHeight,
                                  maxWidth: constraints.maxWidth * 2,
                                  child: CharacterAvatar(
                                    assetPath: assetPath,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      color: DndColors.onPrimary,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        character.characterRace.name,
                        style: const TextStyle(
                          color: DndColors.onPrimary,
                          fontSize: 27,
                        ),
                      ),
                      Text(
                        character.characterClass.name,
                        style: const TextStyle(
                          color: DndColors.onPrimary,
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Уровень: ${character.level.toString()}',
                    style: const TextStyle(
                      color: DndColors.onPrimary,
                      fontSize: 27,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
