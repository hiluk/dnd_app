import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/class_widget.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/expandable_widget.dart';

class ClassesListView extends StatelessWidget {
  final List<Class> classes;
  const ClassesListView({
    super.key,
    required this.classes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ExpandableWidget(
              isExpanded: false,
              onToggle: () {},
              child: ClassWidget(characterClass: classes[index]),
            ),
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.7),
            ),
          ],
        );
      },
    );
  }
}
