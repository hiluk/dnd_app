import 'package:flutter/material.dart';
import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/presentation/character_screen.dart';
import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/ui_kit/theme_extensions/character_card_theme_extension.dart';
import 'package:dnd_app/core/ui_kit/widgets/scale_listener.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';
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

  @override
  Widget build(BuildContext context) {
    return ScaleListener(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
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
                  curve: Curves.easeOut,
                  duration: DndDurations.regular,
                  scale: widget.inFocus ? 0.9 : 0.8,
                  child: Padding(
                    padding: EdgeInsets.only(top: constraints.maxHeight * 0.25),
                    child: Material(
                      elevation: 8,
                      borderRadius: themeExtension.cardStyle.borderRadius,
                      child: AnimatedContainer(
                        duration: DndDurations.fast,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        decoration: themeExtension.cardStyle,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: DndDurations.regular,
                curve: Curves.easeOut,
                opacity: widget.inFocus ? 1 : 0,
                child: Transform.translate(
                  offset: Offset(constraints.maxWidth * 0.2, 0),
                  child: OverflowBox(
                    maxHeight: constraints.maxHeight * 0.9,
                    maxWidth: constraints.maxWidth * 2,
                    child: CharacterAvatar(
                      assetPath: assetPath,
                    ),
                  ),
                ),
              ),
              // Плашка под текстом: картинки бывают и прозрачными, и с фоном
              Center(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.45),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.character.name,
                        style: themeExtension.titleTextStyle,
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16,
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
                ),
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
    assetPath = CharacterClassType.getAssetByName(
      widget.character.characterClass.name,
    );
  }
}
