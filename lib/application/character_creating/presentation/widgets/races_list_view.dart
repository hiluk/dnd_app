import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/expandable_element.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/character_race_element.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/di/di.dart';

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
