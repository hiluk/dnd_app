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
  late int currentIndex;
  late double height;
  late PageController pageController;
  late List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.6,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: characters.length,
            onPageChanged: (value) => setState(() => currentIndex = value),
            controller: pageController,
            reverse: true,
            itemBuilder: (context, index) {
              return CharacterCard(
                character: characters[index],
                inFocus: currentIndex == index,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    height = MediaQuery.sizeOf(context).height;
  }

  @override
  void initState() {
    super.initState();
    characters = widget.characters.reversed.toList();
    currentIndex = widget.characters.length;
    pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.7,
      keepPage: true,
    );
  }
}
