import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/choice_tile.dart';
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
    final p = DndPalette.of(context);

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
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Text(
              '${creation.characterRace!.name}: выберите $max разные '
              'характеристики для увеличения на 1',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Выбрано ${choices.length} из $max',
              style: TextStyle(fontSize: 15, color: p.muted),
            ),
            const SizedBox(height: 14),
            for (final ability in Ability.values) ...[
              ChoiceTile(
                title: ability.title,
                subtitle: fixed.contains(ability) ? 'Уже увеличена расой' : null,
                showMark: true,
                selected: choices.contains(ability),
                trailing: sheet == null
                    ? null
                    : Text(
                        '${sheet.stats.valueOf(ability)} '
                        '(${formatBonus(sheet.modifiers.valueOf(ability))})',
                        style: TextStyle(
                          fontSize: 16,
                          color: p.ink,
                          fontFeatures: DndTheme.numbers,
                        ),
                      ),
                onTap: fixed.contains(ability) ||
                        (!choices.contains(ability) && choices.length >= max)
                    ? null
                    : () => context
                        .read<BonusChoiceCubit>()
                        .toggle(ability, max: max),
              ),
              const SizedBox(height: 8),
            ],
          ],
        );
      },
    );
  }
}
