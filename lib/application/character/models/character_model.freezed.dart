// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
mixin _$Character {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @CharacterRaceTypeConverter()
  Race get characterRace => throw _privateConstructorUsedError;
  @CharacterClassTypeConverter()
  Class get characterClass => throw _privateConstructorUsedError;
  GenerationMethod get generationMethod => throw _privateConstructorUsedError;

  /// Базовые характеристики (до бонусов расы)
  Attributes get baseStats => throw _privateConstructorUsedError;
  List<Ability> get bonusChoices => throw _privateConstructorUsedError;

  /// Итоговые и производные значения, посчитанные сервером
  CharacterSheet get sheet => throw _privateConstructorUsedError;

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call(
      {String name,
      String id,
      int level,
      @CharacterRaceTypeConverter() Race characterRace,
      @CharacterClassTypeConverter() Class characterClass,
      GenerationMethod generationMethod,
      Attributes baseStats,
      List<Ability> bonusChoices,
      CharacterSheet sheet});

  $RaceCopyWith<$Res> get characterRace;
  $ClassCopyWith<$Res> get characterClass;
  $AttributesCopyWith<$Res> get baseStats;
  $CharacterSheetCopyWith<$Res> get sheet;
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? level = null,
    Object? characterRace = null,
    Object? characterClass = null,
    Object? generationMethod = null,
    Object? baseStats = null,
    Object? bonusChoices = null,
    Object? sheet = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      characterRace: null == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race,
      characterClass: null == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class,
      generationMethod: null == generationMethod
          ? _value.generationMethod
          : generationMethod // ignore: cast_nullable_to_non_nullable
              as GenerationMethod,
      baseStats: null == baseStats
          ? _value.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
      bonusChoices: null == bonusChoices
          ? _value.bonusChoices
          : bonusChoices // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      sheet: null == sheet
          ? _value.sheet
          : sheet // ignore: cast_nullable_to_non_nullable
              as CharacterSheet,
    ) as $Val);
  }

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RaceCopyWith<$Res> get characterRace {
    return $RaceCopyWith<$Res>(_value.characterRace, (value) {
      return _then(_value.copyWith(characterRace: value) as $Val);
    });
  }

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassCopyWith<$Res> get characterClass {
    return $ClassCopyWith<$Res>(_value.characterClass, (value) {
      return _then(_value.copyWith(characterClass: value) as $Val);
    });
  }

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get baseStats {
    return $AttributesCopyWith<$Res>(_value.baseStats, (value) {
      return _then(_value.copyWith(baseStats: value) as $Val);
    });
  }

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterSheetCopyWith<$Res> get sheet {
    return $CharacterSheetCopyWith<$Res>(_value.sheet, (value) {
      return _then(_value.copyWith(sheet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterImplCopyWith(
          _$CharacterImpl value, $Res Function(_$CharacterImpl) then) =
      __$$CharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String id,
      int level,
      @CharacterRaceTypeConverter() Race characterRace,
      @CharacterClassTypeConverter() Class characterClass,
      GenerationMethod generationMethod,
      Attributes baseStats,
      List<Ability> bonusChoices,
      CharacterSheet sheet});

  @override
  $RaceCopyWith<$Res> get characterRace;
  @override
  $ClassCopyWith<$Res> get characterClass;
  @override
  $AttributesCopyWith<$Res> get baseStats;
  @override
  $CharacterSheetCopyWith<$Res> get sheet;
}

/// @nodoc
class __$$CharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterImpl>
    implements _$$CharacterImplCopyWith<$Res> {
  __$$CharacterImplCopyWithImpl(
      _$CharacterImpl _value, $Res Function(_$CharacterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? level = null,
    Object? characterRace = null,
    Object? characterClass = null,
    Object? generationMethod = null,
    Object? baseStats = null,
    Object? bonusChoices = null,
    Object? sheet = null,
  }) {
    return _then(_$CharacterImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      characterRace: null == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race,
      characterClass: null == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class,
      generationMethod: null == generationMethod
          ? _value.generationMethod
          : generationMethod // ignore: cast_nullable_to_non_nullable
              as GenerationMethod,
      baseStats: null == baseStats
          ? _value.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
      bonusChoices: null == bonusChoices
          ? _value._bonusChoices
          : bonusChoices // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      sheet: null == sheet
          ? _value.sheet
          : sheet // ignore: cast_nullable_to_non_nullable
              as CharacterSheet,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  _$CharacterImpl(
      {required this.name,
      required this.id,
      required this.level,
      @CharacterRaceTypeConverter() required this.characterRace,
      @CharacterClassTypeConverter() required this.characterClass,
      required this.generationMethod,
      required this.baseStats,
      final List<Ability> bonusChoices = const [],
      required this.sheet})
      : _bonusChoices = bonusChoices;

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final int level;
  @override
  @CharacterRaceTypeConverter()
  final Race characterRace;
  @override
  @CharacterClassTypeConverter()
  final Class characterClass;
  @override
  final GenerationMethod generationMethod;

  /// Базовые характеристики (до бонусов расы)
  @override
  final Attributes baseStats;
  final List<Ability> _bonusChoices;
  @override
  @JsonKey()
  List<Ability> get bonusChoices {
    if (_bonusChoices is EqualUnmodifiableListView) return _bonusChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusChoices);
  }

  /// Итоговые и производные значения, посчитанные сервером
  @override
  final CharacterSheet sheet;

  @override
  String toString() {
    return 'Character(name: $name, id: $id, level: $level, characterRace: $characterRace, characterClass: $characterClass, generationMethod: $generationMethod, baseStats: $baseStats, bonusChoices: $bonusChoices, sheet: $sheet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.characterRace, characterRace) ||
                other.characterRace == characterRace) &&
            (identical(other.characterClass, characterClass) ||
                other.characterClass == characterClass) &&
            (identical(other.generationMethod, generationMethod) ||
                other.generationMethod == generationMethod) &&
            (identical(other.baseStats, baseStats) ||
                other.baseStats == baseStats) &&
            const DeepCollectionEquality()
                .equals(other._bonusChoices, _bonusChoices) &&
            (identical(other.sheet, sheet) || other.sheet == sheet));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      id,
      level,
      characterRace,
      characterClass,
      generationMethod,
      baseStats,
      const DeepCollectionEquality().hash(_bonusChoices),
      sheet);

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      __$$CharacterImplCopyWithImpl<_$CharacterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterImplToJson(
      this,
    );
  }
}

abstract class _Character implements Character {
  factory _Character(
      {required final String name,
      required final String id,
      required final int level,
      @CharacterRaceTypeConverter() required final Race characterRace,
      @CharacterClassTypeConverter() required final Class characterClass,
      required final GenerationMethod generationMethod,
      required final Attributes baseStats,
      final List<Ability> bonusChoices,
      required final CharacterSheet sheet}) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  int get level;
  @override
  @CharacterRaceTypeConverter()
  Race get characterRace;
  @override
  @CharacterClassTypeConverter()
  Class get characterClass;
  @override
  GenerationMethod get generationMethod;

  /// Базовые характеристики (до бонусов расы)
  @override
  Attributes get baseStats;
  @override
  List<Ability> get bonusChoices;

  /// Итоговые и производные значения, посчитанные сервером
  @override
  CharacterSheet get sheet;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
