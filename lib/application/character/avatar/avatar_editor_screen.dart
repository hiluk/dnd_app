import 'dart:typed_data';

import 'package:dnd_app/application/character/avatar/image_transparency.dart';
import 'package:dnd_app/application/character/models/character_avatar.dart';
import 'package:dnd_app/application/character/models/character_model.dart';
import 'package:dnd_app/application/character/presentation/widgets/character_card.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/material.dart';

/// Что редактируем: только что выбранную картинку или уже загруженную
sealed class AvatarSource {
  final Uint8List bytes;

  const AvatarSource(this.bytes);

  const factory AvatarSource.newImage(Uint8List bytes, {required String fileName}) =
      NewAvatarImage;

  const factory AvatarSource.existing(CharacterAvatar avatar, Uint8List bytes) =
      ExistingAvatar;
}

/// Картинка выбрана на устройстве и ещё не загружена
class NewAvatarImage extends AvatarSource {
  final String fileName;

  const NewAvatarImage(super.bytes, {required this.fileName});
}

/// Картинка уже на сервере, меняются только вид и кадр
class ExistingAvatar extends AvatarSource {
  final CharacterAvatar avatar;

  const ExistingAvatar(this.avatar, Uint8List bytes) : super(bytes);
}

/// Редактор своей картинки: живое превью карточки, кадр пальцами,
/// вид «в рамке» или «фигура». Пока не нажата «Сохранить», сервер не меняется.
/// Возвращает true, если картинка сохранена.
class AvatarEditorScreen extends StatefulWidget {
  final Character character;
  final AvatarSource source;

  const AvatarEditorScreen({
    super.key,
    required this.character,
    required this.source,
  });

  @override
  State<AvatarEditorScreen> createState() => _AvatarEditorScreenState();
}

class _AvatarEditorScreenState extends State<AvatarEditorScreen> {
  late AvatarLayout _layout;

  /// null — ещё проверяем прозрачность
  bool? _hasTransparency;
  String? _error;
  bool _saving = false;

  // Начало жеста: кадр и масштаб в момент касания
  AvatarLayout? _gestureStart;

  @override
  void initState() {
    super.initState();
    final source = widget.source;
    switch (source) {
      case ExistingAvatar(:final avatar):
        _layout = avatar.layout;
        _hasTransparency = avatar.hasTransparency;
      case NewAvatarImage(:final bytes):
        _layout = const AvatarLayout();
        if (bytes.length > maxAvatarBytes) {
          _hasTransparency = false;
          _error = 'Файл больше 5 МБ. Выберите картинку поменьше';
        } else {
          _checkTransparency(bytes);
        }
    }
  }

  Future<void> _checkTransparency(Uint8List bytes) async {
    try {
      final transparent = await hasTransparentBorder(bytes);
      if (!mounted) return;
      setState(() {
        _hasTransparency = transparent;
        // Прозрачную картинку сразу показываем фигурой — ради этого её и выбирают
        if (transparent) _layout = _layout.copyWith(mode: AvatarMode.figure);
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _hasTransparency = false;
        _error = 'Не удалось прочитать картинку. Подходят JPEG, PNG и WebP';
      });
    }
  }

  CardArt get _art => CardArt.memory(
        widget.source.bytes,
        isFigure: _layout.mode == AvatarMode.figure,
        alignment: Alignment(_layout.offsetX, _layout.offsetY),
        scale: _layout.scale,
      );

  void _onScaleStart(ScaleStartDetails details) => _gestureStart = _layout;

  /// Перетаскивание сдвигает кадр, щипок увеличивает. Сдвиг считается
  /// в долях Alignment: от -1 (край) до 1 (другой край)
  void _onScaleUpdate(ScaleUpdateDetails details, Size frame) {
    final start = _gestureStart;
    if (start == null || _layout.mode == AvatarMode.figure) return;

    final scale = (start.scale * details.scale)
        .clamp(AvatarLayout.minScale, AvatarLayout.maxScale);
    final dx = details.focalPointDelta.dx / (frame.width / 2) / scale;
    final dy = details.focalPointDelta.dy / (frame.height / 2) / scale;

    setState(() {
      _layout = _layout.copyWith(
        scale: scale,
        offsetX: (_layout.offsetX - dx).clamp(-1.0, 1.0),
        offsetY: (_layout.offsetY - dy).clamp(-1.0, 1.0),
      );
    });
  }

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    final repository = di.get<CharactersRepository>();
    final id = widget.character.id;

    try {
      var layout = _layout;
      switch (widget.source) {
        case NewAvatarImage(:final bytes, :final fileName):
          final uploaded =
              await repository.uploadAvatar(id, bytes, fileName: fileName);
          // Решение сервера о прозрачности главное
          if (!uploaded.hasTransparency && layout.mode == AvatarMode.figure) {
            layout = layout.copyWith(mode: AvatarMode.frame);
          }
          if (layout != uploaded.layout) {
            await repository.updateAvatar(id, layout);
          }
        case ExistingAvatar(:final avatar):
          // Файл не менялся, адрес тот же — картинка остаётся в кэше
          if (layout != avatar.layout) {
            await repository.updateAvatar(id, layout);
          }
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = apiErrorMessage(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final character = widget.character;
    final checking = _hasTransparency == null;
    final canFigure = _hasTransparency == true;
    final isFigure = _layout.mode == AvatarMode.figure;

    return Scaffold(
      appBar: AppBar(title: const Text('Своё изображение')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            // Превью — та же карточка, что в карусели
            Center(
              child: SizedBox(
                width: 270,
                height: 440,
                child: LayoutBuilder(builder: (context, constraints) {
                  // Область кадра — над табличкой
                  final frame = Size(
                    constraints.maxWidth,
                    constraints.maxHeight * (1 - 0.2) - 100,
                  );

                  return GestureDetector(
                    onScaleStart: _onScaleStart,
                    onScaleUpdate: (details) => _onScaleUpdate(details, frame),
                    child: FigureCard(
                      art: _art,
                      plaqueHeight: 100,
                      rise: 0.2,
                      semanticLabel: 'Превью карточки персонажа',
                      plaque: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  character.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: DndTheme.display(p.ink, size: 26),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${character.characterRace.name}, '
                                  '${character.characterClass.name.toLowerCase()}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15, color: p.muted),
                                ),
                              ],
                            ),
                          ),
                          LevelSeal(level: character.level, size: 46),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
            SegmentedButton<AvatarMode>(
              showSelectedIcon: false,
              segments: [
                const ButtonSegment(
                  value: AvatarMode.frame,
                  label: Text('В рамке'),
                ),
                ButtonSegment(
                  value: AvatarMode.figure,
                  label: const Text('Фигура'),
                  enabled: canFigure,
                ),
              ],
              selected: {_layout.mode},
              onSelectionChanged: _saving
                  ? null
                  : (selection) => setState(
                        () => _layout = _layout.copyWith(mode: selection.first),
                      ),
            ),
            const SizedBox(height: 10),
            Text(
              checking
                  ? 'Проверяем фон картинки…'
                  : isFigure
                      ? 'Фон прозрачный, поэтому фигура может выходить из рамки.'
                      : canFigure
                          ? 'Перетащите и сведите пальцы, чтобы выбрать кадр.'
                          : 'Перетащите и сведите пальцы, чтобы выбрать кадр. '
                              '«Фигура» доступна для PNG с прозрачным фоном.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: 24),
            CustomButton(
              title: 'Сохранить',
              isLoading: _saving,
              onTap: checking ||
                      (widget.source is NewAvatarImage &&
                          widget.source.bytes.length > maxAvatarBytes)
                  ? null
                  : _save,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: _saving ? null : () => Navigator.of(context).pop(false),
              child: const Text('Выбрать другое'),
            ),
          ],
        ),
      ),
    );
  }
}
