import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/character_screen.dart';
import 'package:flutter_application_1/core/api/classes/enums/character_class_type.dart';
import 'package:flutter_application_1/core/ui_kit/theme_extensions/character_card_theme_extension.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_durations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui_kit/widgets/avatar_box.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  final bool inFocus;
  const CharacterCard({
    required this.character,
    required this.inFocus,
    super.key,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  late String assetPath;
  late ThemeData theme;
  late CharacterCardThemeExtension themeExtension;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => setState(() {
        isTapped = true;
      }),
      onPointerUp: (_) => setState(() {
        isTapped = false;
      }),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            CharacterScreen.routeName,
            extra: widget.character.id,
          );
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedScale(
                  duration: DndDurations.regular,
                  scale: widget.inFocus
                      ? isTapped
                          ? 0.95
                          : 1
                      : 0.8,
                  child: Padding(
                    padding: EdgeInsets.only(top: constraints.maxHeight * 0.25),
                    child: AnimatedContainer(
                      duration: DndDurations.fast,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      decoration: themeExtension.cardStyle,
                    ),
                  ),
                ),
              ),
              widget.inFocus
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
                            offset: Offset(constraints.maxWidth * 0.2, 0),
                            child: OverflowBox(
                              maxHeight: constraints.maxHeight,
                              maxWidth: constraints.maxWidth * 2,
                              child: CharacterAvatar(
                                assetPath: assetPath,
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
                    widget.character.name,
                    style: themeExtension.titleTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.character.characterRace.name,
                        style: themeExtension.bodyTextStyle,
                      ),
                      Text(
                        widget.character.characterClass.name,
                        style: themeExtension.bodyTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    'Уровень: ${widget.character.level.toString()}',
                    style: themeExtension.bodyTextStyle,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    themeExtension = theme.extension<CharacterCardThemeExtension>() ??
        CharacterCardThemeExtension.dark;
  }

  @override
  void initState() {
    super.initState();
    assetPath = CharacterClassType.getRandomAsset();
  }
}
