// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weapon _$WeaponFromJson(Map<String, dynamic> json) {
  return _Weapon.fromJson(json);
}

/// @nodoc
mixin _$Weapon {
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get cost => throw _privateConstructorUsedError;
  @JsonKey(name: 'damage_dice')
  String get damageDice => throw _privateConstructorUsedError;
  @JsonKey(name: 'damage_type')
  String get damageType => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  List<String>? get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponCopyWith<Weapon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponCopyWith<$Res> {
  factory $WeaponCopyWith(Weapon value, $Res Function(Weapon) then) =
      _$WeaponCopyWithImpl<$Res, Weapon>;
  @useResult
  $Res call(
      {String name,
      String slug,
      String category,
      String cost,
      @JsonKey(name: 'damage_dice') String damageDice,
      @JsonKey(name: 'damage_type') String damageType,
      String weight,
      List<String>? properties});
}

/// @nodoc
class _$WeaponCopyWithImpl<$Res, $Val extends Weapon>
    implements $WeaponCopyWith<$Res> {
  _$WeaponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? slug = null,
    Object? category = null,
    Object? cost = null,
    Object? damageDice = null,
    Object? damageType = null,
    Object? weight = null,
    Object? properties = freezed,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      damageDice: null == damageDice
          ? _value.damageDice
          : damageDice // ignore: cast_nullable_to_non_nullable
              as String,
      damageType: null == damageType
          ? _value.damageType
          : damageType // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponImplCopyWith<$Res> implements $WeaponCopyWith<$Res> {
  factory _$$WeaponImplCopyWith(
          _$WeaponImpl value, $Res Function(_$WeaponImpl) then) =
      __$$WeaponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String slug,
      String category,
      String cost,
      @JsonKey(name: 'damage_dice') String damageDice,
      @JsonKey(name: 'damage_type') String damageType,
      String weight,
      List<String>? properties});
}

/// @nodoc
class __$$WeaponImplCopyWithImpl<$Res>
    extends _$WeaponCopyWithImpl<$Res, _$WeaponImpl>
    implements _$$WeaponImplCopyWith<$Res> {
  __$$WeaponImplCopyWithImpl(
      _$WeaponImpl _value, $Res Function(_$WeaponImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? slug = null,
    Object? category = null,
    Object? cost = null,
    Object? damageDice = null,
    Object? damageType = null,
    Object? weight = null,
    Object? properties = freezed,
  }) {
    return _then(_$WeaponImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      damageDice: null == damageDice
          ? _value.damageDice
          : damageDice // ignore: cast_nullable_to_non_nullable
              as String,
      damageType: null == damageType
          ? _value.damageType
          : damageType // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeaponImpl implements _Weapon {
  _$WeaponImpl(
      {required this.name,
      required this.slug,
      required this.category,
      required this.cost,
      @JsonKey(name: 'damage_dice') required this.damageDice,
      @JsonKey(name: 'damage_type') required this.damageType,
      required this.weight,
      required final List<String>? properties})
      : _properties = properties;

  factory _$WeaponImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponImplFromJson(json);

  @override
  final String name;
  @override
  final String slug;
  @override
  final String category;
  @override
  final String cost;
  @override
  @JsonKey(name: 'damage_dice')
  final String damageDice;
  @override
  @JsonKey(name: 'damage_type')
  final String damageType;
  @override
  final String weight;
  final List<String>? _properties;
  @override
  List<String>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Weapon(name: $name, slug: $slug, category: $category, cost: $cost, damageDice: $damageDice, damageType: $damageType, weight: $weight, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.damageDice, damageDice) ||
                other.damageDice == damageDice) &&
            (identical(other.damageType, damageType) ||
                other.damageType == damageType) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      slug,
      category,
      cost,
      damageDice,
      damageType,
      weight,
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponImplCopyWith<_$WeaponImpl> get copyWith =>
      __$$WeaponImplCopyWithImpl<_$WeaponImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponImplToJson(
      this,
    );
  }
}

abstract class _Weapon implements Weapon {
  factory _Weapon(
      {required final String name,
      required final String slug,
      required final String category,
      required final String cost,
      @JsonKey(name: 'damage_dice') required final String damageDice,
      @JsonKey(name: 'damage_type') required final String damageType,
      required final String weight,
      required final List<String>? properties}) = _$WeaponImpl;

  factory _Weapon.fromJson(Map<String, dynamic> json) = _$WeaponImpl.fromJson;

  @override
  String get name;
  @override
  String get slug;
  @override
  String get category;
  @override
  String get cost;
  @override
  @JsonKey(name: 'damage_dice')
  String get damageDice;
  @override
  @JsonKey(name: 'damage_type')
  String get damageType;
  @override
  String get weight;
  @override
  List<String>? get properties;
  @override
  @JsonKey(ignore: true)
  _$$WeaponImplCopyWith<_$WeaponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
