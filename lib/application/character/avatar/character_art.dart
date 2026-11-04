import 'dart:typed_data';

import 'package:dnd_app/application/character/avatar/avatar_cache.dart';
import 'package:dnd_app/application/character/models/character_avatar.dart';
import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/material.dart';

extension CharacterAvatarArt on CharacterAvatar {
  /// Картинка для карточки. Фигурой — только если фон прозрачный
  CardArt toArt(Uint8List bytes) => CardArt.memory(
        bytes,
        isFigure: mode == AvatarMode.figure && hasTransparency,
        alignment: Alignment(offsetX, offsetY),
        scale: scale,
      );
}

/// Картинка персонажа: своя, если загружена, иначе картинка класса.
/// Пока своя картинка скачивается или если скачать не удалось,
/// показывается картинка класса.
class CharacterArt extends StatelessWidget {
  final Character character;
  final Widget Function(BuildContext context, CardArt art) builder;

  const CharacterArt({
    super.key,
    required this.character,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final fallback =
        CharacterClassType.artByName(character.characterClass.name);
    final avatar = character.avatar;
    if (avatar == null) return builder(context, fallback);

    return FutureBuilder<Uint8List>(
      future: di.get<AvatarCache>().load(avatar.url),
      builder: (context, snapshot) {
        final bytes = snapshot.data;
        final art = bytes == null || bytes.isEmpty || snapshot.hasError
            ? fallback
            : avatar.toArt(bytes);

        return builder(context, art);
      },
    );
  }
}
