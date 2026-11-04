import 'dart:convert';
import 'dart:io';

import 'package:dnd_app/application/session/models/session_action.dart';
import 'package:dnd_app/application/session/models/session_models.dart';
import 'package:dnd_app/application/session/rules/session_rules.dart';
import 'package:flutter_test/flutter_test.dart';

/// Правила сессии по общему набору примеров. Тот же файл проверяет сервер
/// (docs/session-rules-cases.json в dnd_api), поэтому правила совпадают.
void main() {
  final cases = (jsonDecode(
    File('test/fixtures/session-rules-cases.json').readAsStringSync(),
  )['cases'] as List)
      .cast<Map<String, dynamic>>();

  SessionState state(Map<String, dynamic> json) => SessionState.fromJson(json);

  for (final data in cases) {
    test(data['name'], () {
      final context = SessionContext.fromJson(data['context']);
      final before = state(data['state']);

      if (data['error'] case final String field) {
        expect(
          () => SessionRules.apply(
            context,
            before,
            SessionAction.fromJson(data['action']),
          ),
          throwsA(isA<SessionRulesException>()
              .having((e) => e.field, 'поле', field)),
        );
        return;
      }

      final action = SessionAction.fromJson(data['action']);
      final result = SessionRules.apply(context, before, action);
      final expected = data['expect'] as Map<String, dynamic>;

      expect(result.state, state(expected['state']));
      expect(
        result.outcomes.map((o) => o.name).toList(),
        (expected['outcomes'] as List).cast<String>(),
      );
      expect(result.healed, expected['healed']);
      expect(result.absorbed, expected['absorbed']);
    });
  }

  test('Примеры покрывают все действия', () {
    final types = cases.map((c) => c['action']['type'] as String).toSet();
    expect(types, {
      'damage',
      'heal',
      'tempHp',
      'setHp',
      'deathSave',
      'stabilize',
      'spendHitDie',
      'longRest',
      'setCondition',
      'setExhaustion',
    });
  });
}
