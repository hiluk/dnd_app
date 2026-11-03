import 'package:bloc/bloc.dart';
import 'package:dnd_app/application/character/models/attributes_model.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment_cubit.freezed.dart';

/// Правила распределения на клиенте нужны только для интерфейса
/// (остаток очков, занятые значения); окончательно проверяет сервер.
abstract final class AbilityRules {
  static const standardArray = [15, 14, 13, 12, 10, 8];
  static const pointBuyBudget = 27;
  static const pointBuyMin = 8;
  static const pointBuyMax = 15;
  static const pointBuyCost = {
    8: 0, 9: 1, 10: 2, 11: 3, 12: 4, 13: 5, 14: 7, 15: 9, //
  };
}

@freezed
class AssignmentState with _$AssignmentState {
  const AssignmentState._();

  const factory AssignmentState({
    GenerationMethod? method,

    /// Значения, которые распределяются (стандартный набор или броски)
    @Default([]) List<int> pool,

    /// Характеристика → индекс значения в [pool]
    @Default({}) Map<Ability, int> assigned,

    /// Значения при покупке очков
    @Default({}) Map<Ability, int> points,
    String? rollToken,
    @Default(false) bool isRolling,
    String? error,
  }) = _AssignmentState;

  int get spentPoints => points.values
      .fold(0, (sum, value) => sum + AbilityRules.pointBuyCost[value]!);

  int get remainingPoints => AbilityRules.pointBuyBudget - spentPoints;

  bool canIncrement(Ability ability) {
    final value = points[ability] ?? AbilityRules.pointBuyMin;
    if (value >= AbilityRules.pointBuyMax) return false;
    final cost = AbilityRules.pointBuyCost[value + 1]! -
        AbilityRules.pointBuyCost[value]!;
    return cost <= remainingPoints;
  }

  bool canDecrement(Ability ability) =>
      (points[ability] ?? AbilityRules.pointBuyMin) > AbilityRules.pointBuyMin;

  int? valueOf(Ability ability) => method == GenerationMethod.pointBuy
      ? points[ability]
      : assigned[ability] == null
          ? null
          : pool[assigned[ability]!];

  /// Индексы значений, которые ещё можно назначить характеристике
  List<int> availableFor(Ability ability) => [
        for (var i = 0; i < pool.length; i++)
          if (!assigned.entries.any((e) => e.key != ability && e.value == i)) i,
      ];

  bool get isComplete => switch (method) {
        GenerationMethod.pointBuy => true,
        GenerationMethod.standardArray ||
        GenerationMethod.roll =>
          pool.length == 6 && assigned.length == 6,
        null => false,
      };

  Attributes? get baseStats => isComplete
      ? AttributesByAbility.fromMap({
          for (final ability in Ability.values) ability: valueOf(ability)!,
        })
      : null;
}

class AssignmentCubit extends Cubit<AssignmentState> {
  final CharactersRepository _repository;

  AssignmentCubit(this._repository) : super(const AssignmentState());

  void start(GenerationMethod method) => emit(switch (method) {
        GenerationMethod.standardArray => const AssignmentState(
            method: GenerationMethod.standardArray,
            pool: AbilityRules.standardArray,
          ),
        GenerationMethod.pointBuy => AssignmentState(
            method: GenerationMethod.pointBuy,
            points: {
              for (final ability in Ability.values)
                ability: AbilityRules.pointBuyMin,
            },
          ),
        GenerationMethod.roll =>
          const AssignmentState(method: GenerationMethod.roll),
      });

  void reset() => emit(const AssignmentState());

  void assign(Ability ability, int? poolIndex) {
    final assigned = Map.of(state.assigned)
      ..removeWhere((key, value) => key == ability || value == poolIndex);
    if (poolIndex != null) assigned[ability] = poolIndex;
    emit(state.copyWith(assigned: assigned));
  }

  void increment(Ability ability) {
    if (!state.canIncrement(ability)) return;
    emit(state.copyWith(
      points: {...state.points, ability: state.points[ability]! + 1},
    ));
  }

  void decrement(Ability ability) {
    if (!state.canDecrement(ability)) return;
    emit(state.copyWith(
      points: {...state.points, ability: state.points[ability]! - 1},
    ));
  }

  /// Бросить (или перебросить) кубики на сервере
  Future<void> roll() async {
    emit(state.copyWith(isRolling: true, error: null));
    try {
      final roll = await _repository.rollAbilities();
      emit(state.copyWith(
        pool: roll.values,
        rollToken: roll.token,
        assigned: {},
        isRolling: false,
      ));
    } catch (e) {
      emit(state.copyWith(isRolling: false, error: apiErrorMessage(e)));
    }
  }
}
