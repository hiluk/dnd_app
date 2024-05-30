import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:flutter_application_1/application/core/features/races/models/race_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final races = locator.get<List<Race>>();
    print(races.toString());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Column(
                  children: races.map((e) => Text(e.name)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
