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
  int get level => throw _privateConstructorUsedError;
  @CharacterRaceTypeConverter()
  Race get characterRace => throw _privateConstructorUsedError;
  @CharacterClassTypeConverter()
  Class get characterClass => throw _privateConstructorUsedError;
  Attributes get characterStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      int level,
      @CharacterRaceTypeConverter() Race characterRace,
      @CharacterClassTypeConverter() Class characterClass,
      Attributes characterStats});

  $RaceCopyWith<$Res> get characterRace;
  $ClassCopyWith<$Res> get characterClass;
  $AttributesCopyWith<$Res> get characterStats;
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? characterRace = null,
    Object? characterClass = null,
    Object? characterStats = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      characterStats: null == characterStats
          ? _value.characterStats
          : characterStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RaceCopyWith<$Res> get characterRace {
    return $RaceCopyWith<$Res>(_value.characterRace, (value) {
      return _then(_value.copyWith(characterRace: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassCopyWith<$Res> get characterClass {
    return $ClassCopyWith<$Res>(_value.characterClass, (value) {
      return _then(_value.copyWith(characterClass: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get characterStats {
    return $AttributesCopyWith<$Res>(_value.characterStats, (value) {
      return _then(_value.copyWith(characterStats: value) as $Val);
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
      int level,
      @CharacterRaceTypeConverter() Race characterRace,
      @CharacterClassTypeConverter() Class characterClass,
      Attributes characterStats});

  @override
  $RaceCopyWith<$Res> get characterRace;
  @override
  $ClassCopyWith<$Res> get characterClass;
  @override
  $AttributesCopyWith<$Res> get characterStats;
}

/// @nodoc
class __$$CharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterImpl>
    implements _$$CharacterImplCopyWith<$Res> {
  __$$CharacterImplCopyWithImpl(
      _$CharacterImpl _value, $Res Function(_$CharacterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? characterRace = null,
    Object? characterClass = null,
    Object? characterStats = null,
  }) {
    return _then(_$CharacterImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      characterStats: null == characterStats
          ? _value.characterStats
          : characterStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  _$CharacterImpl(
      {required this.name,
      required this.level,
      @CharacterRaceTypeConverter() required this.characterRace,
      @CharacterClassTypeConverter() required this.characterClass,
      required this.characterStats});

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  @override
  final String name;
  @override
  final int level;
  @override
  @CharacterRaceTypeConverter()
  final Race characterRace;
  @override
  @CharacterClassTypeConverter()
  final Class characterClass;
  @override
  final Attributes characterStats;

  @override
  String toString() {
    return 'Character(name: $name, level: $level, characterRace: $characterRace, characterClass: $characterClass, characterStats: $characterStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.characterRace, characterRace) ||
                other.characterRace == characterRace) &&
            (identical(other.characterClass, characterClass) ||
                other.characterClass == characterClass) &&
            (identical(other.characterStats, characterStats) ||
                other.characterStats == characterStats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, level, characterRace, characterClass, characterStats);

  @JsonKey(ignore: true)
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
      required final int level,
      @CharacterRaceTypeConverter() required final Race characterRace,
      @CharacterClassTypeConverter() required final Class characterClass,
      required final Attributes characterStats}) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  @override
  String get name;
  @override
  int get level;
  @override
  @CharacterRaceTypeConverter()
  Race get characterRace;
  @override
  @CharacterClassTypeConverter()
  Class get characterClass;
  @override
  Attributes get characterStats;
  @override
  @JsonKey(ignore: true)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
