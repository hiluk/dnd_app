import 'package:dnd_app/application/character/avatar/avatar_cache.dart';
import 'package:dnd_app/application/character/avatar/avatar_editor_screen.dart';
import 'package:dnd_app/application/character/avatar/character_art.dart';
import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_bloc.dart';
import 'package:dnd_app/application/character/bloc/current_character/current_character_event.dart';
import 'package:dnd_app/application/character/models/character_avatar.dart';
import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/core/api/classes/enums/character_class_type.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/choice_tile.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

/// Шторка «Изображение персонажа»: стандартная картинка, своя,
/// выбор из галереи, фото и возврат к стандартной
Future<void> showAvatarSheet(BuildContext context, Character character) {
  // Блоки экрана персонажа: после изменений обновляем и лист, и список
  final current = context.read<CurrentCharacterBloc>();
  final all = context.read<CharactersBloc>();

  void refresh() {
    current.add(CurrentCharacterBlocEventRefresh());
    all.add(const CharactersRefresh());
  }

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (sheetContext) => _AvatarSheet(
      character: character,
      onChanged: refresh,
    ),
  );
}

class _AvatarSheet extends StatefulWidget {
  final Character character;
  final VoidCallback onChanged;

  const _AvatarSheet({required this.character, required this.onChanged});

  @override
  State<_AvatarSheet> createState() => _AvatarSheetState();
}

class _AvatarSheetState extends State<_AvatarSheet> {
  bool _busy = false;

  Character get character => widget.character;

  Future<void> _pick(ImageSource source) async {
    final file = await ImagePicker().pickImage(
      source: source,
      requestFullMetadata: false,
      // Фото с камеры прозрачности не содержит, его можно сразу уменьшить.
      // Из галереи берём файл как есть, чтобы не потерять прозрачный фон
      maxWidth: source == ImageSource.camera ? 2048 : null,
      maxHeight: source == ImageSource.camera ? 2048 : null,
      imageQuality: source == ImageSource.camera ? 90 : null,
    );
    if (file == null || !mounted) return;

    final bytes = await file.readAsBytes();
    if (!mounted) return;
    await _openEditor(AvatarSource.newImage(bytes, fileName: file.name));
  }

  Future<void> _openEditor(AvatarSource source) async {
    final navigator = Navigator.of(context);
    final saved = await navigator.push<bool>(
      MaterialPageRoute(
        builder: (_) => AvatarEditorScreen(character: character, source: source),
      ),
    );
    if (saved == true && mounted) {
      widget.onChanged();
      navigator.pop();
    }
  }

  Future<void> _editCurrent(CharacterAvatar avatar) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final bytes = await di.get<AvatarCache>().load(avatar.url);
      if (!mounted) return;
      await _openEditor(AvatarSource.existing(avatar, bytes));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(apiErrorMessage(e))));
    }
  }

  Future<void> _reset() async {
    setState(() => _busy = true);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    try {
      await di.get<CharactersRepository>().deleteAvatar(character.id);
      widget.onChanged();
      navigator.pop();
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(apiErrorMessage(e))));
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final avatar = character.avatar;
    final classArt =
        CharacterClassType.artByName(character.characterClass.name);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Изображение персонажа',
              style: DndTheme.display(p.ink, size: 24),
            ),
            const SizedBox(height: 14),
            ChoiceTile(
              title: 'Стандартное',
              subtitle: 'Картинка класса «${character.characterClass.name}»',
              selected: avatar == null,
              trailing: _Thumb(art: classArt),
              onTap: avatar == null || _busy ? null : _reset,
            ),
            if (avatar != null) ...[
              const SizedBox(height: 10),
              CharacterArt(
                character: character,
                builder: (context, art) => ChoiceTile(
                  title: 'Своё изображение',
                  subtitle: avatar.mode == AvatarMode.figure
                      ? 'Фигура выходит из рамки. Нажмите, чтобы изменить'
                      : 'В рамке. Нажмите, чтобы изменить кадр',
                  selected: true,
                  trailing: _Thumb(art: art),
                  onTap: _busy ? null : () => _editCurrent(avatar),
                ),
              ),
            ],
            const SizedBox(height: 10),
            _Action(
              icon: Icons.photo_library_outlined,
              title: 'Выбрать из галереи',
              onTap: _busy ? null : () => _pick(ImageSource.gallery),
            ),
            // В браузере камера открывается тем же выбором файла
            if (!kIsWeb) ...[
              const SizedBox(height: 10),
              _Action(
                icon: Icons.photo_camera_outlined,
                title: 'Сделать фото',
                onTap: _busy ? null : () => _pick(ImageSource.camera),
              ),
            ],
            if (avatar != null) ...[
              const SizedBox(height: 10),
              _Action(
                icon: Icons.restart_alt,
                title: 'Вернуть стандартное',
                onTap: _busy ? null : _reset,
              ),
            ],
            const SizedBox(height: 12),
            Text(
              'JPEG, PNG или WebP до 5 МБ. Картинку с прозрачным фоном '
              'можно показать фигурой, которая выходит из рамки.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const _Action({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return ChoiceTile(
      title: title,
      onTap: onTap,
      trailing: Icon(Icons.chevron_right, color: p.muted),
      leading: Icon(icon, color: p.gold),
    );
  }
}

/// Миниатюра картинки в строке выбора
class _Thumb extends StatelessWidget {
  final CardArt art;

  const _Thumb({required this.art});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Container(
      width: 46,
      height: 58,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: p.raised,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ArtImage(art),
    );
  }
}
