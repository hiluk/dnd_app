import 'package:dnd_app/application/character_creating/bloc/background_cubit.dart';
import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/expandable_widget.dart';
import 'package:dnd_app/core/ui_kit/widgets/info_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора предыстории
class BackgroundsListView extends StatelessWidget {
  const BackgroundsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final backgrounds = di.get<CatalogRepository>().backgrounds;

    return ListView.builder(
      itemCount: backgrounds.length + 1,
      itemBuilder: (context, index) {
        // Место под кнопку «Выбрать»
        if (index == backgrounds.length) return const SizedBox(height: 80);

        final background = backgrounds[index];
        return BlocBuilder<BackgroundCubit, Background?>(
          builder: (context, selected) => ExpandableWidget(
            key: ValueKey(background.type),
            onToggle: () => context.read<BackgroundCubit>().select(background),
            isExpanded: selected == background,
            child: _BackgroundWidget(background: background),
          ),
        );
      },
    );
  }
}

class _BackgroundWidget extends StatelessWidget {
  final Background background;

  const _BackgroundWidget({required this.background});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isExpanded = constraints.biggest.height > 100;
      if (!isExpanded) {
        return Text(
          background.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        );
      }

      final skills = background.skillChoices > 0
          ? 'любые ${background.skillChoices} на выбор'
          : background.skills.map((s) => s.title).join(', ');

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DefaultTextStyle.merge(
          style: DndTheme.readableText,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    background.name,
                    style: const TextStyle(
                      fontFamily: DndTheme.decorativeFont,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(background.description),
                const SizedBox(height: 12),
                InfoLine('Навыки', skills),
                InfoLine('Инструменты', background.tools),
                InfoLine('Языки', background.languages),
                InfoLine('Снаряжение', background.equipment),
                InfoLine('Умение', background.feature),
              ],
            ),
          ),
        ),
      );
    });
  }
}
