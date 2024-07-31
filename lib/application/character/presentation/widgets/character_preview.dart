import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/character_screen.dart';
import 'package:flutter_application_1/core/utils/extensions/hex_color.dart';
import 'package:go_router/go_router.dart';

class CharacterPreview extends StatelessWidget {
  final Character character;
  final bool inFocus;
  const CharacterPreview({
    required this.character,
    required this.inFocus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double avatarHeigh = 100;
    const double padding = avatarHeigh / 2;

    return GestureDetector(
      onTap: () {
        context.pushNamed(CharacterScreen.routeName, extra: character.name);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: inFocus ? 1 : 0.8,
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: padding),
                      child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight - padding,
                        decoration: BoxDecoration(
                          color: HexColor.fromHex('#FAFBFC').withOpacity(0.08),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: HexColor.fromHex('#FAFBFC'),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5, padding + 5, 5, 5),
                          child: Column(
                            children: [
                              Text(
                                character.name,
                                style: TextStyle(
                                  color: HexColor.fromHex('#FAFBFC'),
                                  fontSize: 40,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    character.characterRace!.name,
                                    style: TextStyle(
                                      color: HexColor.fromHex('#FAFBFC'),
                                      fontSize: 27,
                                    ),
                                  ),
                                  Text(
                                    character.characterClass!.name,
                                    style: TextStyle(
                                      color: HexColor.fromHex('#FAFBFC'),
                                      fontSize: 27,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Уровень: ${character.level.toString()}',
                                style: TextStyle(
                                  color: HexColor.fromHex('#FAFBFC'),
                                  fontSize: 27,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    inFocus
                        ? Animate(
                            effects: const [
                              // SlideEffect(
                              //   begin: Offset(0, 0.4),
                              //   end: Offset.zero,
                              //   duration: Duration(milliseconds: 400),
                              // ),
                              FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: Duration(milliseconds: 800),
                              ),
                            ],
                            child: Container(
                              height: avatarHeigh,
                              width: avatarHeigh,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/human_plug.jpeg',
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
          );
        }),
      ),
    );
  }
}
