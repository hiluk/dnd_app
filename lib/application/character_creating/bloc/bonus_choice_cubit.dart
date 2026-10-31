import 'package:bloc/bloc.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';

/// Характеристики, выбранные для бонусов расы «на выбор»
class BonusChoiceCubit extends Cubit<List<Ability>> {
  BonusChoiceCubit() : super(const []);

  /// Выбрать или снять выбор; больше [max] выбрать нельзя
  void toggle(Ability ability, {required int max}) {
    if (state.contains(ability)) {
      emit(state.where((e) => e != ability).toList());
    } else if (state.length < max) {
      emit([...state, ability]);
    }
  }

  void reset() => emit(const []);
}
