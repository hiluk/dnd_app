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
    return ListView.separated(
      itemCount: races.length,
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: Colors.grey.withOpacity(0.7),
      ),
      itemBuilder: (context, index) {
        return RaceElement(
          race: races[index],
          isExpanded: isSelected(races[index].name),
          onSelect: (raceName) => selectRace(raceName),
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
        if (race.name == raceName) {
          selectedRace = race;
        }
      }
    }
    setState(() {});

    debugPrint('Selected race: ${selectedRace?.name}');
  }
}
