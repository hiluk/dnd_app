import 'package:dnd_app/application/character/presentation/widgets/character_hero.dart';
import 'package:dnd_app/application/character/presentation/widgets/sheet_view.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
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

  void _create() {
    FocusManager.instance.primaryFocus?.unfocus();
    context
        .read<CharacterCreationBloc>()
        .add(CharacterCreationBlocEventCreate(name.trim()));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterCreationBloc>().state;
    final theme = Theme.of(context);
    final canCreate = name.trim().isNotEmpty && state.sheet != null;
    final className = state.characterClass?.name ?? '';

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        CharacterHero(
          name: name.trim().isEmpty ? 'Новый герой' : name.trim(),
          subtitle: '${state.characterRace?.name}, ${className.toLowerCase()}',
          details: [
            if (state.background != null)
              'Предыстория: ${state.background!.name.toLowerCase()}',
            '1 уровень',
          ].join('. '),
          art: CharacterClassType.artByName(className),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: 'Имя персонажа',
          hint: 'Например, Торгрим',
          textInputAction: TextInputAction.done,
          onChanged: (value) => setState(() => name = value),
          onSubmitted: (_) => canCreate ? _create() : null,
        ),
        const SizedBox(height: 20),
        if (state.isPreviewLoading && state.sheet == null)
          const Center(child: CircularProgressIndicator())
        else if (state.previewError != null)
          Text(
            state.previewError!,
            style: TextStyle(color: theme.colorScheme.error),
          )
        else if (state.sheet != null)
          SheetView(sheet: state.sheet!),
        const SizedBox(height: 24),
        CustomButton(
          onTap: canCreate ? _create : null,
          title: 'Создать персонажа',
          isLoading: state.isLoading,
        ),
      ],
    );
  }
}
