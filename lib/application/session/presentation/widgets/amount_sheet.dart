import 'package:dnd_app/application/session/rules/dice.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:flutter/material.dart';

/// Итог ввода: число и критический удар
typedef AmountInput = ({int amount, bool critical});

/// Шторка ввода урона, лечения или временных хитов: своя клавиатура
/// и кубики. Кубик добавляет выпавшее к числу, расклад виден под ним.
/// До подтверждения [preview] показывает, что изменится.
Future<AmountInput?> showAmountSheet(
  BuildContext context, {
  required String title,
  required String Function(int amount) actionTitle,
  required String? Function(int amount, bool critical) preview,
  bool allowCritical = false,
  Dice? dice,
}) {
  return showModalBottomSheet<AmountInput>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _AmountSheet(
      title: title,
      actionTitle: actionTitle,
      preview: preview,
      allowCritical: allowCritical,
      dice: dice ?? Dice(),
    ),
  );
}

class _AmountSheet extends StatefulWidget {
  final String title;
  final String Function(int amount) actionTitle;
  final String? Function(int amount, bool critical) preview;
  final bool allowCritical;
  final Dice dice;

  const _AmountSheet({
    required this.title,
    required this.actionTitle,
    required this.preview,
    required this.allowCritical,
    required this.dice,
  });

  @override
  State<_AmountSheet> createState() => _AmountSheetState();
}

class _AmountSheetState extends State<_AmountSheet> {
  static const _maxDigits = 4;

  /// Набранное число без кубиков
  String _typed = '';

  /// Выпавшие кубики: грань и значение
  final _rolls = <(int faces, int value)>[];
  bool _critical = false;

  int get _amount =>
      (int.tryParse(_typed) ?? 0) + _rolls.fold(0, (sum, r) => sum + r.$2);

  String get _breakdown {
    if (_rolls.isEmpty) return '';
    final parts = [
      for (final (faces, value) in _rolls) '$value (к$faces)',
      if (_typed.isNotEmpty) _typed,
    ];
    return parts.join(' + ');
  }

  void _key(String key) => setState(() {
        if (key == '⌫') {
          if (_typed.isNotEmpty) {
            _typed = _typed.substring(0, _typed.length - 1);
          } else if (_rolls.isNotEmpty) {
            _rolls.removeLast();
          }
        } else if (key == 'C') {
          _typed = '';
          _rolls.clear();
        } else if (_typed.length < _maxDigits &&
            !(_typed.isEmpty && key == '0')) {
          _typed += key;
        }
      });

  void _roll(int faces) =>
      setState(() => _rolls.add((faces, widget.dice.roll(faces))));

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);
    final amount = _amount;
    final preview = amount > 0 ? widget.preview(amount, _critical) : null;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.title, style: DndTheme.display(p.ink, size: 26)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: p.line)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '$amount',
                  semanticsLabel: 'Значение $amount',
                  style:
                      DndTheme.display(amount > 0 ? p.ink : p.muted, size: 52)
                          .copyWith(height: 1),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _breakdown,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15, color: p.muted),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              for (final faces in const [4, 6, 8, 10, 12, 20]) ...[
                if (faces != 4) const SizedBox(width: 6),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _roll(faces),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 44),
                    ),
                    child: Text('к$faces', semanticsLabel: 'Бросить к$faces'),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.6,
            children: [
              for (final key in const [
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                'C',
                '0',
                '⌫'
              ])
                Material(
                  color: p.raised,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: p.line),
                  ),
                  child: InkWell(
                    onTap: () => _key(key),
                    borderRadius: BorderRadius.circular(12),
                    child: Center(
                      child: key == '⌫'
                          ? Icon(Icons.backspace_outlined,
                              color: p.ink, semanticLabel: 'Стереть')
                          : Text(
                              key,
                              semanticsLabel: key == 'C' ? 'Очистить' : key,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: p.ink,
                              ),
                            ),
                    ),
                  ),
                ),
            ],
          ),
          if (widget.allowCritical) ...[
            const SizedBox(height: 6),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _critical,
              activeColor: p.gold,
              onChanged: (value) => setState(() => _critical = value),
              title: const Text('Критический удар'),
              subtitle: const Text('По лежащему — два провала спасброска'),
            ),
          ],
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: Text(
              preview ?? '',
              style: TextStyle(fontSize: 15, color: p.muted),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style:
                      OutlinedButton.styleFrom(minimumSize: const Size(0, 54)),
                  child: const Text('Отмена'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  title: widget.actionTitle(amount),
                  onTap: amount > 0
                      ? () => Navigator.pop(
                            context,
                            (amount: amount, critical: _critical),
                          )
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
