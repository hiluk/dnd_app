import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character_creating/bloc/race_cubit.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/race_widget.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/expandable_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';

class RacesListView extends StatelessWidget {
  const RacesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final races = di.get<List<Race>>();

    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final race = races[index];

          return BlocBuilder<RaceCubit, Race?>(
            builder: (context, state) {
              return ExpandableWidget(
                key: ValueKey(race.name),
                onToggle: () => context.read<RaceCubit>().selectRace(race),
                isExpanded: state == race,
                child: RaceWidget(race: race),
              );
            },
          );
        },
        childCount: races.length,
        findChildIndexCallback: (key) {
          final valueKey = key as ValueKey<String>;
          final current = races.indexWhere((e) => e.name == valueKey.value);

          return current;
        },
      ),
    );
  }
}
