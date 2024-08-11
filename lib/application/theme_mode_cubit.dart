import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/enums/mode_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeModeCubit extends Cubit<ModeType> {
  ThemeModeCubit() : super(ModeType.light);

  void toggle() {
    print('Я нажат');
    if (state.name == ThemeMode.light.name) {
      print('Я теперь темный');
      emit(ModeType.dark);
    } else {
      print('Я теперь светлый');
      emit(ModeType.light);
    }
  }
}
