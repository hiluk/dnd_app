import 'package:dnd_app/core/utils/enums/mode_enums.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Хранит выбранную тему между запусками
@lazySingleton
class ThemePreferences {
  static const _key = 'themeMode';

  final SharedPreferences _preferences;

  ThemePreferences(this._preferences);

  /// Сохранённая тема; null — пользователь ещё не выбирал
  ModeType? read() {
    final name = _preferences.getString(_key);
    for (final mode in ModeType.values) {
      if (mode.name == name) return mode;
    }
    return null;
  }

  Future<void> save(ModeType mode) => _preferences.setString(_key, mode.name);
}
