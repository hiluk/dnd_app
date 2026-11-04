import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/choice_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора способа генерации характеристик
class MethodSelectView extends StatelessWidget {
  const MethodSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      itemCount: GenerationMethod.values.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final method = GenerationMethod.values[index];

        return ChoiceTile(
          key: ValueKey(method),
          title: method.title,
          subtitle: method.description,
          titleStyle: DndTheme.display(p.ink, size: 22),
          trailing: Icon(Icons.chevron_right, color: p.muted),
          onTap: () {
            context.read<AssignmentCubit>().start(method);
            context.read<CharacterCreationBloc>().add(
                  CharacterCreationBlocEventSelect(generationMethod: method),
                );
          },
        );
      },
    );
  }
}
