import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/core/api/weapons/models/weapon_model.dart';
import 'package:flutter_application_1/application/core/di/di.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = locator.get<List<Weapon>>();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
      ),
    );
  }
}
