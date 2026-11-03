import 'package:bloc/bloc.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';

/// Класс, выбранный в списке (повторное нажатие снимает выбор)
class ClassCubit extends Cubit<Class?> {
  ClassCubit() : super(null);

  void selectClass(Class? newClass) =>
      emit(state == newClass ? null : newClass);
}
