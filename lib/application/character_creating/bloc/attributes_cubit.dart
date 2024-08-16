import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';

class StatsCubit extends Cubit<Attributes?> {
  StatsCubit() : super(null);

  int get charisma => state?.charisma ?? 0;
  int get constitution => state?.constitution ?? 0;
  int get dexterity => state?.dexterity ?? 0;
  int get intelligence => state?.intelligence ?? 0;
  int get strength => state?.strength ?? 0;
  int get wisdom => state?.wisdom ?? 0;

  void clear() => emit(null);

  void decrementCharisma() => state != null && charisma != 0
      ? emit(state?.copyWith(charisma: charisma - 1))
      : null;

  void decrementConstitution() => state != null && constitution != 0
      ? emit(state?.copyWith(constitution: constitution - 1))
      : null;

  void decrementDexterity() => state != null && dexterity != 0
      ? emit(state?.copyWith(dexterity: dexterity - 1))
      : null;

  void decrementIntelligence() => state != null && intelligence != 0
      ? emit(state?.copyWith(intelligence: intelligence - 1))
      : null;

  void decrementStrength() => state != null && strength != 0
      ? emit(state?.copyWith(strength: strength - 1))
      : null;

  void decrementWisdom() => state != null && wisdom != 0
      ? emit(state?.copyWith(wisdom: wisdom - 1))
      : null;

  void incrementCharisma() => state != null && charisma != 20
      ? emit(state?.copyWith(charisma: charisma + 1))
      : null;

  void incrementConstitution() => state != null && constitution != 20
      ? emit(state?.copyWith(constitution: constitution + 1))
      : null;

  void incrementDexterity() => state != null && dexterity != 20
      ? emit(state?.copyWith(dexterity: dexterity + 1))
      : null;

  void incrementIntelligence() => state != null && intelligence != 20
      ? emit(state?.copyWith(intelligence: intelligence + 1))
      : null;

  void incrementStrength() => state != null && strength != 20
      ? emit(state?.copyWith(strength: strength + 1))
      : null;

  void incrementWisdom() => state != null && wisdom != 20
      ? emit(state?.copyWith(wisdom: wisdom + 1))
      : null;

  void init() => state == null ? emit(const Attributes()) : null;
}
