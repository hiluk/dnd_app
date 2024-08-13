import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character_creating/bloc/select_race_cubit.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/race_widget.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/expandable_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RacesListView extends StatelessWidget {
  final List<Race> races;
  const RacesListView({
    super.key,
    required this.races,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final race = races[index];

          return ExpandableWidget(
            key: ValueKey(race.name),
            onToggle: () => context.read<SelectRaceCubit>().selectRace(race),
            isExpanded: context.watch<SelectRaceCubit>().state == race,
            child: RaceWidget(race: race),
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
