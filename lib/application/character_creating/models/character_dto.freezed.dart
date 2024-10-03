// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) {
  return _CharacterDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterDto {
  String get name => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @CharacterRaceTypeConverter()
  Race? get characterRace => throw _privateConstructorUsedError;
  @CharacterClassTypeConverter()
  Class? get characterClass => throw _privateConstructorUsedError;
  Attributes get characterStats => throw _privateConstructorUsedError;

  /// Serializes this CharacterDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterDtoCopyWith<CharacterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDtoCopyWith<$Res> {
  factory $CharacterDtoCopyWith(
          CharacterDto value, $Res Function(CharacterDto) then) =
      _$CharacterDtoCopyWithImpl<$Res, CharacterDto>;
  @useResult
  $Res call(
      {String name,
      int level,
      @CharacterRaceTypeConverter() Race? characterRace,
      @CharacterClassTypeConverter() Class? characterClass,
      Attributes characterStats});

  $RaceCopyWith<$Res>? get characterRace;
  $ClassCopyWith<$Res>? get characterClass;
  $AttributesCopyWith<$Res> get characterStats;
}

/// @nodoc
class _$CharacterDtoCopyWithImpl<$Res, $Val extends CharacterDto>
    implements $CharacterDtoCopyWith<$Res> {
  _$CharacterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? characterRace = freezed,
    Object? characterClass = freezed,
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
      characterRace: freezed == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race?,
      characterClass: freezed == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class?,
      characterStats: null == characterStats
          ? _value.characterStats
          : characterStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
    ) as $Val);
  }

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RaceCopyWith<$Res>? get characterRace {
    if (_value.characterRace == null) {
      return null;
    }

    return $RaceCopyWith<$Res>(_value.characterRace!, (value) {
      return _then(_value.copyWith(characterRace: value) as $Val);
    });
  }

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassCopyWith<$Res>? get characterClass {
    if (_value.characterClass == null) {
      return null;
    }

    return $ClassCopyWith<$Res>(_value.characterClass!, (value) {
      return _then(_value.copyWith(characterClass: value) as $Val);
    });
  }

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get characterStats {
    return $AttributesCopyWith<$Res>(_value.characterStats, (value) {
      return _then(_value.copyWith(characterStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterDtoImplCopyWith<$Res>
    implements $CharacterDtoCopyWith<$Res> {
  factory _$$CharacterDtoImplCopyWith(
          _$CharacterDtoImpl value, $Res Function(_$CharacterDtoImpl) then) =
      __$$CharacterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int level,
      @CharacterRaceTypeConverter() Race? characterRace,
      @CharacterClassTypeConverter() Class? characterClass,
      Attributes characterStats});

  @override
  $RaceCopyWith<$Res>? get characterRace;
  @override
  $ClassCopyWith<$Res>? get characterClass;
  @override
  $AttributesCopyWith<$Res> get characterStats;
}

/// @nodoc
class __$$CharacterDtoImplCopyWithImpl<$Res>
    extends _$CharacterDtoCopyWithImpl<$Res, _$CharacterDtoImpl>
    implements _$$CharacterDtoImplCopyWith<$Res> {
  __$$CharacterDtoImplCopyWithImpl(
      _$CharacterDtoImpl _value, $Res Function(_$CharacterDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? characterRace = freezed,
    Object? characterClass = freezed,
    Object? characterStats = null,
  }) {
    return _then(_$CharacterDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      characterRace: freezed == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race?,
      characterClass: freezed == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class?,
      characterStats: null == characterStats
          ? _value.characterStats
          : characterStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterDtoImpl implements _CharacterDto {
  _$CharacterDtoImpl(
      {this.name = "",
      this.level = 1,
      @CharacterRaceTypeConverter() this.characterRace,
      @CharacterClassTypeConverter() this.characterClass,
      required this.characterStats});

  factory _$CharacterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterDtoImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int level;
  @override
  @CharacterRaceTypeConverter()
  final Race? characterRace;
  @override
  @CharacterClassTypeConverter()
  final Class? characterClass;
  @override
  final Attributes characterStats;

  @override
  String toString() {
    return 'CharacterDto(name: $name, level: $level, characterRace: $characterRace, characterClass: $characterClass, characterStats: $characterStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.characterRace, characterRace) ||
                other.characterRace == characterRace) &&
            (identical(other.characterClass, characterClass) ||
                other.characterClass == characterClass) &&
            (identical(other.characterStats, characterStats) ||
                other.characterStats == characterStats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, level, characterRace, characterClass, characterStats);

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterDtoImplCopyWith<_$CharacterDtoImpl> get copyWith =>
      __$$CharacterDtoImplCopyWithImpl<_$CharacterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterDtoImplToJson(
      this,
    );
  }
}

abstract class _CharacterDto implements CharacterDto {
  factory _CharacterDto(
      {final String name,
      final int level,
      @CharacterRaceTypeConverter() final Race? characterRace,
      @CharacterClassTypeConverter() final Class? characterClass,
      required final Attributes characterStats}) = _$CharacterDtoImpl;

  factory _CharacterDto.fromJson(Map<String, dynamic> json) =
      _$CharacterDtoImpl.fromJson;

  @override
  String get name;
  @override
  int get level;
  @override
  @CharacterRaceTypeConverter()
  Race? get characterRace;
  @override
  @CharacterClassTypeConverter()
  Class? get characterClass;
  @override
  Attributes get characterStats;

  /// Create a copy of CharacterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterDtoImplCopyWith<_$CharacterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
