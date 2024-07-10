// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attributes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return _Attributes.fromJson(json);
}

/// @nodoc
mixin _$Attributes {
  int get strength => throw _privateConstructorUsedError;
  int get dexterity => throw _privateConstructorUsedError;
  int get agility => throw _privateConstructorUsedError;
  int get constitution => throw _privateConstructorUsedError;
  int get intelligence => throw _privateConstructorUsedError;
  int get charisma => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributesCopyWith<Attributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributesCopyWith<$Res> {
  factory $AttributesCopyWith(
          Attributes value, $Res Function(Attributes) then) =
      _$AttributesCopyWithImpl<$Res, Attributes>;
  @useResult
  $Res call(
      {int strength,
      int dexterity,
      int agility,
      int constitution,
      int intelligence,
      int charisma});
}

/// @nodoc
class _$AttributesCopyWithImpl<$Res, $Val extends Attributes>
    implements $AttributesCopyWith<$Res> {
  _$AttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strength = null,
    Object? dexterity = null,
    Object? agility = null,
    Object? constitution = null,
    Object? intelligence = null,
    Object? charisma = null,
  }) {
    return _then(_value.copyWith(
      strength: null == strength
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      dexterity: null == dexterity
          ? _value.dexterity
          : dexterity // ignore: cast_nullable_to_non_nullable
              as int,
      agility: null == agility
          ? _value.agility
          : agility // ignore: cast_nullable_to_non_nullable
              as int,
      constitution: null == constitution
          ? _value.constitution
          : constitution // ignore: cast_nullable_to_non_nullable
              as int,
      intelligence: null == intelligence
          ? _value.intelligence
          : intelligence // ignore: cast_nullable_to_non_nullable
              as int,
      charisma: null == charisma
          ? _value.charisma
          : charisma // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttributesImplCopyWith<$Res>
    implements $AttributesCopyWith<$Res> {
  factory _$$AttributesImplCopyWith(
          _$AttributesImpl value, $Res Function(_$AttributesImpl) then) =
      __$$AttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int strength,
      int dexterity,
      int agility,
      int constitution,
      int intelligence,
      int charisma});
}

/// @nodoc
class __$$AttributesImplCopyWithImpl<$Res>
    extends _$AttributesCopyWithImpl<$Res, _$AttributesImpl>
    implements _$$AttributesImplCopyWith<$Res> {
  __$$AttributesImplCopyWithImpl(
      _$AttributesImpl _value, $Res Function(_$AttributesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strength = null,
    Object? dexterity = null,
    Object? agility = null,
    Object? constitution = null,
    Object? intelligence = null,
    Object? charisma = null,
  }) {
    return _then(_$AttributesImpl(
      strength: null == strength
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      dexterity: null == dexterity
          ? _value.dexterity
          : dexterity // ignore: cast_nullable_to_non_nullable
              as int,
      agility: null == agility
          ? _value.agility
          : agility // ignore: cast_nullable_to_non_nullable
              as int,
      constitution: null == constitution
          ? _value.constitution
          : constitution // ignore: cast_nullable_to_non_nullable
              as int,
      intelligence: null == intelligence
          ? _value.intelligence
          : intelligence // ignore: cast_nullable_to_non_nullable
              as int,
      charisma: null == charisma
          ? _value.charisma
          : charisma // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttributesImpl implements _Attributes {
  _$AttributesImpl(
      {this.strength = 0,
      this.dexterity = 0,
      this.agility = 0,
      this.constitution = 0,
      this.intelligence = 0,
      this.charisma = 0});

  factory _$AttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributesImplFromJson(json);

  @override
  @JsonKey()
  final int strength;
  @override
  @JsonKey()
  final int dexterity;
  @override
  @JsonKey()
  final int agility;
  @override
  @JsonKey()
  final int constitution;
  @override
  @JsonKey()
  final int intelligence;
  @override
  @JsonKey()
  final int charisma;

  @override
  String toString() {
    return 'Attributes(strength: $strength, dexterity: $dexterity, agility: $agility, constitution: $constitution, intelligence: $intelligence, charisma: $charisma)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributesImpl &&
            (identical(other.strength, strength) ||
                other.strength == strength) &&
            (identical(other.dexterity, dexterity) ||
                other.dexterity == dexterity) &&
            (identical(other.agility, agility) || other.agility == agility) &&
            (identical(other.constitution, constitution) ||
                other.constitution == constitution) &&
            (identical(other.intelligence, intelligence) ||
                other.intelligence == intelligence) &&
            (identical(other.charisma, charisma) ||
                other.charisma == charisma));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, strength, dexterity, agility,
      constitution, intelligence, charisma);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributesImplCopyWith<_$AttributesImpl> get copyWith =>
      __$$AttributesImplCopyWithImpl<_$AttributesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributesImplToJson(
      this,
    );
  }
}

abstract class _Attributes implements Attributes {
  factory _Attributes(
      {final int strength,
      final int dexterity,
      final int agility,
      final int constitution,
      final int intelligence,
      final int charisma}) = _$AttributesImpl;

  factory _Attributes.fromJson(Map<String, dynamic> json) =
      _$AttributesImpl.fromJson;

  @override
  int get strength;
  @override
  int get dexterity;
  @override
  int get agility;
  @override
  int get constitution;
  @override
  int get intelligence;
  @override
  int get charisma;
  @override
  @JsonKey(ignore: true)
  _$$AttributesImplCopyWith<_$AttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
