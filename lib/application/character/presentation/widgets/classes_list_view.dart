import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/character_class_element.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/expandable_element.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_assets.dart';

class ClassesListView extends StatefulWidget {
  final Function(Class?) selectClass;
  const ClassesListView({
    required this.selectClass,
    super.key,
  });

  @override
  State<ClassesListView> createState() => _ClassesListViewState();
}

class _ClassesListViewState extends State<ClassesListView> {
  late Class? selectedRace;
  late List<Class> classes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ExpandableElement(
              asset: DndAssets.warrior,
              onToggle: (isExpanded) => selectClass(classes[index].name),
              child: ClassElement(characterClass: classes[index]),
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

  @override
  void initState() {
    classes = di.get<List<Class>>();
    selectedRace = null;
    super.initState();
  }

  bool isSelected(String name) {
    return selectedRace?.name != null &&
            selectedRace!.name.contains(name) &&
            selectedRace!.name.length == name.length
        ? true
        : false;
  }

  void selectClass(String className) {
    if (isSelected(className)) {
      selectedRace = null;
    } else {
      for (final characterClass in classes) {
        characterClass.name == className ? selectedRace = characterClass : null;
      }
    }
    setState(() {});
    widget.selectClass(selectedRace);
  }
}
