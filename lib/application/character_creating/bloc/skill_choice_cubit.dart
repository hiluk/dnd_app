import 'package:bloc/bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/api/races/models/race_model.dart';

/// Раздел выбора навыков
enum SkillSection { background, race, characterClass, expertise }

/// Правила выбора навыков для интерфейса (окончательно проверяет сервер):
/// какие разделы нужны, сколько выбрать и что доступно с учётом
/// уже полученных навыков. Порядок разделов — как на сервере.
class SkillSections {
  final Background background;
  final Race race;
  final Class characterClass;

  const SkillSections({
    required this.background,
    required this.race,
    required this.characterClass,
  });

  /// Навыки, полученные без выбора, и их источник
  Map<Skill, String> get fixed => {
        for (final skill in background.skills) skill: 'предыстория',
        for (final skill in race.skills) skill: 'раса',
      };

  int limit(SkillSection section) => switch (section) {
        SkillSection.background => background.skillChoices,
        SkillSection.race => race.skillChoices,
        SkillSection.characterClass => characterClass.skillChoices,
        SkillSection.expertise => characterClass.expertiseChoices,
      };

  List<SkillSection> get sections =>
      SkillSection.values.where((s) => limit(s) > 0).toList();

  List<Skill> chosen(SkillSelection selection, SkillSection section) =>
      switch (section) {
        SkillSection.background => selection.background,
        SkillSection.race => selection.race,
        SkillSection.characterClass => selection.characterClass,
        SkillSection.expertise => selection.expertise,
      };

  /// Все навыки, которыми персонаж владеет, и источник каждого
  Map<Skill, String> known(SkillSelection selection) => {
        ...fixed,
        for (final skill in selection.background) skill: 'предыстория',
        for (final skill in selection.race) skill: 'раса',
        for (final skill in selection.characterClass) skill: 'класс',
      };

  /// Навыки, которые можно выбрать в разделе (включая уже выбранные в нём)
  Set<Skill> options(SkillSelection selection, SkillSection section) {
    final taken = {
      ...fixed.keys,
      if (section != SkillSection.background) ...selection.background,
      if (section == SkillSection.characterClass) ...selection.race,
    };

    return switch (section) {
      SkillSection.background ||
      SkillSection.race =>
        Skill.values.toSet().difference(taken),
      SkillSection.characterClass =>
        characterClass.skillOptions.toSet().difference(taken),
      SkillSection.expertise => known(selection).keys.toSet(),
    };
  }

  bool isComplete(SkillSelection selection) => sections.every((section) {
        final chosen = this.chosen(selection, section);
        return chosen.length == limit(section) &&
            chosen.every(options(selection, section).contains);
      });
}

/// Выбор навыков по разделам
class SkillChoiceCubit extends Cubit<SkillSelection> {
  SkillChoiceCubit() : super(const SkillSelection());

  void reset() => emit(const SkillSelection());

  /// Выбрать или снять навык в разделе. После изменения раннего раздела
  /// из следующих убираются навыки, которые стали недоступны.
  void toggle(SkillSections sections, SkillSection section, Skill skill) {
    final current = sections.chosen(state, section);
    final List<Skill> updated;
    if (current.contains(skill)) {
      updated = current.where((s) => s != skill).toList();
    } else if (current.length < sections.limit(section) &&
        sections.options(state, section).contains(skill)) {
      updated = [...current, skill];
    } else {
      return;
    }

    var selection = switch (section) {
      SkillSection.background => state.copyWith(background: updated),
      SkillSection.race => state.copyWith(race: updated),
      SkillSection.characterClass => state.copyWith(characterClass: updated),
      SkillSection.expertise => state.copyWith(expertise: updated),
    };

    // Порядок разделов важен: каждый следующий зависит от предыдущих
    for (final later in SkillSection.values.skip(section.index + 1)) {
      final allowed = sections.options(selection, later);
      final kept = sections
          .chosen(selection, later)
          .where(allowed.contains)
          .toList();
      selection = switch (later) {
        SkillSection.background => selection,
        SkillSection.race => selection.copyWith(race: kept),
        SkillSection.characterClass =>
          selection.copyWith(characterClass: kept),
        SkillSection.expertise => selection.copyWith(expertise: kept),
      };
    }

    emit(selection);
  }
}
