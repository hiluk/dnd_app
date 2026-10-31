import 'package:dnd_app/application/character/models/character_sheet.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';

/// Лист персонажа: характеристики с модификаторами, производные значения
/// и спасброски. Значения считает сервер.
class SheetView extends StatelessWidget {
  final CharacterSheet sheet;

  const SheetView({super.key, required this.sheet});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: DndTheme.readableText.copyWith(fontSize: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _Badge('Хиты', '${sheet.hitPoints}'),
              _Badge('Класс доспеха', '${sheet.armorClass}'),
              _Badge('Инициатива', formatBonus(sheet.initiative)),
              _Badge('Скорость', '${sheet.speed} фт.'),
              _Badge('Мастерство', formatBonus(sheet.proficiencyBonus)),
            ],
          ),
          const SizedBox(height: 16),
          for (final ability in Ability.values)
            _AbilityRow(
              ability: ability,
              score: sheet.stats.valueOf(ability),
              modifier: sheet.modifiers.valueOf(ability),
              save: sheet.savingThrows.firstWhere((s) => s.ability == ability),
            ),
          const SizedBox(height: 4),
          Text(
            '● — владение спасброском',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final String value;

  const _Badge(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 104,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _AbilityRow extends StatelessWidget {
  final Ability ability;
  final int score;
  final int modifier;
  final SavingThrow save;

  const _AbilityRow({
    required this.ability,
    required this.score,
    required this.modifier,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(child: Text(ability.title)),
          SizedBox(
            width: 80,
            child: Text(
              '$score (${formatBonus(modifier)})',
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 92,
            child: Text(
              '${save.proficient ? '●' : '○'} спас ${formatBonus(save.bonus)}',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
