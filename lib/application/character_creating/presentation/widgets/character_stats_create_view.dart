import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character_creating/bloc/attributes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stats_create_row.dart';

class CharacterStatsCreateView extends StatefulWidget {
  const CharacterStatsCreateView({
    super.key,
  });

  @override
  State<CharacterStatsCreateView> createState() =>
      _CharacterStatsCreateViewState();
}

class _CharacterStatsCreateViewState extends State<CharacterStatsCreateView> {
  @override
  Widget build(BuildContext context) {
    final statsCubit = context.read<StatsCubit>();

    return BlocBuilder<StatsCubit, Attributes?>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StatsCreateRow(
                title: "Ловкость",
                count: state?.dexterity ?? 0,
                onMinusClick: () => statsCubit.decrementDexterity(),
                onPlusClick: () => statsCubit.incrementDexterity(),
              ),
              StatsCreateRow(
                title: "Cила",
                count: state?.strength ?? 0,
                onMinusClick: () => statsCubit.decrementStrength(),
                onPlusClick: () => statsCubit.incrementStrength(),
              ),
              StatsCreateRow(
                title: "Телосложение",
                count: state?.constitution ?? 0,
                onMinusClick: () => statsCubit.decrementConstitution(),
                onPlusClick: () => statsCubit.incrementConstitution(),
              ),
              StatsCreateRow(
                title: "Интеллект",
                count: state?.intelligence ?? 0,
                onMinusClick: () => statsCubit.decrementIntelligence(),
                onPlusClick: () => statsCubit.incrementIntelligence(),
              ),
              StatsCreateRow(
                title: "Мудрость",
                count: state?.wisdom ?? 0,
                onMinusClick: () => statsCubit.decrementWisdom(),
                onPlusClick: () => statsCubit.incrementWisdom(),
              ),
              StatsCreateRow(
                title: "Харизма",
                count: state?.charisma ?? 0,
                onMinusClick: () => statsCubit.decrementCharisma(),
                onPlusClick: () => statsCubit.incrementCharisma(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<StatsCubit>().init();
  }
}
