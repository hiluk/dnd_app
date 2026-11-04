import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_models.freezed.dart';
part 'session_models.g.dart';

/// Состояния из «Книги игрока». [jsonValue] совпадает с сервером.
@JsonEnum(valueField: 'jsonValue')
enum Condition {
  blinded(1, 'Ослеплённый'),
  charmed(2, 'Очарованный'),
  deafened(3, 'Оглохший'),
  frightened(4, 'Испуганный'),
  grappled(5, 'Схваченный'),
  incapacitated(6, 'Недееспособный'),
  invisible(7, 'Невидимый'),
  paralyzed(8, 'Парализованный'),
  petrified(9, 'Окаменевший'),
  poisoned(10, 'Отравленный'),
  prone(11, 'Сбитый с ног'),
  restrained(12, 'Опутанный'),
  stunned(13, 'Ошеломлённый'),
  unconscious(14, 'Бессознательный');

  final int jsonValue;
  final String title;
  const Condition(this.jsonValue, this.title);

  static Condition? fromJson(int value) {
    for (final condition in values) {
      if (condition.jsonValue == value) return condition;
    }
    return null;
  }
}

/// Что даёт каждый уровень истощения
const exhaustionEffects = [
  'Нет истощения',
  'Помеха на проверки характеристик',
  'Скорость уменьшается вдвое',
  'Помеха на атаки и спасброски',
  'Максимум хитов вдвое меньше',
  'Скорость 0',
  'Смерть',
];

/// Состояние персонажа в сессии
@freezed
class SessionState with _$SessionState {
  const SessionState._();

  const factory SessionState({
    required int currentHp,
    @Default(0) int tempHp,
    @Default(0) int hitDiceSpent,
    @Default(0) int deathSuccesses,
    @Default(0) int deathFailures,
    @Default(false) bool isStable,
    @Default(false) bool isDead,
    @Default([]) List<Condition> conditions,
    @Default(0) int exhaustion,
  }) = _SessionState;

  factory SessionState.fromJson(Map<String, dynamic> json) =>
      _$SessionStateFromJson(json);

  /// Без сознания и умирает: 0 хитов, не стабилен, жив
  bool get isDying => currentHp == 0 && !isStable && !isDead;
}

/// Неизменные для сессии данные персонажа, нужные правилам
@freezed
class SessionContext with _$SessionContext {
  const factory SessionContext({
    /// Максимум хитов по листу
    required int baseMaxHp,

    /// Грань кости хитов: 6, 8, 10 или 12
    required int hitDie,

    /// Уровень: столько же костей хитов
    required int level,
    required int conModifier,
  }) = _SessionContext;

  factory SessionContext.fromJson(Map<String, dynamic> json) =>
      _$SessionContextFromJson(json);
}

/// Что произошло в результате действия
enum SessionOutcome {
  knockedOut,
  instantDeath,
  died,
  revived,
  stabilized,
  deathSaveSuccess,
  deathSaveFailure,
  naturalTwenty,
  naturalOne,
  resurrected;

  static SessionOutcome? byName(String name) {
    for (final outcome in values) {
      if (outcome.name == name) return outcome;
    }
    return null;
  }
}

/// Итог действия
class SessionResult {
  final SessionState state;
  final SessionState before;
  final List<SessionOutcome> outcomes;

  /// Сколько хитов восстановлено
  final int healed;

  /// Сколько урона поглотили временные хиты
  final int absorbed;

  const SessionResult(
    this.state,
    this.before,
    this.outcomes, {
    this.healed = 0,
    this.absorbed = 0,
  });
}

/// Действие нельзя выполнить по правилам
class SessionRulesException implements Exception {
  final String field;
  final String message;

  const SessionRulesException(this.field, this.message);

  @override
  String toString() => message;
}
