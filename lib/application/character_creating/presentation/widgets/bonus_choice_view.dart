import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора характеристик для бонусов расы «на выбор» (например, у полуэльфа)
class BonusChoiceView extends StatelessWidget {
  const BonusChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    final creation = context.watch<CharacterCreationBloc>().state;
    final max = creation.requiredBonusChoices;
    final fixed = creation.fixedBonusAbilities;

    return BlocConsumer<BonusChoiceCubit, List<Ability>>(
      listener: (context, choices) {
        final draft = creation.draft(bonusChoices: choices);
        if (choices.length == max && draft != null) {
          context
              .read<CharacterCreationBloc>()
              .add(CharacterCreationBlocEventPreview(draft));
        }
      },
      builder: (context, choices) {
        final sheet = choices.length == max ? creation.sheet : null;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              '${creation.characterRace!.name}: выберите $max разные '
              'характеристики для увеличения на 1',
              textAlign: TextAlign.center,
              style: DndTheme.readableText.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            for (final ability in Ability.values)
              CheckboxListTile(
                title:
                    Text(ability.title, style: const TextStyle(fontSize: 20)),
                subtitle: fixed.contains(ability)
                    ? const Text('Уже увеличена расой',
                        style: DndTheme.readableText)
                    : null,
                secondary: sheet == null
                    ? null
                    : Text(
                        '${sheet.stats.valueOf(ability)} '
                        '(${formatBonus(sheet.modifiers.valueOf(ability))})',
                        style: DndTheme.readableText,
                      ),
                value: choices.contains(ability),
                onChanged: fixed.contains(ability) ||
                        (!choices.contains(ability) && choices.length >= max)
                    ? null
                    : (_) => context
                        .read<BonusChoiceCubit>()
                        .toggle(ability, max: max),
              ),
            const SizedBox(height: 80),
          ],
        );
      },
    );
  }
}
