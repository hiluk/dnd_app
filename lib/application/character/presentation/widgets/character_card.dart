import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/character_screen.dart';
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
    return GestureDetector(
      onTap: () {
        context.pushNamed(CharacterScreen.routeName, extra: character.id);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: inFocus ? 1 : 0.8,
        child: LayoutBuilder(builder: (context, constraints) {
          final avatarHeight = constraints.maxHeight * 0.25;

          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: UnconstrainedBox(
                  child: AnimatedContainer(
                    duration: DndDurations.fast,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight - avatarHeight * 0.5,
                    decoration: BoxDecoration(
                      color: inFocus
                          ? DndColors.card
                          : DndColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: avatarHeight * 0.5),
                      child: Column(
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
                    ),
                  ),
                ),
              ),
              inFocus
                  ? Animate(
                      effects: const [
                        FadeEffect(
                          begin: 0,
                          end: 1,
                          duration: DndDurations.long,
                        ),
                      ],
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CharacterAvatar(
                          height: avatarHeight,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        }),
      ),
    );
  }
}
