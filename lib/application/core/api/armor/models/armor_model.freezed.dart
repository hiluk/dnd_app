// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'armor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Armor _$ArmorFromJson(Map<String, dynamic> json) {
  return _Armor.fromJson(json);
}

/// @nodoc
mixin _$Armor {
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_ac')
  int get baseAc => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_dex_mod')
  bool? get baseDexMod => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_con_mod')
  bool? get baseConMod => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_wis_mod')
  bool? get baseWisMod => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_flat_mod')
  bool? get baseFlatMod => throw _privateConstructorUsedError;
  @JsonKey(name: 'plus_max')
  int get plusMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'ac_string')
  String get acString => throw _privateConstructorUsedError;
  @JsonKey(name: 'strength_requirement')
  int? get strengthRequirement => throw _privateConstructorUsedError;
  String get cost => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'stealth_disadvantage')
  bool get stealtDisadvantage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArmorCopyWith<Armor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArmorCopyWith<$Res> {
  factory $ArmorCopyWith(Armor value, $Res Function(Armor) then) =
      _$ArmorCopyWithImpl<$Res, Armor>;
  @useResult
  $Res call(
      {String name,
      String slug,
      String category,
      @JsonKey(name: 'base_ac') int baseAc,
      @JsonKey(name: 'base_dex_mod') bool? baseDexMod,
      @JsonKey(name: 'base_con_mod') bool? baseConMod,
      @JsonKey(name: 'base_wis_mod') bool? baseWisMod,
      @JsonKey(name: 'base_flat_mod') bool? baseFlatMod,
      @JsonKey(name: 'plus_max') int plusMax,
      @JsonKey(name: 'ac_string') String acString,
      @JsonKey(name: 'strength_requirement') int? strengthRequirement,
      String cost,
      String weight,
      @JsonKey(name: 'stealth_disadvantage') bool stealtDisadvantage});
}

/// @nodoc
class _$ArmorCopyWithImpl<$Res, $Val extends Armor>
    implements $ArmorCopyWith<$Res> {
  _$ArmorCopyWithImpl(this._value, this._then);

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
    Object? baseAc = null,
    Object? baseDexMod = freezed,
    Object? baseConMod = freezed,
    Object? baseWisMod = freezed,
    Object? baseFlatMod = freezed,
    Object? plusMax = null,
    Object? acString = null,
    Object? strengthRequirement = freezed,
    Object? cost = null,
    Object? weight = null,
    Object? stealtDisadvantage = null,
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
      baseAc: null == baseAc
          ? _value.baseAc
          : baseAc // ignore: cast_nullable_to_non_nullable
              as int,
      baseDexMod: freezed == baseDexMod
          ? _value.baseDexMod
          : baseDexMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseConMod: freezed == baseConMod
          ? _value.baseConMod
          : baseConMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseWisMod: freezed == baseWisMod
          ? _value.baseWisMod
          : baseWisMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseFlatMod: freezed == baseFlatMod
          ? _value.baseFlatMod
          : baseFlatMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      plusMax: null == plusMax
          ? _value.plusMax
          : plusMax // ignore: cast_nullable_to_non_nullable
              as int,
      acString: null == acString
          ? _value.acString
          : acString // ignore: cast_nullable_to_non_nullable
              as String,
      strengthRequirement: freezed == strengthRequirement
          ? _value.strengthRequirement
          : strengthRequirement // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      stealtDisadvantage: null == stealtDisadvantage
          ? _value.stealtDisadvantage
          : stealtDisadvantage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArmorImplCopyWith<$Res> implements $ArmorCopyWith<$Res> {
  factory _$$ArmorImplCopyWith(
          _$ArmorImpl value, $Res Function(_$ArmorImpl) then) =
      __$$ArmorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String slug,
      String category,
      @JsonKey(name: 'base_ac') int baseAc,
      @JsonKey(name: 'base_dex_mod') bool? baseDexMod,
      @JsonKey(name: 'base_con_mod') bool? baseConMod,
      @JsonKey(name: 'base_wis_mod') bool? baseWisMod,
      @JsonKey(name: 'base_flat_mod') bool? baseFlatMod,
      @JsonKey(name: 'plus_max') int plusMax,
      @JsonKey(name: 'ac_string') String acString,
      @JsonKey(name: 'strength_requirement') int? strengthRequirement,
      String cost,
      String weight,
      @JsonKey(name: 'stealth_disadvantage') bool stealtDisadvantage});
}

/// @nodoc
class __$$ArmorImplCopyWithImpl<$Res>
    extends _$ArmorCopyWithImpl<$Res, _$ArmorImpl>
    implements _$$ArmorImplCopyWith<$Res> {
  __$$ArmorImplCopyWithImpl(
      _$ArmorImpl _value, $Res Function(_$ArmorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? slug = null,
    Object? category = null,
    Object? baseAc = null,
    Object? baseDexMod = freezed,
    Object? baseConMod = freezed,
    Object? baseWisMod = freezed,
    Object? baseFlatMod = freezed,
    Object? plusMax = null,
    Object? acString = null,
    Object? strengthRequirement = freezed,
    Object? cost = null,
    Object? weight = null,
    Object? stealtDisadvantage = null,
  }) {
    return _then(_$ArmorImpl(
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
      baseAc: null == baseAc
          ? _value.baseAc
          : baseAc // ignore: cast_nullable_to_non_nullable
              as int,
      baseDexMod: freezed == baseDexMod
          ? _value.baseDexMod
          : baseDexMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseConMod: freezed == baseConMod
          ? _value.baseConMod
          : baseConMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseWisMod: freezed == baseWisMod
          ? _value.baseWisMod
          : baseWisMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseFlatMod: freezed == baseFlatMod
          ? _value.baseFlatMod
          : baseFlatMod // ignore: cast_nullable_to_non_nullable
              as bool?,
      plusMax: null == plusMax
          ? _value.plusMax
          : plusMax // ignore: cast_nullable_to_non_nullable
              as int,
      acString: null == acString
          ? _value.acString
          : acString // ignore: cast_nullable_to_non_nullable
              as String,
      strengthRequirement: freezed == strengthRequirement
          ? _value.strengthRequirement
          : strengthRequirement // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      stealtDisadvantage: null == stealtDisadvantage
          ? _value.stealtDisadvantage
          : stealtDisadvantage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArmorImpl implements _Armor {
  _$ArmorImpl(
      {required this.name,
      required this.slug,
      required this.category,
      @JsonKey(name: 'base_ac') required this.baseAc,
      @JsonKey(name: 'base_dex_mod') required this.baseDexMod,
      @JsonKey(name: 'base_con_mod') required this.baseConMod,
      @JsonKey(name: 'base_wis_mod') required this.baseWisMod,
      @JsonKey(name: 'base_flat_mod') required this.baseFlatMod,
      @JsonKey(name: 'plus_max') required this.plusMax,
      @JsonKey(name: 'ac_string') required this.acString,
      @JsonKey(name: 'strength_requirement') required this.strengthRequirement,
      required this.cost,
      required this.weight,
      @JsonKey(name: 'stealth_disadvantage') required this.stealtDisadvantage});

  factory _$ArmorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArmorImplFromJson(json);

  @override
  final String name;
  @override
  final String slug;
  @override
  final String category;
  @override
  @JsonKey(name: 'base_ac')
  final int baseAc;
  @override
  @JsonKey(name: 'base_dex_mod')
  final bool? baseDexMod;
  @override
  @JsonKey(name: 'base_con_mod')
  final bool? baseConMod;
  @override
  @JsonKey(name: 'base_wis_mod')
  final bool? baseWisMod;
  @override
  @JsonKey(name: 'base_flat_mod')
  final bool? baseFlatMod;
  @override
  @JsonKey(name: 'plus_max')
  final int plusMax;
  @override
  @JsonKey(name: 'ac_string')
  final String acString;
  @override
  @JsonKey(name: 'strength_requirement')
  final int? strengthRequirement;
  @override
  final String cost;
  @override
  final String weight;
  @override
  @JsonKey(name: 'stealth_disadvantage')
  final bool stealtDisadvantage;

  @override
  String toString() {
    return 'Armor(name: $name, slug: $slug, category: $category, baseAc: $baseAc, baseDexMod: $baseDexMod, baseConMod: $baseConMod, baseWisMod: $baseWisMod, baseFlatMod: $baseFlatMod, plusMax: $plusMax, acString: $acString, strengthRequirement: $strengthRequirement, cost: $cost, weight: $weight, stealtDisadvantage: $stealtDisadvantage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArmorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.baseAc, baseAc) || other.baseAc == baseAc) &&
            (identical(other.baseDexMod, baseDexMod) ||
                other.baseDexMod == baseDexMod) &&
            (identical(other.baseConMod, baseConMod) ||
                other.baseConMod == baseConMod) &&
            (identical(other.baseWisMod, baseWisMod) ||
                other.baseWisMod == baseWisMod) &&
            (identical(other.baseFlatMod, baseFlatMod) ||
                other.baseFlatMod == baseFlatMod) &&
            (identical(other.plusMax, plusMax) || other.plusMax == plusMax) &&
            (identical(other.acString, acString) ||
                other.acString == acString) &&
            (identical(other.strengthRequirement, strengthRequirement) ||
                other.strengthRequirement == strengthRequirement) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.stealtDisadvantage, stealtDisadvantage) ||
                other.stealtDisadvantage == stealtDisadvantage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      slug,
      category,
      baseAc,
      baseDexMod,
      baseConMod,
      baseWisMod,
      baseFlatMod,
      plusMax,
      acString,
      strengthRequirement,
      cost,
      weight,
      stealtDisadvantage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArmorImplCopyWith<_$ArmorImpl> get copyWith =>
      __$$ArmorImplCopyWithImpl<_$ArmorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArmorImplToJson(
      this,
    );
  }
}

abstract class _Armor implements Armor {
  factory _Armor(
      {required final String name,
      required final String slug,
      required final String category,
      @JsonKey(name: 'base_ac') required final int baseAc,
      @JsonKey(name: 'base_dex_mod') required final bool? baseDexMod,
      @JsonKey(name: 'base_con_mod') required final bool? baseConMod,
      @JsonKey(name: 'base_wis_mod') required final bool? baseWisMod,
      @JsonKey(name: 'base_flat_mod') required final bool? baseFlatMod,
      @JsonKey(name: 'plus_max') required final int plusMax,
      @JsonKey(name: 'ac_string') required final String acString,
      @JsonKey(name: 'strength_requirement')
      required final int? strengthRequirement,
      required final String cost,
      required final String weight,
      @JsonKey(name: 'stealth_disadvantage')
      required final bool stealtDisadvantage}) = _$ArmorImpl;

  factory _Armor.fromJson(Map<String, dynamic> json) = _$ArmorImpl.fromJson;

  @override
  String get name;
  @override
  String get slug;
  @override
  String get category;
  @override
  @JsonKey(name: 'base_ac')
  int get baseAc;
  @override
  @JsonKey(name: 'base_dex_mod')
  bool? get baseDexMod;
  @override
  @JsonKey(name: 'base_con_mod')
  bool? get baseConMod;
  @override
  @JsonKey(name: 'base_wis_mod')
  bool? get baseWisMod;
  @override
  @JsonKey(name: 'base_flat_mod')
  bool? get baseFlatMod;
  @override
  @JsonKey(name: 'plus_max')
  int get plusMax;
  @override
  @JsonKey(name: 'ac_string')
  String get acString;
  @override
  @JsonKey(name: 'strength_requirement')
  int? get strengthRequirement;
  @override
  String get cost;
  @override
  String get weight;
  @override
  @JsonKey(name: 'stealth_disadvantage')
  bool get stealtDisadvantage;
  @override
  @JsonKey(ignore: true)
  _$$ArmorImplCopyWith<_$ArmorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
