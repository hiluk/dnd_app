import 'package:dnd_app/core/prefs/theme_preferences.dart';
import 'package:dnd_app/core/utils/enums/mode_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Тема приложения. Выбор сохраняется и восстанавливается при запуске;
/// пока пользователь не выбирал, тема тёмная.
@injectable
class ModeTypeCubit extends Cubit<ModeType> {
  static const defaultMode = ModeType.dark;

  final Logger _logger;
  final ThemePreferences _preferences;

  ModeTypeCubit(this._logger, this._preferences)
      : super(_preferences.read() ?? defaultMode);

  bool get isDark => state == ModeType.dark;

  @override
  void onChange(Change<ModeType> change) {
    _logger.i('Тема сменилась: ${change.nextState.name}');
    super.onChange(change);
  }

  Future<void> toggle() async {
    final next = isDark ? ModeType.light : ModeType.dark;
    emit(next);
    try {
      await _preferences.save(next);
    } catch (e) {
      // Тема уже сменилась на экране; не сохранили — вернётся при перезапуске
      _logger.w('Не удалось сохранить тему: $e');
    }
  }
}
