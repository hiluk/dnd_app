// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability_roll.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbilityRoll _$AbilityRollFromJson(Map<String, dynamic> json) {
  return _AbilityRoll.fromJson(json);
}

/// @nodoc
mixin _$AbilityRoll {
  List<int> get values => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  /// Serializes this AbilityRoll to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbilityRoll
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbilityRollCopyWith<AbilityRoll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityRollCopyWith<$Res> {
  factory $AbilityRollCopyWith(
          AbilityRoll value, $Res Function(AbilityRoll) then) =
      _$AbilityRollCopyWithImpl<$Res, AbilityRoll>;
  @useResult
  $Res call({List<int> values, String token});
}

/// @nodoc
class _$AbilityRollCopyWithImpl<$Res, $Val extends AbilityRoll>
    implements $AbilityRollCopyWith<$Res> {
  _$AbilityRollCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbilityRoll
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int>,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbilityRollImplCopyWith<$Res>
    implements $AbilityRollCopyWith<$Res> {
  factory _$$AbilityRollImplCopyWith(
          _$AbilityRollImpl value, $Res Function(_$AbilityRollImpl) then) =
      __$$AbilityRollImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> values, String token});
}

/// @nodoc
class __$$AbilityRollImplCopyWithImpl<$Res>
    extends _$AbilityRollCopyWithImpl<$Res, _$AbilityRollImpl>
    implements _$$AbilityRollImplCopyWith<$Res> {
  __$$AbilityRollImplCopyWithImpl(
      _$AbilityRollImpl _value, $Res Function(_$AbilityRollImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbilityRoll
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? token = null,
  }) {
    return _then(_$AbilityRollImpl(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int>,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbilityRollImpl implements _AbilityRoll {
  const _$AbilityRollImpl(
      {required final List<int> values, required this.token})
      : _values = values;

  factory _$AbilityRollImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbilityRollImplFromJson(json);

  final List<int> _values;
  @override
  List<int> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final String token;

  @override
  String toString() {
    return 'AbilityRoll(values: $values, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbilityRollImpl &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_values), token);

  /// Create a copy of AbilityRoll
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbilityRollImplCopyWith<_$AbilityRollImpl> get copyWith =>
      __$$AbilityRollImplCopyWithImpl<_$AbilityRollImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbilityRollImplToJson(
      this,
    );
  }
}

abstract class _AbilityRoll implements AbilityRoll {
  const factory _AbilityRoll(
      {required final List<int> values,
      required final String token}) = _$AbilityRollImpl;

  factory _AbilityRoll.fromJson(Map<String, dynamic> json) =
      _$AbilityRollImpl.fromJson;

  @override
  List<int> get values;
  @override
  String get token;

  /// Create a copy of AbilityRoll
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbilityRollImplCopyWith<_$AbilityRollImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
