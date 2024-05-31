// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CharactersTableTable extends CharactersTable
    with TableInfo<$CharactersTableTable, CharactersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterMeta =
      const VerificationMeta('character');
  @override
  late final GeneratedColumnWithTypeConverter<Character?, String> character =
      GeneratedColumn<String>('character', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Character?>(
              $CharactersTableTable.$convertercharactern);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [character, id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CharactersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_characterMeta, const VerificationResult.success());
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharactersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharactersTableData(
      character: $CharactersTableTable.$convertercharactern.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}character'])),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CharactersTableTable createAlias(String alias) {
    return $CharactersTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Character, String> $convertercharacter =
      CharacterConverter();
  static TypeConverter<Character?, String?> $convertercharactern =
      NullAwareTypeConverter.wrap($convertercharacter);
}

class CharactersTableData extends DataClass
    implements Insertable<CharactersTableData> {
  final Character? character;
  final int id;
  final String name;
  const CharactersTableData(
      {this.character, required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || character != null) {
      map['character'] = Variable<String>(
          $CharactersTableTable.$convertercharactern.toSql(character));
    }
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CharactersTableCompanion toCompanion(bool nullToAbsent) {
    return CharactersTableCompanion(
      character: character == null && nullToAbsent
          ? const Value.absent()
          : Value(character),
      id: Value(id),
      name: Value(name),
    );
  }

  factory CharactersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharactersTableData(
      character: serializer.fromJson<Character?>(json['character']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'character': serializer.toJson<Character?>(character),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CharactersTableData copyWith(
          {Value<Character?> character = const Value.absent(),
          int? id,
          String? name}) =>
      CharactersTableData(
        character: character.present ? character.value : this.character,
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CharactersTableData(')
          ..write('character: $character, ')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(character, id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharactersTableData &&
          other.character == this.character &&
          other.id == this.id &&
          other.name == this.name);
}

class CharactersTableCompanion extends UpdateCompanion<CharactersTableData> {
  final Value<Character?> character;
  final Value<int> id;
  final Value<String> name;
  const CharactersTableCompanion({
    this.character = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CharactersTableCompanion.insert({
    this.character = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<CharactersTableData> custom({
    Expression<String>? character,
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (character != null) 'character': character,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CharactersTableCompanion copyWith(
      {Value<Character?>? character, Value<int>? id, Value<String>? name}) {
    return CharactersTableCompanion(
      character: character ?? this.character,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (character.present) {
      map['character'] = Variable<String>(
          $CharactersTableTable.$convertercharactern.toSql(character.value));
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersTableCompanion(')
          ..write('character: $character, ')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $CharactersTableTable charactersTable =
      $CharactersTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [charactersTable];
}

typedef $$CharactersTableTableInsertCompanionBuilder = CharactersTableCompanion
    Function({
  Value<Character?> character,
  Value<int> id,
  required String name,
});
typedef $$CharactersTableTableUpdateCompanionBuilder = CharactersTableCompanion
    Function({
  Value<Character?> character,
  Value<int> id,
  Value<String> name,
});

class $$CharactersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CharactersTableTable,
    CharactersTableData,
    $$CharactersTableTableFilterComposer,
    $$CharactersTableTableOrderingComposer,
    $$CharactersTableTableProcessedTableManager,
    $$CharactersTableTableInsertCompanionBuilder,
    $$CharactersTableTableUpdateCompanionBuilder> {
  $$CharactersTableTableTableManager(
      _$AppDatabase db, $CharactersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CharactersTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CharactersTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CharactersTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<Character?> character = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              CharactersTableCompanion(
            character: character,
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<Character?> character = const Value.absent(),
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              CharactersTableCompanion.insert(
            character: character,
            id: id,
            name: name,
          ),
        ));
}

class $$CharactersTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $CharactersTableTable,
    CharactersTableData,
    $$CharactersTableTableFilterComposer,
    $$CharactersTableTableOrderingComposer,
    $$CharactersTableTableProcessedTableManager,
    $$CharactersTableTableInsertCompanionBuilder,
    $$CharactersTableTableUpdateCompanionBuilder> {
  $$CharactersTableTableProcessedTableManager(super.$state);
}

class $$CharactersTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CharactersTableTable> {
  $$CharactersTableTableFilterComposer(super.$state);
  ColumnWithTypeConverterFilters<Character?, Character, String> get character =>
      $state.composableBuilder(
          column: $state.table.character,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CharactersTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CharactersTableTable> {
  $$CharactersTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get character => $state.composableBuilder(
      column: $state.table.character,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$CharactersTableTableTableManager get charactersTable =>
      $$CharactersTableTableTableManager(_db, _db.charactersTable);
}
