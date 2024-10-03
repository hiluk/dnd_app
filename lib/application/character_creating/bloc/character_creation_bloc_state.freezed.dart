// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_creation_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CharacterCreationBlocState {
  String get characterName => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCreated => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  CharacterCreationBlocState? get previousState =>
      throw _privateConstructorUsedError;
  Attributes? get characterAttributes => throw _privateConstructorUsedError;
  Race? get characterRace => throw _privateConstructorUsedError;
  Class? get characterClass => throw _privateConstructorUsedError;

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterCreationBlocStateCopyWith<CharacterCreationBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCreationBlocStateCopyWith<$Res> {
  factory $CharacterCreationBlocStateCopyWith(CharacterCreationBlocState value,
          $Res Function(CharacterCreationBlocState) then) =
      _$CharacterCreationBlocStateCopyWithImpl<$Res,
          CharacterCreationBlocState>;
  @useResult
  $Res call(
      {String characterName,
      bool isLoading,
      bool isCreated,
      bool isError,
      CharacterCreationBlocState? previousState,
      Attributes? characterAttributes,
      Race? characterRace,
      Class? characterClass});

  $CharacterCreationBlocStateCopyWith<$Res>? get previousState;
  $AttributesCopyWith<$Res>? get characterAttributes;
  $RaceCopyWith<$Res>? get characterRace;
  $ClassCopyWith<$Res>? get characterClass;
}

/// @nodoc
class _$CharacterCreationBlocStateCopyWithImpl<$Res,
        $Val extends CharacterCreationBlocState>
    implements $CharacterCreationBlocStateCopyWith<$Res> {
  _$CharacterCreationBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = null,
    Object? isLoading = null,
    Object? isCreated = null,
    Object? isError = null,
    Object? previousState = freezed,
    Object? characterAttributes = freezed,
    Object? characterRace = freezed,
    Object? characterClass = freezed,
  }) {
    return _then(_value.copyWith(
      characterName: null == characterName
          ? _value.characterName
          : characterName // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreated: null == isCreated
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CharacterCreationBlocState?,
      characterAttributes: freezed == characterAttributes
          ? _value.characterAttributes
          : characterAttributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
      characterRace: freezed == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race?,
      characterClass: freezed == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class?,
    ) as $Val);
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCreationBlocStateCopyWith<$Res>? get previousState {
    if (_value.previousState == null) {
      return null;
    }

    return $CharacterCreationBlocStateCopyWith<$Res>(_value.previousState!,
        (value) {
      return _then(_value.copyWith(previousState: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res>? get characterAttributes {
    if (_value.characterAttributes == null) {
      return null;
    }

    return $AttributesCopyWith<$Res>(_value.characterAttributes!, (value) {
      return _then(_value.copyWith(characterAttributes: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
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

  /// Create a copy of CharacterCreationBlocState
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
}

/// @nodoc
abstract class _$$CharacterCreationBlocStateImplCopyWith<$Res>
    implements $CharacterCreationBlocStateCopyWith<$Res> {
  factory _$$CharacterCreationBlocStateImplCopyWith(
          _$CharacterCreationBlocStateImpl value,
          $Res Function(_$CharacterCreationBlocStateImpl) then) =
      __$$CharacterCreationBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String characterName,
      bool isLoading,
      bool isCreated,
      bool isError,
      CharacterCreationBlocState? previousState,
      Attributes? characterAttributes,
      Race? characterRace,
      Class? characterClass});

  @override
  $CharacterCreationBlocStateCopyWith<$Res>? get previousState;
  @override
  $AttributesCopyWith<$Res>? get characterAttributes;
  @override
  $RaceCopyWith<$Res>? get characterRace;
  @override
  $ClassCopyWith<$Res>? get characterClass;
}

/// @nodoc
class __$$CharacterCreationBlocStateImplCopyWithImpl<$Res>
    extends _$CharacterCreationBlocStateCopyWithImpl<$Res,
        _$CharacterCreationBlocStateImpl>
    implements _$$CharacterCreationBlocStateImplCopyWith<$Res> {
  __$$CharacterCreationBlocStateImplCopyWithImpl(
      _$CharacterCreationBlocStateImpl _value,
      $Res Function(_$CharacterCreationBlocStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = null,
    Object? isLoading = null,
    Object? isCreated = null,
    Object? isError = null,
    Object? previousState = freezed,
    Object? characterAttributes = freezed,
    Object? characterRace = freezed,
    Object? characterClass = freezed,
  }) {
    return _then(_$CharacterCreationBlocStateImpl(
      characterName: null == characterName
          ? _value.characterName
          : characterName // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreated: null == isCreated
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CharacterCreationBlocState?,
      characterAttributes: freezed == characterAttributes
          ? _value.characterAttributes
          : characterAttributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
      characterRace: freezed == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race?,
      characterClass: freezed == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class?,
    ));
  }
}

/// @nodoc

class _$CharacterCreationBlocStateImpl implements _CharacterCreationBlocState {
  _$CharacterCreationBlocStateImpl(
      {this.characterName = '',
      this.isLoading = false,
      this.isCreated = false,
      this.isError = false,
      this.previousState,
      this.characterAttributes,
      this.characterRace,
      this.characterClass});

  @override
  @JsonKey()
  final String characterName;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCreated;
  @override
  @JsonKey()
  final bool isError;
  @override
  final CharacterCreationBlocState? previousState;
  @override
  final Attributes? characterAttributes;
  @override
  final Race? characterRace;
  @override
  final Class? characterClass;

  @override
  String toString() {
    return 'CharacterCreationBlocState(characterName: $characterName, isLoading: $isLoading, isCreated: $isCreated, isError: $isError, previousState: $previousState, characterAttributes: $characterAttributes, characterRace: $characterRace, characterClass: $characterClass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterCreationBlocStateImpl &&
            (identical(other.characterName, characterName) ||
                other.characterName == characterName) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCreated, isCreated) ||
                other.isCreated == isCreated) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState) &&
            (identical(other.characterAttributes, characterAttributes) ||
                other.characterAttributes == characterAttributes) &&
            (identical(other.characterRace, characterRace) ||
                other.characterRace == characterRace) &&
            (identical(other.characterClass, characterClass) ||
                other.characterClass == characterClass));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      characterName,
      isLoading,
      isCreated,
      isError,
      previousState,
      characterAttributes,
      characterRace,
      characterClass);

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterCreationBlocStateImplCopyWith<_$CharacterCreationBlocStateImpl>
      get copyWith => __$$CharacterCreationBlocStateImplCopyWithImpl<
          _$CharacterCreationBlocStateImpl>(this, _$identity);
}

abstract class _CharacterCreationBlocState
    implements CharacterCreationBlocState {
  factory _CharacterCreationBlocState(
      {final String characterName,
      final bool isLoading,
      final bool isCreated,
      final bool isError,
      final CharacterCreationBlocState? previousState,
      final Attributes? characterAttributes,
      final Race? characterRace,
      final Class? characterClass}) = _$CharacterCreationBlocStateImpl;

  @override
  String get characterName;
  @override
  bool get isLoading;
  @override
  bool get isCreated;
  @override
  bool get isError;
  @override
  CharacterCreationBlocState? get previousState;
  @override
  Attributes? get characterAttributes;
  @override
  Race? get characterRace;
  @override
  Class? get characterClass;

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterCreationBlocStateImplCopyWith<_$CharacterCreationBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
