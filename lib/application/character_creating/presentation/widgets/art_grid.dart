import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/material.dart';

/// Элемент сетки выбора: картинка, название и короткая подпись
class ArtGridItem {
  final String title;
  final String subtitle;
  final CardArt art;
  final bool selected;
  final VoidCallback onTap;

  const ArtGridItem({
    required this.title,
    required this.subtitle,
    required this.art,
    required this.selected,
    required this.onTap,
  });
}

/// Сетка карточек в две колонки для выбора расы и класса
class ArtGrid extends StatelessWidget {
  final List<ArtGridItem> items;

  const ArtGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return FigureCard(
          key: ValueKey(item.title),
          art: item.art,
          selected: item.selected,
          rise: 0.14,
          radius: 16,
          plaqueHeight: 70,
          semanticLabel: '${item.title}. ${item.subtitle}',
          onTap: item.onTap,
          plaque: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: DndTheme.display(p.ink, size: 19),
              ),
              const SizedBox(height: 3),
              Text(
                item.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: p.muted),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Шторка с подробностями о расе, классе или предыстории
/// и кнопкой выбора
Future<void> showDetailsSheet(
  BuildContext context, {
  required String title,
  CardArt? art,
  required List<Widget> children,
  required String actionTitle,
  required VoidCallback onAction,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      final p = DndPalette.of(context);

      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        maxChildSize: 0.95,
        minChildSize: 0.4,
        builder: (context, controller) => Column(
          children: [
            Expanded(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: DndTheme.display(p.ink, size: 30),
                        ),
                      ),
                      if (art != null)
                        SizedBox(
                          width: 96,
                          height: 112,
                          child: art.isFigure
                              ? ArtImage(art)
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: ArtImage(art),
                                ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...children,
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: p.line)),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onAction();
                    },
                    child: Text(actionTitle),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

/// Абзац описания в шторке
class SheetParagraph extends StatelessWidget {
  final String text;

  const SheetParagraph(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
