import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/application/character_creating/bloc/skill_choice_cubit.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора навыков: разделы показываются, только если в них есть выбор
class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  static SkillSections sectionsOf(CharacterCreationBlocState state) =>
      SkillSections(
        background: state.background!,
        race: state.characterRace!,
        characterClass: state.characterClass!,
      );

  @override
  Widget build(BuildContext context) {
    final creation = context.watch<CharacterCreationBloc>().state;
    final sections = sectionsOf(creation);

    return BlocConsumer<SkillChoiceCubit, SkillSelection>(
      listener: (context, selection) {
        if (!sections.isComplete(selection)) return;
        context
            .read<CharacterCreationBloc>()
            .add(CharacterCreationBlocEventPreview(creation.draft(skills: selection)!));
      },
      builder: (context, selection) {
        final known = sections.known(selection);
        final complete = sections.isComplete(selection);
        final sheet = complete ? creation.sheet : null;

        return DefaultTextStyle.merge(
          style: DndTheme.readableText,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final section in sections.sections)
                _SectionChips(
                  section: section,
                  sections: sections,
                  selection: selection,
                ),
              // Сводка под разделами: растёт при выборе и не сдвигает чипы
              const _Title('Владение навыками'),
              Text(
                known.isEmpty
                    ? 'Пока ни одного навыка'
                    : known.entries
                        .map((e) => '${e.key.title} — ${e.value}')
                        .join('\n'),
              ),
              if (sheet != null) ...[
                const _Title('Итог'),
                Text(
                  sheet.skills
                      .where((s) => s.proficient)
                      .map((s) => '${s.skill.title} ${formatBonus(s.bonus)}'
                          '${s.expertise ? ' ◆' : ''}')
                      .join(' · '),
                ),
                Text('Пассивная внимательность: ${sheet.passivePerception}'),
              ],
              if (complete && creation.previewError != null)
                Text(
                  creation.previewError!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontFamily: DndTheme.decorativeFont, fontSize: 20),
      ),
    );
  }
}

class _SectionChips extends StatelessWidget {
  final SkillSection section;
  final SkillSections sections;
  final SkillSelection selection;

  const _SectionChips({
    required this.section,
    required this.sections,
    required this.selection,
  });

  @override
  Widget build(BuildContext context) {
    final limit = sections.limit(section);
    final chosen = sections.chosen(selection, section);
    final options = sections.options(selection, section);
    final candidates = section == SkillSection.expertise
        ? Skill.sorted.where(options.contains)
        : section == SkillSection.characterClass
            ? Skill.sorted.where(sections.characterClass.skillOptions.contains)
            : Skill.sorted;

    final title = switch (section) {
      SkillSection.background => 'Навыки предыстории',
      SkillSection.race => 'Навыки расы',
      SkillSection.characterClass => 'Навыки класса',
      SkillSection.expertise => 'Компетентность',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title('$title: ${chosen.length} из $limit'),
        if (section == SkillSection.expertise)
          const Text('Бонус мастерства удваивается для выбранных навыков'),
        const SizedBox(height: 4),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final skill in candidates)
              FilterChip(
                // Без галочки ширина чипа не меняется и ряд не перестраивается
                showCheckmark: false,
                label: Text(skill.title),
                selected: chosen.contains(skill),
                onSelected: chosen.contains(skill) ||
                        (options.contains(skill) && chosen.length < limit)
                    ? (_) => context
                        .read<SkillChoiceCubit>()
                        .toggle(sections, section, skill)
                    : null,
              ),
          ],
        ),
      ],
    );
  }
}
