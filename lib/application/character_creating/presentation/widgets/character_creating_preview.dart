import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/models/character_dto.dart';
import 'package:flutter_application_1/application/character_creating/presentation/widgets/stats_widget.dart';
import 'package:flutter_application_1/core/api/classes/enums/character_class_type.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/custom_button.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_kit/widgets/avatar_box.dart';

class CharacterCreatingPreview extends StatefulWidget {
  const CharacterCreatingPreview({
    super.key,
  });

  @override
  State<CharacterCreatingPreview> createState() =>
      _CharacterCreatingPreviewState();
}

class _CharacterCreatingPreviewState extends State<CharacterCreatingPreview> {
  late String characterName;
  late CharacterCreationBloc creationBloc;
  late CharacterDto dto;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<CharacterCreationBloc>().state.isLoading;

    return Stack(
      children: [
        Positioned.fill(
          child: LimitedBox(
            maxHeight: 100,
            child: Opacity(
              opacity: 0.5,
              child: CharacterAvatar(
                assetPath: CharacterClassType.getAssetByName(
                  dto.characterClass?.name,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        dto.characterRace?.name ?? '',
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        dto.characterClass?.name ?? '',
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  StatsWidget(stats: dto.characterStats),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Выберите имя для вашего персонажа',
                        style: TextStyle(fontSize: 19),
                      ),
                      CustomTextField(
                        autoFocus: true,
                        onChanged: (value) => setState(() {
                          dto = dto.copyWith(name: value);
                        }),
                      ),
                    ],
                  ),
                  CustomButton(
                    onTap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      creationBloc.add(CharacterCreationBlocEventCreate(dto));
                    },
                    title: 'Создать',
                    isLoading: isLoading,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    creationBloc = BlocProvider.of<CharacterCreationBloc>(context);
    dto = CharacterDto(
      characterStats: creationBloc.state.characterAttributes!,
      characterClass: creationBloc.state.characterClass,
      characterRace: creationBloc.state.characterRace,
      level: 1,
    );
  }
}
