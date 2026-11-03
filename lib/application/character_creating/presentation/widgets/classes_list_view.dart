import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/art_grid.dart';
import 'package:dnd_app/application/character_creating/presentation/widgets/bloc_listener_fab.dart';
import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/api/classes/models/class_model.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/ui_kit/widgets/info_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Шаг выбора класса: сетка карточек, по нажатию — подробности
class ClassesListView extends StatelessWidget {
  const ClassesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = di.get<CatalogRepository>().classes;
    final selected = context.watch<ClassCubit>().state;

    return ArtGrid(
      items: [
        for (final characterClass in classes)
          ArtGridItem(
            title: characterClass.name,
            subtitle: 'Кость хитов ${characterClass.hitDice}',
            art: CharacterClassType.artByName(characterClass.name),
            selected: characterClass == selected,
            onTap: () {
              context.read<ClassCubit>().selectClass(characterClass);
              _showDetails(context, characterClass);
            },
          ),
      ],
    );
  }

  void _showDetails(BuildContext context, Class characterClass) {
    showDetailsSheet(
      context,
      title: characterClass.name,
      art: CharacterClassType.artByName(characterClass.name),
      actionTitle: 'Выбрать: ${characterClass.name}',
      onAction: () => advanceCreation(
        context,
        CharacterCreationBlocEventSelect(characterClass: characterClass),
      ),
      children: [
        SheetParagraph(characterClass.description),
        InfoLine('Кость хитов', characterClass.hitDice),
        InfoLine('Хиты на 1 уровне', characterClass.hpAt1stLevel),
        InfoLine('Хиты на следующих уровнях', characterClass.hpAtHigherLevels),
        InfoLine(
          'Заклинательная характеристика',
          characterClass.spellCastingAbility,
        ),
        InfoLine('Спасброски', characterClass.profSavingThrows),
        InfoLine('Доспехи', characterClass.profArmor),
        InfoLine('Оружие', characterClass.profWeapon),
        InfoLine('Инструменты', characterClass.profTool),
        InfoLine('Навыки', characterClass.profSkills),
        InfoLine('Снаряжение', characterClass.equipment),
      ],
    );
  }
}
