import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:flutter_application_1/application/core/features/classes/models/class_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = locator.get<List<Class>>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Column(
                  children: classes.map((e) => Text(e.name)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
