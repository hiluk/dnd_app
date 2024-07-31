import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/presentation/widgets/race_element.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';

class RacesListView extends StatefulWidget {
  final Function(Race?) selectRace;
  final List<Race> races;
  const RacesListView({
    required this.selectRace,
    required this.races,
    super.key,
  });

  @override
  State<RacesListView> createState() => _RacesListViewState();
}

class _RacesListViewState extends State<RacesListView> {
  late Race? selectedRace;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.races.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            RaceElement(
              race: widget.races[index],
              isExpanded: isSelected(widget.races[index].name),
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
      for (final race in widget.races) {
        race.name == raceName ? selectedRace = race : null;
      }
    }
    setState(() {});
    widget.selectRace(selectedRace);
  }
}
