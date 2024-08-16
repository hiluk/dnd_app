import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/di/di.dart';

class ClassCubit extends Cubit<Class?> {
  ClassCubit() : super(null);

  void selectClass(Class? newClass) {
    if (state == newClass || newClass == null) {
      emit(null);
    } else {
      for (final characterClass in di.get<List<Class>>()) {
        characterClass == newClass ? emit(newClass) : null;
      }
    }
  }
}
