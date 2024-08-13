import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character_creating/bloc/class_cubit.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/class_widget.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/expandable_widget.dart';

class ClassesListView extends StatefulWidget {
  final Function(Class?) classCallback;
  const ClassesListView({
    super.key,
    required this.classCallback,
  });

  @override
  State<ClassesListView> createState() => _ClassesListViewState();
}

class _ClassesListViewState extends State<ClassesListView> {
  late ClassCubit cubit;
  late List<Class> classes;

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final characterClass = classes[index];

          return ExpandableWidget(
            key: ValueKey(characterClass.name),
            onToggle: () => cubit.selectClass(characterClass),
            isExpanded: cubit.state == characterClass,
            child: ClassWidget(characterClass: characterClass),
          );
        },
        childCount: classes.length,
        findChildIndexCallback: (key) {
          final valueKey = key as ValueKey<String>;

          final current = classes.indexWhere((e) => e.name == valueKey.value);
          return current;
        },
      ),
    );
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    classes = di.get<List<Class>>();
    cubit = ClassCubit()
      ..stream.listen((event) {
        widget.classCallback(event);
      });
  }
}
