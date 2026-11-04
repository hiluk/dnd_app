// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionState _$SessionStateFromJson(Map<String, dynamic> json) {
  return _SessionState.fromJson(json);
}

/// @nodoc
mixin _$SessionState {
  int get currentHp => throw _privateConstructorUsedError;
  int get tempHp => throw _privateConstructorUsedError;
  int get hitDiceSpent => throw _privateConstructorUsedError;
  int get deathSuccesses => throw _privateConstructorUsedError;
  int get deathFailures => throw _privateConstructorUsedError;
  bool get isStable => throw _privateConstructorUsedError;
  bool get isDead => throw _privateConstructorUsedError;
  List<Condition> get conditions => throw _privateConstructorUsedError;
  int get exhaustion => throw _privateConstructorUsedError;

  /// Serializes this SessionState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
  @useResult
  $Res call(
      {int currentHp,
      int tempHp,
      int hitDiceSpent,
      int deathSuccesses,
      int deathFailures,
      bool isStable,
      bool isDead,
      List<Condition> conditions,
      int exhaustion});
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentHp = null,
    Object? tempHp = null,
    Object? hitDiceSpent = null,
    Object? deathSuccesses = null,
    Object? deathFailures = null,
    Object? isStable = null,
    Object? isDead = null,
    Object? conditions = null,
    Object? exhaustion = null,
  }) {
    return _then(_value.copyWith(
      currentHp: null == currentHp
          ? _value.currentHp
          : currentHp // ignore: cast_nullable_to_non_nullable
              as int,
      tempHp: null == tempHp
          ? _value.tempHp
          : tempHp // ignore: cast_nullable_to_non_nullable
              as int,
      hitDiceSpent: null == hitDiceSpent
          ? _value.hitDiceSpent
          : hitDiceSpent // ignore: cast_nullable_to_non_nullable
              as int,
      deathSuccesses: null == deathSuccesses
          ? _value.deathSuccesses
          : deathSuccesses // ignore: cast_nullable_to_non_nullable
              as int,
      deathFailures: null == deathFailures
          ? _value.deathFailures
          : deathFailures // ignore: cast_nullable_to_non_nullable
              as int,
      isStable: null == isStable
          ? _value.isStable
          : isStable // ignore: cast_nullable_to_non_nullable
              as bool,
      isDead: null == isDead
          ? _value.isDead
          : isDead // ignore: cast_nullable_to_non_nullable
              as bool,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<Condition>,
      exhaustion: null == exhaustion
          ? _value.exhaustion
          : exhaustion // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionStateImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateImplCopyWith(
          _$SessionStateImpl value, $Res Function(_$SessionStateImpl) then) =
      __$$SessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentHp,
      int tempHp,
      int hitDiceSpent,
      int deathSuccesses,
      int deathFailures,
      bool isStable,
      bool isDead,
      List<Condition> conditions,
      int exhaustion});
}

/// @nodoc
class __$$SessionStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateImpl>
    implements _$$SessionStateImplCopyWith<$Res> {
  __$$SessionStateImplCopyWithImpl(
      _$SessionStateImpl _value, $Res Function(_$SessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentHp = null,
    Object? tempHp = null,
    Object? hitDiceSpent = null,
    Object? deathSuccesses = null,
    Object? deathFailures = null,
    Object? isStable = null,
    Object? isDead = null,
    Object? conditions = null,
    Object? exhaustion = null,
  }) {
    return _then(_$SessionStateImpl(
      currentHp: null == currentHp
          ? _value.currentHp
          : currentHp // ignore: cast_nullable_to_non_nullable
              as int,
      tempHp: null == tempHp
          ? _value.tempHp
          : tempHp // ignore: cast_nullable_to_non_nullable
              as int,
      hitDiceSpent: null == hitDiceSpent
          ? _value.hitDiceSpent
          : hitDiceSpent // ignore: cast_nullable_to_non_nullable
              as int,
      deathSuccesses: null == deathSuccesses
          ? _value.deathSuccesses
          : deathSuccesses // ignore: cast_nullable_to_non_nullable
              as int,
      deathFailures: null == deathFailures
          ? _value.deathFailures
          : deathFailures // ignore: cast_nullable_to_non_nullable
              as int,
      isStable: null == isStable
          ? _value.isStable
          : isStable // ignore: cast_nullable_to_non_nullable
              as bool,
      isDead: null == isDead
          ? _value.isDead
          : isDead // ignore: cast_nullable_to_non_nullable
              as bool,
      conditions: null == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<Condition>,
      exhaustion: null == exhaustion
          ? _value.exhaustion
          : exhaustion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionStateImpl extends _SessionState {
  const _$SessionStateImpl(
      {required this.currentHp,
      this.tempHp = 0,
      this.hitDiceSpent = 0,
      this.deathSuccesses = 0,
      this.deathFailures = 0,
      this.isStable = false,
      this.isDead = false,
      final List<Condition> conditions = const [],
      this.exhaustion = 0})
      : _conditions = conditions,
        super._();

  factory _$SessionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionStateImplFromJson(json);

  @override
  final int currentHp;
  @override
  @JsonKey()
  final int tempHp;
  @override
  @JsonKey()
  final int hitDiceSpent;
  @override
  @JsonKey()
  final int deathSuccesses;
  @override
  @JsonKey()
  final int deathFailures;
  @override
  @JsonKey()
  final bool isStable;
  @override
  @JsonKey()
  final bool isDead;
  final List<Condition> _conditions;
  @override
  @JsonKey()
  List<Condition> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @override
  @JsonKey()
  final int exhaustion;

  @override
  String toString() {
    return 'SessionState(currentHp: $currentHp, tempHp: $tempHp, hitDiceSpent: $hitDiceSpent, deathSuccesses: $deathSuccesses, deathFailures: $deathFailures, isStable: $isStable, isDead: $isDead, conditions: $conditions, exhaustion: $exhaustion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateImpl &&
            (identical(other.currentHp, currentHp) ||
                other.currentHp == currentHp) &&
            (identical(other.tempHp, tempHp) || other.tempHp == tempHp) &&
            (identical(other.hitDiceSpent, hitDiceSpent) ||
                other.hitDiceSpent == hitDiceSpent) &&
            (identical(other.deathSuccesses, deathSuccesses) ||
                other.deathSuccesses == deathSuccesses) &&
            (identical(other.deathFailures, deathFailures) ||
                other.deathFailures == deathFailures) &&
            (identical(other.isStable, isStable) ||
                other.isStable == isStable) &&
            (identical(other.isDead, isDead) || other.isDead == isDead) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            (identical(other.exhaustion, exhaustion) ||
                other.exhaustion == exhaustion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentHp,
      tempHp,
      hitDiceSpent,
      deathSuccesses,
      deathFailures,
      isStable,
      isDead,
      const DeepCollectionEquality().hash(_conditions),
      exhaustion);

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      __$$SessionStateImplCopyWithImpl<_$SessionStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionStateImplToJson(
      this,
    );
  }
}

abstract class _SessionState extends SessionState {
  const factory _SessionState(
      {required final int currentHp,
      final int tempHp,
      final int hitDiceSpent,
      final int deathSuccesses,
      final int deathFailures,
      final bool isStable,
      final bool isDead,
      final List<Condition> conditions,
      final int exhaustion}) = _$SessionStateImpl;
  const _SessionState._() : super._();

  factory _SessionState.fromJson(Map<String, dynamic> json) =
      _$SessionStateImpl.fromJson;

  @override
  int get currentHp;
  @override
  int get tempHp;
  @override
  int get hitDiceSpent;
  @override
  int get deathSuccesses;
  @override
  int get deathFailures;
  @override
  bool get isStable;
  @override
  bool get isDead;
  @override
  List<Condition> get conditions;
  @override
  int get exhaustion;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionContext _$SessionContextFromJson(Map<String, dynamic> json) {
  return _SessionContext.fromJson(json);
}

/// @nodoc
mixin _$SessionContext {
  /// Максимум хитов по листу
  int get baseMaxHp => throw _privateConstructorUsedError;

  /// Грань кости хитов: 6, 8, 10 или 12
  int get hitDie => throw _privateConstructorUsedError;

  /// Уровень: столько же костей хитов
  int get level => throw _privateConstructorUsedError;
  int get conModifier => throw _privateConstructorUsedError;

  /// Serializes this SessionContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionContextCopyWith<SessionContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionContextCopyWith<$Res> {
  factory $SessionContextCopyWith(
          SessionContext value, $Res Function(SessionContext) then) =
      _$SessionContextCopyWithImpl<$Res, SessionContext>;
  @useResult
  $Res call({int baseMaxHp, int hitDie, int level, int conModifier});
}

/// @nodoc
class _$SessionContextCopyWithImpl<$Res, $Val extends SessionContext>
    implements $SessionContextCopyWith<$Res> {
  _$SessionContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseMaxHp = null,
    Object? hitDie = null,
    Object? level = null,
    Object? conModifier = null,
  }) {
    return _then(_value.copyWith(
      baseMaxHp: null == baseMaxHp
          ? _value.baseMaxHp
          : baseMaxHp // ignore: cast_nullable_to_non_nullable
              as int,
      hitDie: null == hitDie
          ? _value.hitDie
          : hitDie // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      conModifier: null == conModifier
          ? _value.conModifier
          : conModifier // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionContextImplCopyWith<$Res>
    implements $SessionContextCopyWith<$Res> {
  factory _$$SessionContextImplCopyWith(_$SessionContextImpl value,
          $Res Function(_$SessionContextImpl) then) =
      __$$SessionContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int baseMaxHp, int hitDie, int level, int conModifier});
}

/// @nodoc
class __$$SessionContextImplCopyWithImpl<$Res>
    extends _$SessionContextCopyWithImpl<$Res, _$SessionContextImpl>
    implements _$$SessionContextImplCopyWith<$Res> {
  __$$SessionContextImplCopyWithImpl(
      _$SessionContextImpl _value, $Res Function(_$SessionContextImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseMaxHp = null,
    Object? hitDie = null,
    Object? level = null,
    Object? conModifier = null,
  }) {
    return _then(_$SessionContextImpl(
      baseMaxHp: null == baseMaxHp
          ? _value.baseMaxHp
          : baseMaxHp // ignore: cast_nullable_to_non_nullable
              as int,
      hitDie: null == hitDie
          ? _value.hitDie
          : hitDie // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      conModifier: null == conModifier
          ? _value.conModifier
          : conModifier // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionContextImpl implements _SessionContext {
  const _$SessionContextImpl(
      {required this.baseMaxHp,
      required this.hitDie,
      required this.level,
      required this.conModifier});

  factory _$SessionContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionContextImplFromJson(json);

  /// Максимум хитов по листу
  @override
  final int baseMaxHp;

  /// Грань кости хитов: 6, 8, 10 или 12
  @override
  final int hitDie;

  /// Уровень: столько же костей хитов
  @override
  final int level;
  @override
  final int conModifier;

  @override
  String toString() {
    return 'SessionContext(baseMaxHp: $baseMaxHp, hitDie: $hitDie, level: $level, conModifier: $conModifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionContextImpl &&
            (identical(other.baseMaxHp, baseMaxHp) ||
                other.baseMaxHp == baseMaxHp) &&
            (identical(other.hitDie, hitDie) || other.hitDie == hitDie) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.conModifier, conModifier) ||
                other.conModifier == conModifier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, baseMaxHp, hitDie, level, conModifier);

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionContextImplCopyWith<_$SessionContextImpl> get copyWith =>
      __$$SessionContextImplCopyWithImpl<_$SessionContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionContextImplToJson(
      this,
    );
  }
}

abstract class _SessionContext implements SessionContext {
  const factory _SessionContext(
      {required final int baseMaxHp,
      required final int hitDie,
      required final int level,
      required final int conModifier}) = _$SessionContextImpl;

  factory _SessionContext.fromJson(Map<String, dynamic> json) =
      _$SessionContextImpl.fromJson;

  /// Максимум хитов по листу
  @override
  int get baseMaxHp;

  /// Грань кости хитов: 6, 8, 10 или 12
  @override
  int get hitDie;

  /// Уровень: столько же костей хитов
  @override
  int get level;
  @override
  int get conModifier;

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionContextImplCopyWith<_$SessionContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
