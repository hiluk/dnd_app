import 'package:drift/drift.dart';
import 'package:flutter_application_1/application/core/converters/character_converter.dart';

class CharactersTable extends Table {
  TextColumn get character => text().map(CharacterConverter()).nullable()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

