import 'package:bloc/bloc.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';

/// Раса, выбранная в списке (повторное нажатие снимает выбор)
class RaceCubit extends Cubit<Race?> {
  RaceCubit() : super(null);

  void selectRace(Race? race) => emit(state == race ? null : race);
}
