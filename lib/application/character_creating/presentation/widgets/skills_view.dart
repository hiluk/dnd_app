import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:dnd_app/application/character_creating/bloc/skill_choice_cubit.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
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

        final p = DndPalette.of(context);

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          children: [
            for (final section in sections.sections)
              _SectionChips(
                section: section,
                sections: sections,
                selection: selection,
              ),
            // Сводка под разделами: растёт при выборе и не сдвигает чипы
            const _Title('Владение навыками'),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: p.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: p.line),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (known.isEmpty)
                    Text(
                      'Пока ни одного навыка',
                      style: TextStyle(fontSize: 16, color: p.muted),
                    ),
                  for (final entry in known.entries)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        '${entry.key.title} — ${entry.value}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  if (sheet != null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(color: p.line),
                    ),
                    Wrap(
                      spacing: 14,
                      runSpacing: 6,
                      children: [
                        for (final skill in sheet.skills.where((s) => s.proficient))
                          Text(
                            '${skill.skill.title} ${formatBonus(skill.bonus)}'
                            '${skill.expertise ? ' ◆' : ''}',
                            style: TextStyle(
                              fontSize: 15,
                              color: p.ink,
                              fontFeatures: DndTheme.numbers,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Пассивная внимательность: ${sheet.passivePerception}',
                      style: TextStyle(fontSize: 15, color: p.muted),
                    ),
                  ],
                ],
              ),
            ),
            if (complete && creation.previewError != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  creation.previewError!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  /// Счётчик «0 из 2» — текстовым шрифтом: в декоративном «з» похожа на «в»
  final String? counter;

  const _Title(this.text, {this.counter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 10),
      child: Text.rich(
        TextSpan(
          text: text,
          children: [
            if (counter != null)
              TextSpan(
                text: counter,
                style: const TextStyle(
                  fontFamily: DndTheme.textFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        style: Theme.of(context).textTheme.titleLarge,
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
        _Title('$title: ', counter: '${chosen.length} из $limit'),
        if (section == SkillSection.expertise)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Бонус мастерства удваивается для выбранных навыков',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 4,
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
