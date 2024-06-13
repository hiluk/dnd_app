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
  Race get race => throw _privateConstructorUsedError;
  Class get charClass => throw _privateConstructorUsedError;
  Attributes get attributes => throw _privateConstructorUsedError;
  List<Feat> get feats => throw _privateConstructorUsedError;
  Weapon get weapon => throw _privateConstructorUsedError;

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
      Race race,
      Class charClass,
      Attributes attributes,
      List<Feat> feats,
      Weapon weapon});

  $RaceCopyWith<$Res> get race;
  $ClassCopyWith<$Res> get charClass;
  $AttributesCopyWith<$Res> get attributes;
  $WeaponCopyWith<$Res> get weapon;
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
    Object? race = null,
    Object? charClass = null,
    Object? attributes = null,
    Object? feats = null,
    Object? weapon = null,
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
      race: null == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as Race,
      charClass: null == charClass
          ? _value.charClass
          : charClass // ignore: cast_nullable_to_non_nullable
              as Class,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes,
      feats: null == feats
          ? _value.feats
          : feats // ignore: cast_nullable_to_non_nullable
              as List<Feat>,
      weapon: null == weapon
          ? _value.weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as Weapon,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RaceCopyWith<$Res> get race {
    return $RaceCopyWith<$Res>(_value.race, (value) {
      return _then(_value.copyWith(race: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassCopyWith<$Res> get charClass {
    return $ClassCopyWith<$Res>(_value.charClass, (value) {
      return _then(_value.copyWith(charClass: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get attributes {
    return $AttributesCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeaponCopyWith<$Res> get weapon {
    return $WeaponCopyWith<$Res>(_value.weapon, (value) {
      return _then(_value.copyWith(weapon: value) as $Val);
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
      Race race,
      Class charClass,
      Attributes attributes,
      List<Feat> feats,
      Weapon weapon});

  @override
  $RaceCopyWith<$Res> get race;
  @override
  $ClassCopyWith<$Res> get charClass;
  @override
  $AttributesCopyWith<$Res> get attributes;
  @override
  $WeaponCopyWith<$Res> get weapon;
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
    Object? race = null,
    Object? charClass = null,
    Object? attributes = null,
    Object? feats = null,
    Object? weapon = null,
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
      race: null == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as Race,
      charClass: null == charClass
          ? _value.charClass
          : charClass // ignore: cast_nullable_to_non_nullable
              as Class,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes,
      feats: null == feats
          ? _value._feats
          : feats // ignore: cast_nullable_to_non_nullable
              as List<Feat>,
      weapon: null == weapon
          ? _value.weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as Weapon,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  _$CharacterImpl(
      {required this.name,
      required this.level,
      required this.race,
      required this.charClass,
      required this.attributes,
      final List<Feat> feats = const [],
      required this.weapon})
      : _feats = feats;

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  @override
  final String name;
  @override
  final int level;
  @override
  final Race race;
  @override
  final Class charClass;
  @override
  final Attributes attributes;
  final List<Feat> _feats;
  @override
  @JsonKey()
  List<Feat> get feats {
    if (_feats is EqualUnmodifiableListView) return _feats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feats);
  }

  @override
  final Weapon weapon;

  @override
  String toString() {
    return 'Character(name: $name, level: $level, race: $race, charClass: $charClass, attributes: $attributes, feats: $feats, weapon: $weapon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.race, race) || other.race == race) &&
            (identical(other.charClass, charClass) ||
                other.charClass == charClass) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes) &&
            const DeepCollectionEquality().equals(other._feats, _feats) &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, level, race, charClass,
      attributes, const DeepCollectionEquality().hash(_feats), weapon);

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
      required final Race race,
      required final Class charClass,
      required final Attributes attributes,
      final List<Feat> feats,
      required final Weapon weapon}) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  @override
  String get name;
  @override
  int get level;
  @override
  Race get race;
  @override
  Class get charClass;
  @override
  Attributes get attributes;
  @override
  List<Feat> get feats;
  @override
  Weapon get weapon;
  @override
  @JsonKey(ignore: true)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
