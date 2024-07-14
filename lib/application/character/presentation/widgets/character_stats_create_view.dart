import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';

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

class StatsCreateRow extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onPlusClick;
  final VoidCallback onMinusClick;

  const StatsCreateRow({
    super.key,
    required this.title,
    required this.count,
    required this.onPlusClick,
    required this.onMinusClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(
            children: [
              IconButton(
                onPressed: onMinusClick,
                icon: const Icon(Icons.remove),
                color: Colors.white,
              ),
              Text(count.toString()),
              IconButton(
                onPressed: onPlusClick,
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CharacterStatsCreateViewState extends State<CharacterStatsCreateView> {
  late Attributes stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatsCreateRow(
          title: "Ловкость",
          count: stats.dexterity,
          onMinusClick: () {
            setState(() {
              stats = stats.copyWith(dexterity: stats.dexterity - 1);
            });
            widget.statsCallBack(stats);
          },
          onPlusClick: () {
            setState(() {
              stats = stats.copyWith(dexterity: stats.dexterity + 1);
            });
            widget.statsCallBack(stats);
          },
        ),
        StatsCreateRow(
          title: "Cила",
          count: stats.strength,
          onMinusClick: () {
            setState(() {
              stats = stats.copyWith(strength: stats.strength - 1);
            });
            widget.statsCallBack(stats);
          },
          onPlusClick: () {
            setState(() {
              stats = stats.copyWith(strength: stats.strength + 1);
            });
            widget.statsCallBack(stats);
          },
        ),
        StatsCreateRow(
          title: "Телосложение",
          count: stats.constitution,
          onMinusClick: () {
            setState(() {
              stats = stats.copyWith(constitution: stats.constitution - 1);
            });
            widget.statsCallBack(stats);
          },
          onPlusClick: () {
            setState(() {
              stats = stats.copyWith(constitution: stats.constitution + 1);
            });
            widget.statsCallBack(stats);
          },
        ),
        StatsCreateRow(
          title: "Интеллект",
          count: stats.intelligence,
          onMinusClick: () {
            setState(() {
              stats = stats.copyWith(intelligence: stats.intelligence - 1);
            });
            widget.statsCallBack(stats);
          },
          onPlusClick: () {
            setState(() {
              stats = stats.copyWith(intelligence: stats.intelligence + 1);
            });
            widget.statsCallBack(stats);
          },
        ),
        StatsCreateRow(
          title: "Мудрость",
          count: stats.wisdom,
          onMinusClick: () {
            setState(() {
              stats = stats.copyWith(wisdom: stats.wisdom - 1);
            });
            widget.statsCallBack(stats);
          },
          onPlusClick: () {
            setState(() {
              stats = stats.copyWith(wisdom: stats.wisdom + 1);
            });
            widget.statsCallBack(stats);
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    stats = Attributes();
  }
}
