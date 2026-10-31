// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Asi _$AsiFromJson(Map<String, dynamic> json) {
  return _Asi.fromJson(json);
}

/// @nodoc
mixin _$Asi {
  String get stat => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Характеристика; null — бонус на выбор игрока
  Ability? get ability => throw _privateConstructorUsedError;

  /// Сколько разных характеристик выбирается для бонуса на выбор
  int get choices => throw _privateConstructorUsedError;

  /// Serializes this Asi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Asi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AsiCopyWith<Asi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsiCopyWith<$Res> {
  factory $AsiCopyWith(Asi value, $Res Function(Asi) then) =
      _$AsiCopyWithImpl<$Res, Asi>;
  @useResult
  $Res call({String stat, int value, Ability? ability, int choices});
}

/// @nodoc
class _$AsiCopyWithImpl<$Res, $Val extends Asi> implements $AsiCopyWith<$Res> {
  _$AsiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Asi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stat = null,
    Object? value = null,
    Object? ability = freezed,
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      ability: freezed == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability?,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AsiImplCopyWith<$Res> implements $AsiCopyWith<$Res> {
  factory _$$AsiImplCopyWith(_$AsiImpl value, $Res Function(_$AsiImpl) then) =
      __$$AsiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String stat, int value, Ability? ability, int choices});
}

/// @nodoc
class __$$AsiImplCopyWithImpl<$Res> extends _$AsiCopyWithImpl<$Res, _$AsiImpl>
    implements _$$AsiImplCopyWith<$Res> {
  __$$AsiImplCopyWithImpl(_$AsiImpl _value, $Res Function(_$AsiImpl) _then)
      : super(_value, _then);

  /// Create a copy of Asi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stat = null,
    Object? value = null,
    Object? ability = freezed,
    Object? choices = null,
  }) {
    return _then(_$AsiImpl(
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      ability: freezed == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability?,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AsiImpl implements _Asi {
  _$AsiImpl(
      {required this.stat,
      required this.value,
      this.ability,
      this.choices = 1});

  factory _$AsiImpl.fromJson(Map<String, dynamic> json) =>
      _$$AsiImplFromJson(json);

  @override
  final String stat;
  @override
  final int value;

  /// Характеристика; null — бонус на выбор игрока
  @override
  final Ability? ability;

  /// Сколько разных характеристик выбирается для бонуса на выбор
  @override
  @JsonKey()
  final int choices;

  @override
  String toString() {
    return 'Asi(stat: $stat, value: $value, ability: $ability, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsiImpl &&
            (identical(other.stat, stat) || other.stat == stat) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.choices, choices) || other.choices == choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stat, value, ability, choices);

  /// Create a copy of Asi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsiImplCopyWith<_$AsiImpl> get copyWith =>
      __$$AsiImplCopyWithImpl<_$AsiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AsiImplToJson(
      this,
    );
  }
}

abstract class _Asi implements Asi {
  factory _Asi(
      {required final String stat,
      required final int value,
      final Ability? ability,
      final int choices}) = _$AsiImpl;

  factory _Asi.fromJson(Map<String, dynamic> json) = _$AsiImpl.fromJson;

  @override
  String get stat;
  @override
  int get value;

  /// Характеристика; null — бонус на выбор игрока
  @override
  Ability? get ability;

  /// Сколько разных характеристик выбирается для бонуса на выбор
  @override
  int get choices;

  /// Create a copy of Asi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsiImplCopyWith<_$AsiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
