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
  late String? selectedRaceName;

  @override
  Widget build(BuildContext context) {
    final races = locator.get<List<Race>>();

    return ListView.separated(
      itemCount: races.length,
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: Colors.grey.withOpacity(0.7),
      ),
      itemBuilder: (context, index) {
        return RaceElement(
          race: races[index],
          isExpanded: selectedRaceName?.contains(races[index].name) ?? false,
          onSelect: (raceName) => selectRace(raceName),
        );
      },
    );
  }

  @override
  void initState() {
    selectedRaceName = null;
    super.initState();
  }

  void selectRace(String? raceName) {
    if (selectedRaceName != null) {
      selectedRaceName = null;
    }

    setState(() {
      selectedRaceName = raceName;
    });
    debugPrint('Selected race: $selectedRaceName');
  }
}
