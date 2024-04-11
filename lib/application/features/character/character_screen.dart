import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 5),
              child: Divider(color: Colors.black),
            ),
            backgroundColor: Color.fromRGBO(166, 34, 34, 1),
            foregroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              'Экран персонажа',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            actions: [],
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 244,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://pics.craiyon.com/2023-09-13/36933c8287f9433097664f958eb84b0e.webp',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all()),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Oryx',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Раса:',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Полуэльф',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Класс:',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Изобретатель 2 уровня',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
