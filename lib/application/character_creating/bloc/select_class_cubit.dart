import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/utils/extensions/cubit_extension.dart';

class SelectClassCubit extends Cubit<Class?> {
  SelectClassCubit() : super(null);

  void selectClass(Class newClass) {
    if (state == newClass) {
      cleanState();
    } else {
      for (final characterClass in di.get<List<Class>>()) {
        characterClass == newClass ? emit(newClass) : null;
      }
    }
  }
}
