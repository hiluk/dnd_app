import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/races_list_view.dart';

class CharacterCreationScreen extends StatelessWidget {
  static const routeName = 'creation';
  static const routePath = routeName;
  const CharacterCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Character creation'),
              centerTitle: true,
            ),
            SliverFillRemaining(
              child: RacesListView(),
            ),
          ],
        ),
      ),
    );
  }
}
