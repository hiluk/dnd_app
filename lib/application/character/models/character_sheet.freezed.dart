// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterSheet _$CharacterSheetFromJson(Map<String, dynamic> json) {
  return _CharacterSheet.fromJson(json);
}

/// @nodoc
mixin _$CharacterSheet {
  Attributes get stats => throw _privateConstructorUsedError;
  Attributes get modifiers => throw _privateConstructorUsedError;
  int get hitPoints => throw _privateConstructorUsedError;
  int get armorClass => throw _privateConstructorUsedError;
  int get initiative => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;
  int get proficiencyBonus => throw _privateConstructorUsedError;
  List<SavingThrow> get savingThrows => throw _privateConstructorUsedError;
  List<SkillCheck> get skills => throw _privateConstructorUsedError;
  int get passivePerception => throw _privateConstructorUsedError;

  /// Serializes this CharacterSheet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterSheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterSheetCopyWith<CharacterSheet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterSheetCopyWith<$Res> {
  factory $CharacterSheetCopyWith(
          CharacterSheet value, $Res Function(CharacterSheet) then) =
      _$CharacterSheetCopyWithImpl<$Res, CharacterSheet>;
  @useResult
  $Res call(
      {Attributes stats,
      Attributes modifiers,
      int hitPoints,
      int armorClass,
      int initiative,
      int speed,
      int proficiencyBonus,
      List<SavingThrow> savingThrows,
      List<SkillCheck> skills,
      int passivePerception});

  $AttributesCopyWith<$Res> get stats;
  $AttributesCopyWith<$Res> get modifiers;
}

/// @nodoc
class _$CharacterSheetCopyWithImpl<$Res, $Val extends CharacterSheet>
    implements $CharacterSheetCopyWith<$Res> {
  _$CharacterSheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterSheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? modifiers = null,
    Object? hitPoints = null,
    Object? armorClass = null,
    Object? initiative = null,
    Object? speed = null,
    Object? proficiencyBonus = null,
    Object? savingThrows = null,
    Object? skills = null,
    Object? passivePerception = null,
  }) {
    return _then(_value.copyWith(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Attributes,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as Attributes,
      hitPoints: null == hitPoints
          ? _value.hitPoints
          : hitPoints // ignore: cast_nullable_to_non_nullable
              as int,
      armorClass: null == armorClass
          ? _value.armorClass
          : armorClass // ignore: cast_nullable_to_non_nullable
              as int,
      initiative: null == initiative
          ? _value.initiative
          : initiative // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      proficiencyBonus: null == proficiencyBonus
          ? _value.proficiencyBonus
          : proficiencyBonus // ignore: cast_nullable_to_non_nullable
              as int,
      savingThrows: null == savingThrows
          ? _value.savingThrows
          : savingThrows // ignore: cast_nullable_to_non_nullable
              as List<SavingThrow>,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillCheck>,
      passivePerception: null == passivePerception
          ? _value.passivePerception
          : passivePerception // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of CharacterSheet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get stats {
    return $AttributesCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  /// Create a copy of CharacterSheet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get modifiers {
    return $AttributesCopyWith<$Res>(_value.modifiers, (value) {
      return _then(_value.copyWith(modifiers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterSheetImplCopyWith<$Res>
    implements $CharacterSheetCopyWith<$Res> {
  factory _$$CharacterSheetImplCopyWith(_$CharacterSheetImpl value,
          $Res Function(_$CharacterSheetImpl) then) =
      __$$CharacterSheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Attributes stats,
      Attributes modifiers,
      int hitPoints,
      int armorClass,
      int initiative,
      int speed,
      int proficiencyBonus,
      List<SavingThrow> savingThrows,
      List<SkillCheck> skills,
      int passivePerception});

  @override
  $AttributesCopyWith<$Res> get stats;
  @override
  $AttributesCopyWith<$Res> get modifiers;
}

/// @nodoc
class __$$CharacterSheetImplCopyWithImpl<$Res>
    extends _$CharacterSheetCopyWithImpl<$Res, _$CharacterSheetImpl>
    implements _$$CharacterSheetImplCopyWith<$Res> {
  __$$CharacterSheetImplCopyWithImpl(
      _$CharacterSheetImpl _value, $Res Function(_$CharacterSheetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterSheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? modifiers = null,
    Object? hitPoints = null,
    Object? armorClass = null,
    Object? initiative = null,
    Object? speed = null,
    Object? proficiencyBonus = null,
    Object? savingThrows = null,
    Object? skills = null,
    Object? passivePerception = null,
  }) {
    return _then(_$CharacterSheetImpl(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Attributes,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as Attributes,
      hitPoints: null == hitPoints
          ? _value.hitPoints
          : hitPoints // ignore: cast_nullable_to_non_nullable
              as int,
      armorClass: null == armorClass
          ? _value.armorClass
          : armorClass // ignore: cast_nullable_to_non_nullable
              as int,
      initiative: null == initiative
          ? _value.initiative
          : initiative // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      proficiencyBonus: null == proficiencyBonus
          ? _value.proficiencyBonus
          : proficiencyBonus // ignore: cast_nullable_to_non_nullable
              as int,
      savingThrows: null == savingThrows
          ? _value._savingThrows
          : savingThrows // ignore: cast_nullable_to_non_nullable
              as List<SavingThrow>,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillCheck>,
      passivePerception: null == passivePerception
          ? _value.passivePerception
          : passivePerception // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterSheetImpl implements _CharacterSheet {
  const _$CharacterSheetImpl(
      {required this.stats,
      required this.modifiers,
      required this.hitPoints,
      required this.armorClass,
      required this.initiative,
      required this.speed,
      required this.proficiencyBonus,
      required final List<SavingThrow> savingThrows,
      final List<SkillCheck> skills = const [],
      this.passivePerception = 10})
      : _savingThrows = savingThrows,
        _skills = skills;

  factory _$CharacterSheetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterSheetImplFromJson(json);

  @override
  final Attributes stats;
  @override
  final Attributes modifiers;
  @override
  final int hitPoints;
  @override
  final int armorClass;
  @override
  final int initiative;
  @override
  final int speed;
  @override
  final int proficiencyBonus;
  final List<SavingThrow> _savingThrows;
  @override
  List<SavingThrow> get savingThrows {
    if (_savingThrows is EqualUnmodifiableListView) return _savingThrows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savingThrows);
  }

  final List<SkillCheck> _skills;
  @override
  @JsonKey()
  List<SkillCheck> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  @JsonKey()
  final int passivePerception;

  @override
  String toString() {
    return 'CharacterSheet(stats: $stats, modifiers: $modifiers, hitPoints: $hitPoints, armorClass: $armorClass, initiative: $initiative, speed: $speed, proficiencyBonus: $proficiencyBonus, savingThrows: $savingThrows, skills: $skills, passivePerception: $passivePerception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterSheetImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.modifiers, modifiers) ||
                other.modifiers == modifiers) &&
            (identical(other.hitPoints, hitPoints) ||
                other.hitPoints == hitPoints) &&
            (identical(other.armorClass, armorClass) ||
                other.armorClass == armorClass) &&
            (identical(other.initiative, initiative) ||
                other.initiative == initiative) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.proficiencyBonus, proficiencyBonus) ||
                other.proficiencyBonus == proficiencyBonus) &&
            const DeepCollectionEquality()
                .equals(other._savingThrows, _savingThrows) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.passivePerception, passivePerception) ||
                other.passivePerception == passivePerception));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stats,
      modifiers,
      hitPoints,
      armorClass,
      initiative,
      speed,
      proficiencyBonus,
      const DeepCollectionEquality().hash(_savingThrows),
      const DeepCollectionEquality().hash(_skills),
      passivePerception);

  /// Create a copy of CharacterSheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterSheetImplCopyWith<_$CharacterSheetImpl> get copyWith =>
      __$$CharacterSheetImplCopyWithImpl<_$CharacterSheetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterSheetImplToJson(
      this,
    );
  }
}

abstract class _CharacterSheet implements CharacterSheet {
  const factory _CharacterSheet(
      {required final Attributes stats,
      required final Attributes modifiers,
      required final int hitPoints,
      required final int armorClass,
      required final int initiative,
      required final int speed,
      required final int proficiencyBonus,
      required final List<SavingThrow> savingThrows,
      final List<SkillCheck> skills,
      final int passivePerception}) = _$CharacterSheetImpl;

  factory _CharacterSheet.fromJson(Map<String, dynamic> json) =
      _$CharacterSheetImpl.fromJson;

  @override
  Attributes get stats;
  @override
  Attributes get modifiers;
  @override
  int get hitPoints;
  @override
  int get armorClass;
  @override
  int get initiative;
  @override
  int get speed;
  @override
  int get proficiencyBonus;
  @override
  List<SavingThrow> get savingThrows;
  @override
  List<SkillCheck> get skills;
  @override
  int get passivePerception;

  /// Create a copy of CharacterSheet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterSheetImplCopyWith<_$CharacterSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SavingThrow _$SavingThrowFromJson(Map<String, dynamic> json) {
  return _SavingThrow.fromJson(json);
}

/// @nodoc
mixin _$SavingThrow {
  Ability get ability => throw _privateConstructorUsedError;
  int get bonus => throw _privateConstructorUsedError;
  bool get proficient => throw _privateConstructorUsedError;

  /// Serializes this SavingThrow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavingThrow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavingThrowCopyWith<SavingThrow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingThrowCopyWith<$Res> {
  factory $SavingThrowCopyWith(
          SavingThrow value, $Res Function(SavingThrow) then) =
      _$SavingThrowCopyWithImpl<$Res, SavingThrow>;
  @useResult
  $Res call({Ability ability, int bonus, bool proficient});
}

/// @nodoc
class _$SavingThrowCopyWithImpl<$Res, $Val extends SavingThrow>
    implements $SavingThrowCopyWith<$Res> {
  _$SavingThrowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavingThrow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ability = null,
    Object? bonus = null,
    Object? proficient = null,
  }) {
    return _then(_value.copyWith(
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability,
      bonus: null == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int,
      proficient: null == proficient
          ? _value.proficient
          : proficient // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavingThrowImplCopyWith<$Res>
    implements $SavingThrowCopyWith<$Res> {
  factory _$$SavingThrowImplCopyWith(
          _$SavingThrowImpl value, $Res Function(_$SavingThrowImpl) then) =
      __$$SavingThrowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ability ability, int bonus, bool proficient});
}

/// @nodoc
class __$$SavingThrowImplCopyWithImpl<$Res>
    extends _$SavingThrowCopyWithImpl<$Res, _$SavingThrowImpl>
    implements _$$SavingThrowImplCopyWith<$Res> {
  __$$SavingThrowImplCopyWithImpl(
      _$SavingThrowImpl _value, $Res Function(_$SavingThrowImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingThrow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ability = null,
    Object? bonus = null,
    Object? proficient = null,
  }) {
    return _then(_$SavingThrowImpl(
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability,
      bonus: null == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int,
      proficient: null == proficient
          ? _value.proficient
          : proficient // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavingThrowImpl implements _SavingThrow {
  const _$SavingThrowImpl(
      {required this.ability, required this.bonus, required this.proficient});

  factory _$SavingThrowImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavingThrowImplFromJson(json);

  @override
  final Ability ability;
  @override
  final int bonus;
  @override
  final bool proficient;

  @override
  String toString() {
    return 'SavingThrow(ability: $ability, bonus: $bonus, proficient: $proficient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingThrowImpl &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.proficient, proficient) ||
                other.proficient == proficient));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ability, bonus, proficient);

  /// Create a copy of SavingThrow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingThrowImplCopyWith<_$SavingThrowImpl> get copyWith =>
      __$$SavingThrowImplCopyWithImpl<_$SavingThrowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavingThrowImplToJson(
      this,
    );
  }
}

abstract class _SavingThrow implements SavingThrow {
  const factory _SavingThrow(
      {required final Ability ability,
      required final int bonus,
      required final bool proficient}) = _$SavingThrowImpl;

  factory _SavingThrow.fromJson(Map<String, dynamic> json) =
      _$SavingThrowImpl.fromJson;

  @override
  Ability get ability;
  @override
  int get bonus;
  @override
  bool get proficient;

  /// Create a copy of SavingThrow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavingThrowImplCopyWith<_$SavingThrowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SkillCheck _$SkillCheckFromJson(Map<String, dynamic> json) {
  return _SkillCheck.fromJson(json);
}

/// @nodoc
mixin _$SkillCheck {
  Skill get skill => throw _privateConstructorUsedError;
  Ability get ability => throw _privateConstructorUsedError;
  int get bonus => throw _privateConstructorUsedError;
  bool get proficient => throw _privateConstructorUsedError;
  bool get expertise => throw _privateConstructorUsedError;

  /// Serializes this SkillCheck to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCheckCopyWith<SkillCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCheckCopyWith<$Res> {
  factory $SkillCheckCopyWith(
          SkillCheck value, $Res Function(SkillCheck) then) =
      _$SkillCheckCopyWithImpl<$Res, SkillCheck>;
  @useResult
  $Res call(
      {Skill skill,
      Ability ability,
      int bonus,
      bool proficient,
      bool expertise});
}

/// @nodoc
class _$SkillCheckCopyWithImpl<$Res, $Val extends SkillCheck>
    implements $SkillCheckCopyWith<$Res> {
  _$SkillCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill = null,
    Object? ability = null,
    Object? bonus = null,
    Object? proficient = null,
    Object? expertise = null,
  }) {
    return _then(_value.copyWith(
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as Skill,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability,
      bonus: null == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int,
      proficient: null == proficient
          ? _value.proficient
          : proficient // ignore: cast_nullable_to_non_nullable
              as bool,
      expertise: null == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillCheckImplCopyWith<$Res>
    implements $SkillCheckCopyWith<$Res> {
  factory _$$SkillCheckImplCopyWith(
          _$SkillCheckImpl value, $Res Function(_$SkillCheckImpl) then) =
      __$$SkillCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Skill skill,
      Ability ability,
      int bonus,
      bool proficient,
      bool expertise});
}

/// @nodoc
class __$$SkillCheckImplCopyWithImpl<$Res>
    extends _$SkillCheckCopyWithImpl<$Res, _$SkillCheckImpl>
    implements _$$SkillCheckImplCopyWith<$Res> {
  __$$SkillCheckImplCopyWithImpl(
      _$SkillCheckImpl _value, $Res Function(_$SkillCheckImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill = null,
    Object? ability = null,
    Object? bonus = null,
    Object? proficient = null,
    Object? expertise = null,
  }) {
    return _then(_$SkillCheckImpl(
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as Skill,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability,
      bonus: null == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int,
      proficient: null == proficient
          ? _value.proficient
          : proficient // ignore: cast_nullable_to_non_nullable
              as bool,
      expertise: null == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillCheckImpl implements _SkillCheck {
  const _$SkillCheckImpl(
      {required this.skill,
      required this.ability,
      required this.bonus,
      required this.proficient,
      required this.expertise});

  factory _$SkillCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillCheckImplFromJson(json);

  @override
  final Skill skill;
  @override
  final Ability ability;
  @override
  final int bonus;
  @override
  final bool proficient;
  @override
  final bool expertise;

  @override
  String toString() {
    return 'SkillCheck(skill: $skill, ability: $ability, bonus: $bonus, proficient: $proficient, expertise: $expertise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillCheckImpl &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.proficient, proficient) ||
                other.proficient == proficient) &&
            (identical(other.expertise, expertise) ||
                other.expertise == expertise));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, skill, ability, bonus, proficient, expertise);

  /// Create a copy of SkillCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillCheckImplCopyWith<_$SkillCheckImpl> get copyWith =>
      __$$SkillCheckImplCopyWithImpl<_$SkillCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillCheckImplToJson(
      this,
    );
  }
}

abstract class _SkillCheck implements SkillCheck {
  const factory _SkillCheck(
      {required final Skill skill,
      required final Ability ability,
      required final int bonus,
      required final bool proficient,
      required final bool expertise}) = _$SkillCheckImpl;

  factory _SkillCheck.fromJson(Map<String, dynamic> json) =
      _$SkillCheckImpl.fromJson;

  @override
  Skill get skill;
  @override
  Ability get ability;
  @override
  int get bonus;
  @override
  bool get proficient;
  @override
  bool get expertise;

  /// Create a copy of SkillCheck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillCheckImplCopyWith<_$SkillCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
