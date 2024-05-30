// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Class _$ClassFromJson(Map<String, dynamic> json) {
  return _Class.fromJson(json);
}

/// @nodoc
mixin _$Class {
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'hit_dice')
  String get hitDice => throw _privateConstructorUsedError;
  @JsonKey(name: 'hp_at_1st_level')
  String get hpAtFirstLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'hp_at_higher_levels')
  String get hpAtHigherLevels => throw _privateConstructorUsedError;
  @JsonKey(name: 'prof_armor')
  String get profArmor => throw _privateConstructorUsedError;
  @JsonKey(name: 'prof_weapons')
  String get profWeapon => throw _privateConstructorUsedError;
  @JsonKey(name: 'prof_tools')
  String get profTools => throw _privateConstructorUsedError;
  @JsonKey(name: 'prof_saving_throws')
  String get profSavingThrows => throw _privateConstructorUsedError;
  @JsonKey(name: 'prof_skills')
  String get profSkills => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  List<Archetype> get archetypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'spellcasting_ability')
  String get spellcastingAbility => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtypes_name')
  String get subtypesName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassCopyWith<Class> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassCopyWith<$Res> {
  factory $ClassCopyWith(Class value, $Res Function(Class) then) =
      _$ClassCopyWithImpl<$Res, Class>;
  @useResult
  $Res call(
      {String name,
      String slug,
      String desc,
      @JsonKey(name: 'hit_dice') String hitDice,
      @JsonKey(name: 'hp_at_1st_level') String hpAtFirstLevel,
      @JsonKey(name: 'hp_at_higher_levels') String hpAtHigherLevels,
      @JsonKey(name: 'prof_armor') String profArmor,
      @JsonKey(name: 'prof_weapons') String profWeapon,
      @JsonKey(name: 'prof_tools') String profTools,
      @JsonKey(name: 'prof_saving_throws') String profSavingThrows,
      @JsonKey(name: 'prof_skills') String profSkills,
      String equipment,
      List<Archetype> archetypes,
      @JsonKey(name: 'spellcasting_ability') String spellcastingAbility,
      @JsonKey(name: 'subtypes_name') String subtypesName});
}

/// @nodoc
class _$ClassCopyWithImpl<$Res, $Val extends Class>
    implements $ClassCopyWith<$Res> {
  _$ClassCopyWithImpl(this._value, this._then);

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
    Object? hitDice = null,
    Object? hpAtFirstLevel = null,
    Object? hpAtHigherLevels = null,
    Object? profArmor = null,
    Object? profWeapon = null,
    Object? profTools = null,
    Object? profSavingThrows = null,
    Object? profSkills = null,
    Object? equipment = null,
    Object? archetypes = null,
    Object? spellcastingAbility = null,
    Object? subtypesName = null,
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
      hitDice: null == hitDice
          ? _value.hitDice
          : hitDice // ignore: cast_nullable_to_non_nullable
              as String,
      hpAtFirstLevel: null == hpAtFirstLevel
          ? _value.hpAtFirstLevel
          : hpAtFirstLevel // ignore: cast_nullable_to_non_nullable
              as String,
      hpAtHigherLevels: null == hpAtHigherLevels
          ? _value.hpAtHigherLevels
          : hpAtHigherLevels // ignore: cast_nullable_to_non_nullable
              as String,
      profArmor: null == profArmor
          ? _value.profArmor
          : profArmor // ignore: cast_nullable_to_non_nullable
              as String,
      profWeapon: null == profWeapon
          ? _value.profWeapon
          : profWeapon // ignore: cast_nullable_to_non_nullable
              as String,
      profTools: null == profTools
          ? _value.profTools
          : profTools // ignore: cast_nullable_to_non_nullable
              as String,
      profSavingThrows: null == profSavingThrows
          ? _value.profSavingThrows
          : profSavingThrows // ignore: cast_nullable_to_non_nullable
              as String,
      profSkills: null == profSkills
          ? _value.profSkills
          : profSkills // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      archetypes: null == archetypes
          ? _value.archetypes
          : archetypes // ignore: cast_nullable_to_non_nullable
              as List<Archetype>,
      spellcastingAbility: null == spellcastingAbility
          ? _value.spellcastingAbility
          : spellcastingAbility // ignore: cast_nullable_to_non_nullable
              as String,
      subtypesName: null == subtypesName
          ? _value.subtypesName
          : subtypesName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassImplCopyWith<$Res> implements $ClassCopyWith<$Res> {
  factory _$$ClassImplCopyWith(
          _$ClassImpl value, $Res Function(_$ClassImpl) then) =
      __$$ClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String slug,
      String desc,
      @JsonKey(name: 'hit_dice') String hitDice,
      @JsonKey(name: 'hp_at_1st_level') String hpAtFirstLevel,
      @JsonKey(name: 'hp_at_higher_levels') String hpAtHigherLevels,
      @JsonKey(name: 'prof_armor') String profArmor,
      @JsonKey(name: 'prof_weapons') String profWeapon,
      @JsonKey(name: 'prof_tools') String profTools,
      @JsonKey(name: 'prof_saving_throws') String profSavingThrows,
      @JsonKey(name: 'prof_skills') String profSkills,
      String equipment,
      List<Archetype> archetypes,
      @JsonKey(name: 'spellcasting_ability') String spellcastingAbility,
      @JsonKey(name: 'subtypes_name') String subtypesName});
}

/// @nodoc
class __$$ClassImplCopyWithImpl<$Res>
    extends _$ClassCopyWithImpl<$Res, _$ClassImpl>
    implements _$$ClassImplCopyWith<$Res> {
  __$$ClassImplCopyWithImpl(
      _$ClassImpl _value, $Res Function(_$ClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? slug = null,
    Object? desc = null,
    Object? hitDice = null,
    Object? hpAtFirstLevel = null,
    Object? hpAtHigherLevels = null,
    Object? profArmor = null,
    Object? profWeapon = null,
    Object? profTools = null,
    Object? profSavingThrows = null,
    Object? profSkills = null,
    Object? equipment = null,
    Object? archetypes = null,
    Object? spellcastingAbility = null,
    Object? subtypesName = null,
  }) {
    return _then(_$ClassImpl(
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
      hitDice: null == hitDice
          ? _value.hitDice
          : hitDice // ignore: cast_nullable_to_non_nullable
              as String,
      hpAtFirstLevel: null == hpAtFirstLevel
          ? _value.hpAtFirstLevel
          : hpAtFirstLevel // ignore: cast_nullable_to_non_nullable
              as String,
      hpAtHigherLevels: null == hpAtHigherLevels
          ? _value.hpAtHigherLevels
          : hpAtHigherLevels // ignore: cast_nullable_to_non_nullable
              as String,
      profArmor: null == profArmor
          ? _value.profArmor
          : profArmor // ignore: cast_nullable_to_non_nullable
              as String,
      profWeapon: null == profWeapon
          ? _value.profWeapon
          : profWeapon // ignore: cast_nullable_to_non_nullable
              as String,
      profTools: null == profTools
          ? _value.profTools
          : profTools // ignore: cast_nullable_to_non_nullable
              as String,
      profSavingThrows: null == profSavingThrows
          ? _value.profSavingThrows
          : profSavingThrows // ignore: cast_nullable_to_non_nullable
              as String,
      profSkills: null == profSkills
          ? _value.profSkills
          : profSkills // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      archetypes: null == archetypes
          ? _value._archetypes
          : archetypes // ignore: cast_nullable_to_non_nullable
              as List<Archetype>,
      spellcastingAbility: null == spellcastingAbility
          ? _value.spellcastingAbility
          : spellcastingAbility // ignore: cast_nullable_to_non_nullable
              as String,
      subtypesName: null == subtypesName
          ? _value.subtypesName
          : subtypesName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassImpl implements _Class {
  _$ClassImpl(
      {required this.name,
      required this.slug,
      required this.desc,
      @JsonKey(name: 'hit_dice') required this.hitDice,
      @JsonKey(name: 'hp_at_1st_level') required this.hpAtFirstLevel,
      @JsonKey(name: 'hp_at_higher_levels') required this.hpAtHigherLevels,
      @JsonKey(name: 'prof_armor') required this.profArmor,
      @JsonKey(name: 'prof_weapons') required this.profWeapon,
      @JsonKey(name: 'prof_tools') required this.profTools,
      @JsonKey(name: 'prof_saving_throws') required this.profSavingThrows,
      @JsonKey(name: 'prof_skills') required this.profSkills,
      required this.equipment,
      required final List<Archetype> archetypes,
      @JsonKey(name: 'spellcasting_ability') required this.spellcastingAbility,
      @JsonKey(name: 'subtypes_name') required this.subtypesName})
      : _archetypes = archetypes;

  factory _$ClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassImplFromJson(json);

  @override
  final String name;
  @override
  final String slug;
  @override
  final String desc;
  @override
  @JsonKey(name: 'hit_dice')
  final String hitDice;
  @override
  @JsonKey(name: 'hp_at_1st_level')
  final String hpAtFirstLevel;
  @override
  @JsonKey(name: 'hp_at_higher_levels')
  final String hpAtHigherLevels;
  @override
  @JsonKey(name: 'prof_armor')
  final String profArmor;
  @override
  @JsonKey(name: 'prof_weapons')
  final String profWeapon;
  @override
  @JsonKey(name: 'prof_tools')
  final String profTools;
  @override
  @JsonKey(name: 'prof_saving_throws')
  final String profSavingThrows;
  @override
  @JsonKey(name: 'prof_skills')
  final String profSkills;
  @override
  final String equipment;
  final List<Archetype> _archetypes;
  @override
  List<Archetype> get archetypes {
    if (_archetypes is EqualUnmodifiableListView) return _archetypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archetypes);
  }

  @override
  @JsonKey(name: 'spellcasting_ability')
  final String spellcastingAbility;
  @override
  @JsonKey(name: 'subtypes_name')
  final String subtypesName;

  @override
  String toString() {
    return 'Class(name: $name, slug: $slug, desc: $desc, hitDice: $hitDice, hpAtFirstLevel: $hpAtFirstLevel, hpAtHigherLevels: $hpAtHigherLevels, profArmor: $profArmor, profWeapon: $profWeapon, profTools: $profTools, profSavingThrows: $profSavingThrows, profSkills: $profSkills, equipment: $equipment, archetypes: $archetypes, spellcastingAbility: $spellcastingAbility, subtypesName: $subtypesName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.hitDice, hitDice) || other.hitDice == hitDice) &&
            (identical(other.hpAtFirstLevel, hpAtFirstLevel) ||
                other.hpAtFirstLevel == hpAtFirstLevel) &&
            (identical(other.hpAtHigherLevels, hpAtHigherLevels) ||
                other.hpAtHigherLevels == hpAtHigherLevels) &&
            (identical(other.profArmor, profArmor) ||
                other.profArmor == profArmor) &&
            (identical(other.profWeapon, profWeapon) ||
                other.profWeapon == profWeapon) &&
            (identical(other.profTools, profTools) ||
                other.profTools == profTools) &&
            (identical(other.profSavingThrows, profSavingThrows) ||
                other.profSavingThrows == profSavingThrows) &&
            (identical(other.profSkills, profSkills) ||
                other.profSkills == profSkills) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            const DeepCollectionEquality()
                .equals(other._archetypes, _archetypes) &&
            (identical(other.spellcastingAbility, spellcastingAbility) ||
                other.spellcastingAbility == spellcastingAbility) &&
            (identical(other.subtypesName, subtypesName) ||
                other.subtypesName == subtypesName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      slug,
      desc,
      hitDice,
      hpAtFirstLevel,
      hpAtHigherLevels,
      profArmor,
      profWeapon,
      profTools,
      profSavingThrows,
      profSkills,
      equipment,
      const DeepCollectionEquality().hash(_archetypes),
      spellcastingAbility,
      subtypesName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassImplCopyWith<_$ClassImpl> get copyWith =>
      __$$ClassImplCopyWithImpl<_$ClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassImplToJson(
      this,
    );
  }
}

abstract class _Class implements Class {
  factory _Class(
      {required final String name,
      required final String slug,
      required final String desc,
      @JsonKey(name: 'hit_dice') required final String hitDice,
      @JsonKey(name: 'hp_at_1st_level') required final String hpAtFirstLevel,
      @JsonKey(name: 'hp_at_higher_levels')
      required final String hpAtHigherLevels,
      @JsonKey(name: 'prof_armor') required final String profArmor,
      @JsonKey(name: 'prof_weapons') required final String profWeapon,
      @JsonKey(name: 'prof_tools') required final String profTools,
      @JsonKey(name: 'prof_saving_throws')
      required final String profSavingThrows,
      @JsonKey(name: 'prof_skills') required final String profSkills,
      required final String equipment,
      required final List<Archetype> archetypes,
      @JsonKey(name: 'spellcasting_ability')
      required final String spellcastingAbility,
      @JsonKey(name: 'subtypes_name')
      required final String subtypesName}) = _$ClassImpl;

  factory _Class.fromJson(Map<String, dynamic> json) = _$ClassImpl.fromJson;

  @override
  String get name;
  @override
  String get slug;
  @override
  String get desc;
  @override
  @JsonKey(name: 'hit_dice')
  String get hitDice;
  @override
  @JsonKey(name: 'hp_at_1st_level')
  String get hpAtFirstLevel;
  @override
  @JsonKey(name: 'hp_at_higher_levels')
  String get hpAtHigherLevels;
  @override
  @JsonKey(name: 'prof_armor')
  String get profArmor;
  @override
  @JsonKey(name: 'prof_weapons')
  String get profWeapon;
  @override
  @JsonKey(name: 'prof_tools')
  String get profTools;
  @override
  @JsonKey(name: 'prof_saving_throws')
  String get profSavingThrows;
  @override
  @JsonKey(name: 'prof_skills')
  String get profSkills;
  @override
  String get equipment;
  @override
  List<Archetype> get archetypes;
  @override
  @JsonKey(name: 'spellcasting_ability')
  String get spellcastingAbility;
  @override
  @JsonKey(name: 'subtypes_name')
  String get subtypesName;
  @override
  @JsonKey(ignore: true)
  _$$ClassImplCopyWith<_$ClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
