import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character_creating/bloc/class_cubit.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/class_widget.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/expandable_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesListView extends StatelessWidget {
  const ClassesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final classes = di.get<List<Class>>();

    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final characterClass = classes[index];

          return BlocBuilder<ClassCubit, Class?>(
            builder: (context, state) {
              return ExpandableWidget(
                key: ValueKey(characterClass.name),
                onToggle: () =>
                    context.read<ClassCubit>().selectClass(characterClass),
                isExpanded: state == characterClass,
                child: ClassWidget(characterClass: characterClass),
              );
            },
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
}
