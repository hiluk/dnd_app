import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/enums/mode_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ModeTypeCubit extends Cubit<ModeType> {
  ModeTypeCubit() : super(ModeType.light);

  bool get isDark => state == ModeType.dark;

  void toggle() {
    if (state.name == ThemeMode.light.name) {
      emit(ModeType.dark);
    } else {
      emit(ModeType.light);
    }
  }
}
