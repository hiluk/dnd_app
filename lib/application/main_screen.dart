import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/character_selection_view.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () =>
                      context.pushNamed(CharacterSelectionView.routeName),
                  icon: const Icon(Icons.person),
                )
              ],
            ),
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
