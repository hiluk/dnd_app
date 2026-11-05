import 'dart:math';

/// Броски кубиков на устройстве. Сервер проверяет только диапазон,
/// поэтому важна честность генератора.
class Dice {
  final Random _random;

  Dice([Random? random]) : _random = random ?? Random.secure();

  /// Бросок кости с [faces] гранями: от 1 до [faces]
  int roll(int faces) => _random.nextInt(faces) + 1;
}
