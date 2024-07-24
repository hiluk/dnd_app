import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/character_preview.dart';

class SnappingCharactersList extends StatefulWidget {
  final List<Character> characters;

  const SnappingCharactersList({
    super.key,
    required this.characters,
  });

  @override
  State<SnappingCharactersList> createState() => _SnappingCharactersListState();
}

class _SnappingCharactersListState extends State<SnappingCharactersList>
    with TickerProviderStateMixin {
  late int _currentIndex;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView.builder(
        itemCount: widget.characters.length,
        onPageChanged: (value) => setState(() => _currentIndex = value),
        controller: _pageController,
        itemBuilder: (context, index) {
          return CharacterPreview(
            character: widget.characters[index],
            inFocus: _currentIndex == index,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: 0.65,
      keepPage: true,
    );
  }
}
