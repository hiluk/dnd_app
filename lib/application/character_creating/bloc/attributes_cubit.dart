import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';

class AttributesCubit extends Cubit<Attributes> {
  AttributesCubit() : super(Attributes());

  void decrementCharisma() => state.charisma != 0
      ? emit(state.copyWith(charisma: state.charisma - 1))
      : null;

  void decrementConstitution() => state.constitution != 0
      ? emit(state.copyWith(constitution: state.constitution - 1))
      : null;

  void decrementDexterity() => state.dexterity != 0
      ? emit(state.copyWith(dexterity: state.dexterity - 1))
      : null;

  void decrementIntelligence() => state.intelligence != 0
      ? emit(state.copyWith(intelligence: state.intelligence - 1))
      : null;

  void decrementStrength() => state.strength != 0
      ? emit(state.copyWith(strength: state.strength - 1))
      : null;

  void decrementWisdom() =>
      state.wisdom != 0 ? emit(state.copyWith(wisdom: state.wisdom - 1)) : null;

  void incrementCharisma() => state.charisma != 20
      ? emit(state.copyWith(charisma: state.charisma + 1))
      : null;

  void incrementConstitution() => state.constitution != 20
      ? emit(state.copyWith(constitution: state.constitution + 1))
      : null;

  void incrementDexterity() => state.dexterity != 20
      ? emit(state.copyWith(dexterity: state.dexterity + 1))
      : null;

  void incrementIntelligence() => state.intelligence != 20
      ? emit(state.copyWith(intelligence: state.intelligence + 1))
      : null;

  void incrementStrength() => state.strength != 20
      ? emit(state.copyWith(strength: state.strength + 1))
      : null;

  void incrementWisdom() => state.wisdom != 20
      ? emit(state.copyWith(wisdom: state.wisdom + 1))
      : null;
}
