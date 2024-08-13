import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/character_card.dart';

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
  late List<Character> _characters;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: height * 0.6,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: _characters.length,
            onPageChanged: (value) => setState(() => _currentIndex = value),
            controller: _pageController,
            reverse: true,
            itemBuilder: (context, index) {
              return CharacterCard(
                character: _characters[index],
                inFocus: _currentIndex == index,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _characters = widget.characters.reversed.toList();
    _currentIndex = widget.characters.length;
    _pageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: 0.7,
      keepPage: true,
    );
  }
}
