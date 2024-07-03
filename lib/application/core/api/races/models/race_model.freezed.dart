// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'race_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Race _$RaceFromJson(Map<String, dynamic> json) {
  return _Race.fromJson(json);
}

/// @nodoc
mixin _$Race {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Asi> get asi => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  List<Speed> get speed => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get vision => throw _privateConstructorUsedError;
  String get traits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RaceCopyWith<Race> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RaceCopyWith<$Res> {
  factory $RaceCopyWith(Race value, $Res Function(Race) then) =
      _$RaceCopyWithImpl<$Res, Race>;
  @useResult
  $Res call(
      {String name,
      String description,
      List<Asi> asi,
      String age,
      String size,
      List<Speed> speed,
      String language,
      String vision,
      String traits});
}

/// @nodoc
class _$RaceCopyWithImpl<$Res, $Val extends Race>
    implements $RaceCopyWith<$Res> {
  _$RaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? asi = null,
    Object? age = null,
    Object? size = null,
    Object? speed = null,
    Object? language = null,
    Object? vision = null,
    Object? traits = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      asi: null == asi
          ? _value.asi
          : asi // ignore: cast_nullable_to_non_nullable
              as List<Asi>,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as List<Speed>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      vision: null == vision
          ? _value.vision
          : vision // ignore: cast_nullable_to_non_nullable
              as String,
      traits: null == traits
          ? _value.traits
          : traits // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RaceImplCopyWith<$Res> implements $RaceCopyWith<$Res> {
  factory _$$RaceImplCopyWith(
          _$RaceImpl value, $Res Function(_$RaceImpl) then) =
      __$$RaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      List<Asi> asi,
      String age,
      String size,
      List<Speed> speed,
      String language,
      String vision,
      String traits});
}

/// @nodoc
class __$$RaceImplCopyWithImpl<$Res>
    extends _$RaceCopyWithImpl<$Res, _$RaceImpl>
    implements _$$RaceImplCopyWith<$Res> {
  __$$RaceImplCopyWithImpl(_$RaceImpl _value, $Res Function(_$RaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? asi = null,
    Object? age = null,
    Object? size = null,
    Object? speed = null,
    Object? language = null,
    Object? vision = null,
    Object? traits = null,
  }) {
    return _then(_$RaceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      asi: null == asi
          ? _value._asi
          : asi // ignore: cast_nullable_to_non_nullable
              as List<Asi>,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      speed: null == speed
          ? _value._speed
          : speed // ignore: cast_nullable_to_non_nullable
              as List<Speed>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      vision: null == vision
          ? _value.vision
          : vision // ignore: cast_nullable_to_non_nullable
              as String,
      traits: null == traits
          ? _value.traits
          : traits // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RaceImpl implements _Race {
  _$RaceImpl(
      {required this.name,
      required this.description,
      required final List<Asi> asi,
      required this.age,
      required this.size,
      required final List<Speed> speed,
      required this.language,
      required this.vision,
      required this.traits})
      : _asi = asi,
        _speed = speed;

  factory _$RaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$RaceImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  final List<Asi> _asi;
  @override
  List<Asi> get asi {
    if (_asi is EqualUnmodifiableListView) return _asi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asi);
  }

  @override
  final String age;
  @override
  final String size;
  final List<Speed> _speed;
  @override
  List<Speed> get speed {
    if (_speed is EqualUnmodifiableListView) return _speed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_speed);
  }

  @override
  final String language;
  @override
  final String vision;
  @override
  final String traits;

  @override
  String toString() {
    return 'Race(name: $name, description: $description, asi: $asi, age: $age, size: $size, speed: $speed, language: $language, vision: $vision, traits: $traits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RaceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._asi, _asi) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._speed, _speed) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.vision, vision) || other.vision == vision) &&
            (identical(other.traits, traits) || other.traits == traits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      const DeepCollectionEquality().hash(_asi),
      age,
      size,
      const DeepCollectionEquality().hash(_speed),
      language,
      vision,
      traits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RaceImplCopyWith<_$RaceImpl> get copyWith =>
      __$$RaceImplCopyWithImpl<_$RaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RaceImplToJson(
      this,
    );
  }
}

abstract class _Race implements Race {
  factory _Race(
      {required final String name,
      required final String description,
      required final List<Asi> asi,
      required final String age,
      required final String size,
      required final List<Speed> speed,
      required final String language,
      required final String vision,
      required final String traits}) = _$RaceImpl;

  factory _Race.fromJson(Map<String, dynamic> json) = _$RaceImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  List<Asi> get asi;
  @override
  String get age;
  @override
  String get size;
  @override
  List<Speed> get speed;
  @override
  String get language;
  @override
  String get vision;
  @override
  String get traits;
  @override
  @JsonKey(ignore: true)
  _$$RaceImplCopyWith<_$RaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
