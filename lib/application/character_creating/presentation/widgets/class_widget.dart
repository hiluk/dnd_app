import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/info_line.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';

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

      return isExpanded
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
                    child: DefaultTextStyle.merge(
                      style: DndTheme.readableText,
                      child: PageView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(characterClass.description),
                                const SizedBox(height: 12),
                                InfoLine('Кость хитов', characterClass.hitDice),
                                InfoLine(
                                  'Хиты на 1 уровне',
                                  characterClass.hpAt1stLevel,
                                ),
                                InfoLine(
                                  'Заклинательная характеристика',
                                  characterClass.spellCastingAbility,
                                ),
                                const Text(
                                  'Листайте вправо, чтобы узнать больше →',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InfoLine(
                                  'Спасброски',
                                  characterClass.profSavingThrows,
                                ),
                                InfoLine('Доспехи', characterClass.profArmor),
                                InfoLine('Оружие', characterClass.profWeapon),
                                InfoLine(
                                    'Инструменты', characterClass.profTool),
                                InfoLine('Навыки', characterClass.profSkills),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InfoLine(
                                  'Хиты на следующих уровнях',
                                  characterClass.hpAtHigherLevels,
                                ),
                                InfoLine(
                                  'Снаряжение',
                                  characterClass.equipment,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Text(
              key: ValueKey(characterClass.name),
              characterClass.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
              ),
            );
    });
  }
}
