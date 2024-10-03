import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/enums/mode_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class ModeTypeCubit extends Cubit<ModeType> {
  final Logger _logger;
  ModeTypeCubit(this._logger) : super(ModeType.light);

  bool get isDark => state == ModeType.dark;

  @override
  void onChange(Change<ModeType> change) {
    _logger.i("Тема сменилась: ${change.nextState.name}");
    super.onChange(change);
  }

  void toggle() {
    if (state.name == ThemeMode.light.name) {
      emit(ModeType.dark);
    } else {
      emit(ModeType.light);
    }
  }
}
