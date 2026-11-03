// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssignmentState {
  GenerationMethod? get method => throw _privateConstructorUsedError;

  /// Значения, которые распределяются (стандартный набор или броски)
  List<int> get pool => throw _privateConstructorUsedError;

  /// Характеристика → индекс значения в [pool]
  Map<Ability, int> get assigned => throw _privateConstructorUsedError;

  /// Значения при покупке очков
  Map<Ability, int> get points => throw _privateConstructorUsedError;
  String? get rollToken => throw _privateConstructorUsedError;
  bool get isRolling => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssignmentStateCopyWith<AssignmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentStateCopyWith<$Res> {
  factory $AssignmentStateCopyWith(
          AssignmentState value, $Res Function(AssignmentState) then) =
      _$AssignmentStateCopyWithImpl<$Res, AssignmentState>;
  @useResult
  $Res call(
      {GenerationMethod? method,
      List<int> pool,
      Map<Ability, int> assigned,
      Map<Ability, int> points,
      String? rollToken,
      bool isRolling,
      String? error});
}

/// @nodoc
class _$AssignmentStateCopyWithImpl<$Res, $Val extends AssignmentState>
    implements $AssignmentStateCopyWith<$Res> {
  _$AssignmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = freezed,
    Object? pool = null,
    Object? assigned = null,
    Object? points = null,
    Object? rollToken = freezed,
    Object? isRolling = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as GenerationMethod?,
      pool: null == pool
          ? _value.pool
          : pool // ignore: cast_nullable_to_non_nullable
              as List<int>,
      assigned: null == assigned
          ? _value.assigned
          : assigned // ignore: cast_nullable_to_non_nullable
              as Map<Ability, int>,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as Map<Ability, int>,
      rollToken: freezed == rollToken
          ? _value.rollToken
          : rollToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isRolling: null == isRolling
          ? _value.isRolling
          : isRolling // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentStateImplCopyWith<$Res>
    implements $AssignmentStateCopyWith<$Res> {
  factory _$$AssignmentStateImplCopyWith(_$AssignmentStateImpl value,
          $Res Function(_$AssignmentStateImpl) then) =
      __$$AssignmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenerationMethod? method,
      List<int> pool,
      Map<Ability, int> assigned,
      Map<Ability, int> points,
      String? rollToken,
      bool isRolling,
      String? error});
}

/// @nodoc
class __$$AssignmentStateImplCopyWithImpl<$Res>
    extends _$AssignmentStateCopyWithImpl<$Res, _$AssignmentStateImpl>
    implements _$$AssignmentStateImplCopyWith<$Res> {
  __$$AssignmentStateImplCopyWithImpl(
      _$AssignmentStateImpl _value, $Res Function(_$AssignmentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = freezed,
    Object? pool = null,
    Object? assigned = null,
    Object? points = null,
    Object? rollToken = freezed,
    Object? isRolling = null,
    Object? error = freezed,
  }) {
    return _then(_$AssignmentStateImpl(
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as GenerationMethod?,
      pool: null == pool
          ? _value._pool
          : pool // ignore: cast_nullable_to_non_nullable
              as List<int>,
      assigned: null == assigned
          ? _value._assigned
          : assigned // ignore: cast_nullable_to_non_nullable
              as Map<Ability, int>,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as Map<Ability, int>,
      rollToken: freezed == rollToken
          ? _value.rollToken
          : rollToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isRolling: null == isRolling
          ? _value.isRolling
          : isRolling // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AssignmentStateImpl extends _AssignmentState {
  const _$AssignmentStateImpl(
      {this.method,
      final List<int> pool = const [],
      final Map<Ability, int> assigned = const {},
      final Map<Ability, int> points = const {},
      this.rollToken,
      this.isRolling = false,
      this.error})
      : _pool = pool,
        _assigned = assigned,
        _points = points,
        super._();

  @override
  final GenerationMethod? method;

  /// Значения, которые распределяются (стандартный набор или броски)
  final List<int> _pool;

  /// Значения, которые распределяются (стандартный набор или броски)
  @override
  @JsonKey()
  List<int> get pool {
    if (_pool is EqualUnmodifiableListView) return _pool;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pool);
  }

  /// Характеристика → индекс значения в [pool]
  final Map<Ability, int> _assigned;

  /// Характеристика → индекс значения в [pool]
  @override
  @JsonKey()
  Map<Ability, int> get assigned {
    if (_assigned is EqualUnmodifiableMapView) return _assigned;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_assigned);
  }

  /// Значения при покупке очков
  final Map<Ability, int> _points;

  /// Значения при покупке очков
  @override
  @JsonKey()
  Map<Ability, int> get points {
    if (_points is EqualUnmodifiableMapView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_points);
  }

  @override
  final String? rollToken;
  @override
  @JsonKey()
  final bool isRolling;
  @override
  final String? error;

  @override
  String toString() {
    return 'AssignmentState(method: $method, pool: $pool, assigned: $assigned, points: $points, rollToken: $rollToken, isRolling: $isRolling, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentStateImpl &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other._pool, _pool) &&
            const DeepCollectionEquality().equals(other._assigned, _assigned) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.rollToken, rollToken) ||
                other.rollToken == rollToken) &&
            (identical(other.isRolling, isRolling) ||
                other.isRolling == isRolling) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      method,
      const DeepCollectionEquality().hash(_pool),
      const DeepCollectionEquality().hash(_assigned),
      const DeepCollectionEquality().hash(_points),
      rollToken,
      isRolling,
      error);

  /// Create a copy of AssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentStateImplCopyWith<_$AssignmentStateImpl> get copyWith =>
      __$$AssignmentStateImplCopyWithImpl<_$AssignmentStateImpl>(
          this, _$identity);
}

abstract class _AssignmentState extends AssignmentState {
  const factory _AssignmentState(
      {final GenerationMethod? method,
      final List<int> pool,
      final Map<Ability, int> assigned,
      final Map<Ability, int> points,
      final String? rollToken,
      final bool isRolling,
      final String? error}) = _$AssignmentStateImpl;
  const _AssignmentState._() : super._();

  @override
  GenerationMethod? get method;

  /// Значения, которые распределяются (стандартный набор или броски)
  @override
  List<int> get pool;

  /// Характеристика → индекс значения в [pool]
  @override
  Map<Ability, int> get assigned;

  /// Значения при покупке очков
  @override
  Map<Ability, int> get points;
  @override
  String? get rollToken;
  @override
  bool get isRolling;
  @override
  String? get error;

  /// Create a copy of AssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignmentStateImplCopyWith<_$AssignmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
