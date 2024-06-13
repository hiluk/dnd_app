import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/application/core/api/races/models/race_model.dart';

class RaceElement extends StatelessWidget {
  final Race race;
  final bool isExpanded;
  final Function(String?) onSelect;
  const RaceElement({
    super.key,
    required this.race,
    required this.isExpanded,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final notExpandedHeight = size.height * 0.07;
    final expandedHeight = size.height * 0.5;

    return GestureDetector(
      onTap: () => onSelect(race.name),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: Colors.transparent,
        height: isExpanded ? expandedHeight : notExpandedHeight,
        child: Padding(
          padding: EdgeInsets.only(top: notExpandedHeight * 0.25),
          child: Column(
            children: [
              Text(
                race.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              isExpanded
                  ? Flexible(
                      flex: 1,
                      child: Animate(
                        delay: const Duration(milliseconds: 500),
                        effects: const [
                          FadeEffect(
                            begin: 0,
                            end: 1,
                            duration: Duration(milliseconds: 500),
                          ),
                        ],
                        child: Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(race.desc),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(race.languages),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
