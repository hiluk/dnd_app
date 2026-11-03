import 'package:dnd_app/core/prefs/theme_preferences.dart';
import 'package:dnd_app/core/ui_kit/bloc/theme_mode_cubit.dart';
import 'package:dnd_app/core/utils/enums/mode_enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final logger = Logger(level: Level.off);

  Future<ModeTypeCubit> cubitWith(Map<String, Object> stored) async {
    SharedPreferences.setMockInitialValues(stored);
    final preferences = await SharedPreferences.getInstance();
    return ModeTypeCubit(logger, ThemePreferences(preferences));
  }

  test('Без сохранённого выбора тема тёмная', () async {
    final cubit = await cubitWith({});
    expect(cubit.state, ModeType.dark);
  });

  test('Восстанавливает сохранённую тему', () async {
    final cubit = await cubitWith({'themeMode': 'light'});
    expect(cubit.state, ModeType.light);
  });

  test('Неизвестное значение в хранилище не ломает запуск', () async {
    final cubit = await cubitWith({'themeMode': 'sepia'});
    expect(cubit.state, ModeType.dark);
  });

  test('Переключение сохраняется и переживает перезапуск', () async {
    final cubit = await cubitWith({});
    await cubit.toggle();
    expect(cubit.state, ModeType.light);

    // «Перезапуск»: новый кубит читает то же хранилище
    final preferences = await SharedPreferences.getInstance();
    final restarted = ModeTypeCubit(logger, ThemePreferences(preferences));
    expect(restarted.state, ModeType.light);
  });
}
