import 'package:dnd_app/application/character/presentation/widgets/sheet_view.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Итоговый шаг: лист персонажа, посчитанный сервером, и выбор имени
class CharacterCreatingPreview extends StatefulWidget {
  const CharacterCreatingPreview({super.key});

  @override
  State<CharacterCreatingPreview> createState() =>
      _CharacterCreatingPreviewState();
}

class _CharacterCreatingPreviewState extends State<CharacterCreatingPreview> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterCreationBloc>().state;
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Text(
          '${state.characterRace?.name}   ${state.characterClass?.name}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28),
        ),
        Text(
          '${state.generationMethod?.title} · 1 уровень',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        if (state.isPreviewLoading && state.sheet == null)
          const Center(child: CircularProgressIndicator())
        else if (state.previewError != null)
          Text(state.previewError!,
              style: TextStyle(color: theme.colorScheme.error))
        else if (state.sheet != null)
          SheetView(sheet: state.sheet!),
        const SizedBox(height: 20),
        const Text(
          'Выберите имя для вашего персонажа',
          style: TextStyle(fontSize: 19),
        ),
        CustomTextField(onChanged: (value) => setState(() => name = value)),
        const SizedBox(height: 20),
        Center(
          child: CustomButton(
            onTap: name.trim().isEmpty || state.sheet == null
                ? null
                : () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    context
                        .read<CharacterCreationBloc>()
                        .add(CharacterCreationBlocEventCreate(name));
                  },
            title: 'Создать',
            isLoading: state.isLoading,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
