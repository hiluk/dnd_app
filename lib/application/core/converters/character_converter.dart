import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_application_1/application/character/models/character_model.dart';

class CharacterConverter extends TypeConverter<Character, String> {
  @override
  Character fromSql(String fromDb) {
    return Character.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Character value) {
    return json.encode(value.toJson());
  }
}
