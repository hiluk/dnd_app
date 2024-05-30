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
  String get slug => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'asi_desc')
  String get asiDesc => throw _privateConstructorUsedError;
  List<Asi> get asi => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get alignment => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'size_raw')
  String get sizeRaw => throw _privateConstructorUsedError;
  Map<String, int> get speed => throw _privateConstructorUsedError;
  @JsonKey(name: 'speed_desc')
  String get speedDesc => throw _privateConstructorUsedError;
  String get languages => throw _privateConstructorUsedError;
  String get vision => throw _privateConstructorUsedError;
  String get traits => throw _privateConstructorUsedError;
  List<dynamic> get subraces => throw _privateConstructorUsedError;

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
      String slug,
      String desc,
      @JsonKey(name: 'asi_desc') String asiDesc,
      List<Asi> asi,
      String age,
      String alignment,
      String size,
      @JsonKey(name: 'size_raw') String sizeRaw,
      Map<String, int> speed,
      @JsonKey(name: 'speed_desc') String speedDesc,
      String languages,
      String vision,
      String traits,
      List<dynamic> subraces});
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
    Object? slug = null,
    Object? desc = null,
    Object? asiDesc = null,
    Object? asi = null,
    Object? age = null,
    Object? alignment = null,
    Object? size = null,
    Object? sizeRaw = null,
    Object? speed = null,
    Object? speedDesc = null,
    Object? languages = null,
    Object? vision = null,
    Object? traits = null,
    Object? subraces = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      asiDesc: null == asiDesc
          ? _value.asiDesc
          : asiDesc // ignore: cast_nullable_to_non_nullable
              as String,
      asi: null == asi
          ? _value.asi
          : asi // ignore: cast_nullable_to_non_nullable
              as List<Asi>,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      alignment: null == alignment
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      sizeRaw: null == sizeRaw
          ? _value.sizeRaw
          : sizeRaw // ignore: cast_nullable_to_non_nullable
              as String,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      speedDesc: null == speedDesc
          ? _value.speedDesc
          : speedDesc // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      vision: null == vision
          ? _value.vision
          : vision // ignore: cast_nullable_to_non_nullable
              as String,
      traits: null == traits
          ? _value.traits
          : traits // ignore: cast_nullable_to_non_nullable
              as String,
      subraces: null == subraces
          ? _value.subraces
          : subraces // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      String slug,
      String desc,
      @JsonKey(name: 'asi_desc') String asiDesc,
      List<Asi> asi,
      String age,
      String alignment,
      String size,
      @JsonKey(name: 'size_raw') String sizeRaw,
      Map<String, int> speed,
      @JsonKey(name: 'speed_desc') String speedDesc,
      String languages,
      String vision,
      String traits,
      List<dynamic> subraces});
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
    Object? slug = null,
    Object? desc = null,
    Object? asiDesc = null,
    Object? asi = null,
    Object? age = null,
    Object? alignment = null,
    Object? size = null,
    Object? sizeRaw = null,
    Object? speed = null,
    Object? speedDesc = null,
    Object? languages = null,
    Object? vision = null,
    Object? traits = null,
    Object? subraces = null,
  }) {
    return _then(_$RaceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      asiDesc: null == asiDesc
          ? _value.asiDesc
          : asiDesc // ignore: cast_nullable_to_non_nullable
              as String,
      asi: null == asi
          ? _value._asi
          : asi // ignore: cast_nullable_to_non_nullable
              as List<Asi>,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      alignment: null == alignment
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      sizeRaw: null == sizeRaw
          ? _value.sizeRaw
          : sizeRaw // ignore: cast_nullable_to_non_nullable
              as String,
      speed: null == speed
          ? _value._speed
          : speed // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      speedDesc: null == speedDesc
          ? _value.speedDesc
          : speedDesc // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      vision: null == vision
          ? _value.vision
          : vision // ignore: cast_nullable_to_non_nullable
              as String,
      traits: null == traits
          ? _value.traits
          : traits // ignore: cast_nullable_to_non_nullable
              as String,
      subraces: null == subraces
          ? _value._subraces
          : subraces // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RaceImpl implements _Race {
  _$RaceImpl(
      {required this.name,
      required this.slug,
      required this.desc,
      @JsonKey(name: 'asi_desc') required this.asiDesc,
      required final List<Asi> asi,
      required this.age,
      required this.alignment,
      required this.size,
      @JsonKey(name: 'size_raw') required this.sizeRaw,
      required final Map<String, int> speed,
      @JsonKey(name: 'speed_desc') required this.speedDesc,
      required this.languages,
      required this.vision,
      required this.traits,
      required final List<dynamic> subraces})
      : _asi = asi,
        _speed = speed,
        _subraces = subraces;

  factory _$RaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$RaceImplFromJson(json);

  @override
  final String name;
  @override
  final String slug;
  @override
  final String desc;
  @override
  @JsonKey(name: 'asi_desc')
  final String asiDesc;
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
  final String alignment;
  @override
  final String size;
  @override
  @JsonKey(name: 'size_raw')
  final String sizeRaw;
  final Map<String, int> _speed;
  @override
  Map<String, int> get speed {
    if (_speed is EqualUnmodifiableMapView) return _speed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_speed);
  }

  @override
  @JsonKey(name: 'speed_desc')
  final String speedDesc;
  @override
  final String languages;
  @override
  final String vision;
  @override
  final String traits;
  final List<dynamic> _subraces;
  @override
  List<dynamic> get subraces {
    if (_subraces is EqualUnmodifiableListView) return _subraces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subraces);
  }

  @override
  String toString() {
    return 'Race(name: $name, slug: $slug, desc: $desc, asiDesc: $asiDesc, asi: $asi, age: $age, alignment: $alignment, size: $size, sizeRaw: $sizeRaw, speed: $speed, speedDesc: $speedDesc, languages: $languages, vision: $vision, traits: $traits, subraces: $subraces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RaceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.asiDesc, asiDesc) || other.asiDesc == asiDesc) &&
            const DeepCollectionEquality().equals(other._asi, _asi) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.alignment, alignment) ||
                other.alignment == alignment) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.sizeRaw, sizeRaw) || other.sizeRaw == sizeRaw) &&
            const DeepCollectionEquality().equals(other._speed, _speed) &&
            (identical(other.speedDesc, speedDesc) ||
                other.speedDesc == speedDesc) &&
            (identical(other.languages, languages) ||
                other.languages == languages) &&
            (identical(other.vision, vision) || other.vision == vision) &&
            (identical(other.traits, traits) || other.traits == traits) &&
            const DeepCollectionEquality().equals(other._subraces, _subraces));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      slug,
      desc,
      asiDesc,
      const DeepCollectionEquality().hash(_asi),
      age,
      alignment,
      size,
      sizeRaw,
      const DeepCollectionEquality().hash(_speed),
      speedDesc,
      languages,
      vision,
      traits,
      const DeepCollectionEquality().hash(_subraces));

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
      required final String slug,
      required final String desc,
      @JsonKey(name: 'asi_desc') required final String asiDesc,
      required final List<Asi> asi,
      required final String age,
      required final String alignment,
      required final String size,
      @JsonKey(name: 'size_raw') required final String sizeRaw,
      required final Map<String, int> speed,
      @JsonKey(name: 'speed_desc') required final String speedDesc,
      required final String languages,
      required final String vision,
      required final String traits,
      required final List<dynamic> subraces}) = _$RaceImpl;

  factory _Race.fromJson(Map<String, dynamic> json) = _$RaceImpl.fromJson;

  @override
  String get name;
  @override
  String get slug;
  @override
  String get desc;
  @override
  @JsonKey(name: 'asi_desc')
  String get asiDesc;
  @override
  List<Asi> get asi;
  @override
  String get age;
  @override
  String get alignment;
  @override
  String get size;
  @override
  @JsonKey(name: 'size_raw')
  String get sizeRaw;
  @override
  Map<String, int> get speed;
  @override
  @JsonKey(name: 'speed_desc')
  String get speedDesc;
  @override
  String get languages;
  @override
  String get vision;
  @override
  String get traits;
  @override
  List<dynamic> get subraces;
  @override
  @JsonKey(ignore: true)
  _$$RaceImplCopyWith<_$RaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
