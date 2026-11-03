import 'package:bloc/bloc.dart';
import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';

/// Предыстория, выбранная в списке (повторное нажатие снимает выбор)
class BackgroundCubit extends Cubit<Background?> {
  BackgroundCubit() : super(null);

  void select(Background? background) =>
      emit(state == background ? null : background);
}
