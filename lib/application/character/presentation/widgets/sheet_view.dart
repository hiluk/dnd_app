import 'package:dnd_app/application/character/models/character_sheet.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';

/// Лист персонажа: основные показатели, характеристики со спасбросками
/// и навыки. Значения считает сервер.
class SheetView extends StatelessWidget {
  final CharacterSheet sheet;

  const SheetView({super.key, required this.sheet});

  @override
  Widget build(BuildContext context) {
    final skills = [...sheet.skills]
      ..sort((a, b) => a.skill.title.compareTo(b.skill.title));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            _Vital('Хиты', '${sheet.hitPoints}', large: true),
            const SizedBox(width: 10),
            _Vital('Класс доспеха', '${sheet.armorClass}', large: true),
            const SizedBox(width: 10),
            _Vital('Инициатива', formatBonus(sheet.initiative), large: true),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _Vital('Скорость', '${sheet.speed} фт.'),
            const SizedBox(width: 10),
            _Vital('Мастерство', formatBonus(sheet.proficiencyBonus)),
            const SizedBox(width: 10),
            _Vital('Пасс. внимание', '${sheet.passivePerception}'),
          ],
        ),
        const _SectionTitle('Характеристики'),
        LayoutBuilder(builder: (context, constraints) {
          const gap = 10.0;
          final width = (constraints.maxWidth - gap * 2) / 3;

          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              for (final ability in Ability.values)
                SizedBox(
                  width: width,
                  child: _AbilityTile(
                    ability: ability,
                    score: sheet.stats.valueOf(ability),
                    modifier: sheet.modifiers.valueOf(ability),
                    save: sheet.savingThrows
                        .firstWhere((s) => s.ability == ability),
                  ),
                ),
            ],
          );
        }),
        if (skills.isNotEmpty) ...[
          const _SectionTitle('Навыки'),
          DecoratedBox(
            decoration: BoxDecoration(
              color: DndPalette.of(context).surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: DndPalette.of(context).line),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  for (final skill in skills) _SkillRow(skill: skill),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 12),
        const _Legend(),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 12, left: 2),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

/// Показатель: число и подпись под ним
class _Vital extends StatelessWidget {
  final String label;
  final String value;
  final bool large;

  const _Vital(this.label, this.value, {this.large = false});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: large ? 14 : 10),
        decoration: BoxDecoration(
          color: large ? p.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: p.line),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: large ? 30 : 20,
                height: 1.1,
                fontWeight: FontWeight.w700,
                color: p.ink,
                fontFeatures: DndTheme.numbers,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: p.muted),
            ),
          ],
        ),
      ),
    );
  }
}

/// Характеристика: модификатор крупно, значение и спасбросок
class _AbilityTile extends StatelessWidget {
  final Ability ability;
  final int score;
  final int modifier;
  final SavingThrow save;

  const _AbilityTile({
    required this.ability,
    required this.score,
    required this.modifier,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Semantics(
      container: true,
      label: '${ability.title} $score, модификатор ${formatBonus(modifier)}, '
          'спасбросок ${formatBonus(save.bonus)}'
          '${save.proficient ? ', владение' : ''}',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
        decoration: BoxDecoration(
          color: p.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: p.line),
        ),
        child: Column(
          children: [
            Text(
              ability.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: p.muted),
            ),
            const SizedBox(height: 2),
            Text(
              formatBonus(modifier),
              style: TextStyle(
                fontSize: 30,
                height: 1.15,
                fontWeight: FontWeight.w700,
                color: p.ink,
                fontFeatures: DndTheme.numbers,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              decoration: BoxDecoration(
                color: p.raised,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$score',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: p.ink,
                  fontFeatures: DndTheme.numbers,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProficiencyMark(proficient: save.proficient),
                const SizedBox(width: 6),
                Text(
                  'спас ${formatBonus(save.bonus)}',
                  style: TextStyle(
                    fontSize: 13,
                    color: save.proficient ? p.ink : p.muted,
                    fontFeatures: DndTheme.numbers,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final SkillCheck skill;

  const _SkillRow({required this.skill});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 22,
            child: ProficiencyMark(
              proficient: skill.proficient,
              expertise: skill.expertise,
            ),
          ),
          Expanded(
            child: Text(
              skill.skill.title,
              style: TextStyle(
                fontSize: 16,
                color: skill.proficient ? p.ink : p.muted,
                fontWeight:
                    skill.proficient ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
          Text(
            skill.ability.short,
            style: TextStyle(fontSize: 13, color: p.muted),
          ),
          SizedBox(
            width: 44,
            child: Text(
              formatBonus(skill.bonus),
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: p.ink,
                fontWeight:
                    skill.proficient ? FontWeight.w700 : FontWeight.normal,
                fontFeatures: DndTheme.numbers,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Отметка владения: пустой круг, золотой круг или золотой ромб
/// для компетентности
class ProficiencyMark extends StatelessWidget {
  final bool proficient;
  final bool expertise;

  const ProficiencyMark({
    super.key,
    required this.proficient,
    this.expertise = false,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    if (expertise) {
      return Transform.rotate(
        angle: 0.785398,
        child: Container(width: 9, height: 9, color: p.gold),
      );
    }

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: proficient ? p.gold : null,
        border: proficient ? null : Border.all(color: p.muted, width: 1.2),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;

    Widget item(Widget mark, String text) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [mark, const SizedBox(width: 6), Text(text, style: style)],
        );

    return Wrap(
      spacing: 18,
      runSpacing: 6,
      children: [
        item(const ProficiencyMark(proficient: true), 'владение'),
        item(
          const ProficiencyMark(proficient: true, expertise: true),
          'компетентность',
        ),
      ],
    );
  }
}
