import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/utils/extensions/cubit_extension.dart';

class SelectRaceCubit extends Cubit<Race?> {
  SelectRaceCubit() : super(null);

  void selectRace(Race characterRace) {
    if (state == characterRace) {
      cleanState();
    } else {
      for (final race in di.get<List<Race>>()) {
        race == characterRace ? emit(race) : null;
      }
    }
  }
}
