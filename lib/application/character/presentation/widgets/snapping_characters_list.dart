import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/presentation/widgets/character_card.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/utils/constants/dnd_durations.dart';
import 'package:flutter/material.dart';

/// Карусель персонажей: карточка в центре крупная, соседние выглядывают
class SnappingCharactersList extends StatefulWidget {
  final List<Character> characters;

  const SnappingCharactersList({super.key, required this.characters});

  @override
  State<SnappingCharactersList> createState() => _SnappingCharactersListState();
}

class _SnappingCharactersListState extends State<SnappingCharactersList> {
  late final PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.78);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characters = widget.characters;

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            clipBehavior: Clip.none,
            itemCount: characters.length,
            onPageChanged: (value) => setState(() => currentIndex = value),
            itemBuilder: (context, index) {
              final inFocus = index == currentIndex;

              return AnimatedScale(
                duration: DndDurations.regular,
                curve: Curves.easeOutCubic,
                scale: inFocus ? 1 : 0.88,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CharacterCard(
                    character: characters[index],
                    inFocus: inFocus,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        if (characters.length > 1)
          _PageMarks(count: characters.length, current: currentIndex),
      ],
    );
  }
}

/// Отметки страниц: ромбы, текущий — золотой и крупнее
class _PageMarks extends StatelessWidget {
  final int count;
  final int current;

  const _PageMarks({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: DndDurations.fast,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: i == current ? 9 : 6,
            height: i == current ? 9 : 6,
            transform: Matrix4.rotationZ(0.785398),
            transformAlignment: Alignment.center,
            color: i == current ? p.gold : p.line,
          ),
      ],
    );
  }
}
