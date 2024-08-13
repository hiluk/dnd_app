import 'package:flutter_bloc/flutter_bloc.dart';

extension SetNull on BlocBase {
  void cleanState() {
    emit(null);
  }
}
