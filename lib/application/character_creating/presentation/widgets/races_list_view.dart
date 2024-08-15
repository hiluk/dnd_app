import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character_creating/bloc/race_cubit.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/race_widget.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/expandable_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';

class RacesListView extends StatefulWidget {
  final Function(Race?) raceCallBack;
  const RacesListView({
    super.key,
    required this.raceCallBack,
  });

  @override
  State<RacesListView> createState() => _RacesListViewState();
}

class _RacesListViewState extends State<RacesListView> {
  late RaceCubit cubit;
  late List<Race> races;

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      key: const ValueKey('race'),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final race = races[index];

          return BlocConsumer<RaceCubit, Race?>(
            bloc: cubit,
            listener: (context, state) => widget.raceCallBack(state),
            builder: (context, state) {
              return ExpandableWidget(
                key: ValueKey(race.name),
                onToggle: () => cubit.selectRace(race),
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

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    cubit = RaceCubit();
    races = di.get<List<Race>>();
  }
}
