import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/expandable_element.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/race_element.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/utils/constants/dnd_assets.dart';
import 'package:flutter_application_1/core/utils/constants/races_constants.dart';

class RacesListView extends StatefulWidget {
  final Function(Race?) selectRace;
  const RacesListView({
    required this.selectRace,
    super.key,
  });

  @override
  State<RacesListView> createState() => _RacesListViewState();
}

class _RacesListViewState extends State<RacesListView> {
  late Race? selectedRace;
  late List<Race> races;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: races.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ExpandableElement(
              asset: findAssetByName(races[index].name),
              onToggle: (isExpanded) => selectRace(races[index].name),
              child: RaceElement(race: races[index]),
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

  String findAssetByName(String raceName) {
    return switch (raceName) {
      RacesConstants.human => DndAssets.human,
      _ => DndAssets.human,
    };
  }

  @override
  void initState() {
    selectedRace = null;
    races = di.get<List<Race>>();
    super.initState();
  }

  bool isSelected(String name) {
    return selectedRace?.name != null &&
            selectedRace!.name.contains(name) &&
            selectedRace!.name.length == name.length
        ? true
        : false;
  }

  void selectRace(String raceName) {
    if (isSelected(raceName)) {
      selectedRace = null;
    } else {
      for (final race in races) {
        race.name == raceName ? selectedRace = race : null;
      }
    }
    setState(() {});
    widget.selectRace(selectedRace);
  }
}
