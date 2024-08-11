import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character_creating/bloc/attributes_cubit.dart';

import 'stats_create_row.dart';

class CharacterStatsCreateView extends StatefulWidget {
  final Function(Attributes) statsCallBack;
  const CharacterStatsCreateView({
    required this.statsCallBack,
    super.key,
  });

  @override
  State<CharacterStatsCreateView> createState() =>
      _CharacterStatsCreateViewState();
}

class _CharacterStatsCreateViewState extends State<CharacterStatsCreateView> {
  late AttributesCubit stats;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StatsCreateRow(
            title: "Ловкость",
            count: stats.state.dexterity,
            onMinusClick: () => stats.decrementDexterity(),
            onPlusClick: () => stats.incrementDexterity(),
          ),
          StatsCreateRow(
            title: "Cила",
            count: stats.state.strength,
            onMinusClick: () => stats.decrementStrength(),
            onPlusClick: () => stats.incrementStrength(),
          ),
          StatsCreateRow(
            title: "Телосложение",
            count: stats.state.constitution,
            onMinusClick: () => stats.decrementConstitution(),
            onPlusClick: () => stats.incrementConstitution(),
          ),
          StatsCreateRow(
            title: "Интеллект",
            count: stats.state.intelligence,
            onMinusClick: () => stats.decrementIntelligence(),
            onPlusClick: () => stats.incrementIntelligence(),
          ),
          StatsCreateRow(
            title: "Мудрость",
            count: stats.state.wisdom,
            onMinusClick: () => stats.decrementWisdom(),
            onPlusClick: () => stats.incrementWisdom(),
          ),
          StatsCreateRow(
            title: "Харизма",
            count: stats.state.charisma,
            onMinusClick: () => stats.decrementCharisma(),
            onPlusClick: () => stats.incrementCharisma(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    stats.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    stats = AttributesCubit();
    stats.stream.listen(
      (event) => widget.statsCallBack(stats.state),
    );
  }
}
