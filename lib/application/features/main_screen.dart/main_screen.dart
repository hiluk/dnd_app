import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/core/ui_kit/color_scheme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Добро пожаловать - путник!',
                        style: TextStyle(
                          color: DndColors.onThirdy,
                          fontSize: 27,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Это приложение для игры Dungeon and Dragons \nгде ты можешь создавать персонажей для своих партий!',
                        style: TextStyle(
                          color: DndColors.onThirdy,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 14),
                      CupertinoButton(
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: DndColors.primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'Создай своего персонажа!',
                              style: TextStyle(
                                fontFamily: 'Vinque',
                                color: DndColors.onPrimary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
