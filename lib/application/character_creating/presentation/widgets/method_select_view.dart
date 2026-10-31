import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/api/abilities/ability.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора способа генерации характеристик
class MethodSelectView extends StatelessWidget {
  const MethodSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        for (final method in GenerationMethod.values)
          Card(
            child: ListTile(
              key: ValueKey(method),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(method.title, style: const TextStyle(fontSize: 22)),
              subtitle: Text(method.description, style: DndTheme.readableText),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.read<AssignmentCubit>().start(method);
                context.read<CharacterCreationBloc>().add(
                    CharacterCreationBlocEventSelect(generationMethod: method));
              },
            ),
          ),
      ],
    );
  }
}
