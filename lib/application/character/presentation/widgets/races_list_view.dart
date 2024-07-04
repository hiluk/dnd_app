import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/race_element.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/application/core/di/di.dart';

class RacesListView extends StatefulWidget {
  const RacesListView({
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
            RaceElement(
              race: races[index],
              isExpanded: isSelected(races[index].name),
              onSelect: (raceName) => selectRace(raceName),
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
    races = locator.get<List<Race>>();
    selectedRace = null;
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

    debugPrint('Selected race: ${selectedRace?.name}');
  }
}
