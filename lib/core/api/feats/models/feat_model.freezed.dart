// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Feat _$FeatFromJson(Map<String, dynamic> json) {
  return _Feat.fromJson(json);
}

/// @nodoc
mixin _$Feat {
  String get slug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get prerequisite => throw _privateConstructorUsedError;
  @JsonKey(name: 'effects_desc')
  List<String>? get effectsDesc => throw _privateConstructorUsedError;

  /// Serializes this Feat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Feat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatCopyWith<Feat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatCopyWith<$Res> {
  factory $FeatCopyWith(Feat value, $Res Function(Feat) then) =
      _$FeatCopyWithImpl<$Res, Feat>;
  @useResult
  $Res call(
      {String slug,
      String name,
      String? desc,
      String? prerequisite,
      @JsonKey(name: 'effects_desc') List<String>? effectsDesc});
}

/// @nodoc
class _$FeatCopyWithImpl<$Res, $Val extends Feat>
    implements $FeatCopyWith<$Res> {
  _$FeatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? name = null,
    Object? desc = freezed,
    Object? prerequisite = freezed,
    Object? effectsDesc = freezed,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisite: freezed == prerequisite
          ? _value.prerequisite
          : prerequisite // ignore: cast_nullable_to_non_nullable
              as String?,
      effectsDesc: freezed == effectsDesc
          ? _value.effectsDesc
          : effectsDesc // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatImplCopyWith<$Res> implements $FeatCopyWith<$Res> {
  factory _$$FeatImplCopyWith(
          _$FeatImpl value, $Res Function(_$FeatImpl) then) =
      __$$FeatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String slug,
      String name,
      String? desc,
      String? prerequisite,
      @JsonKey(name: 'effects_desc') List<String>? effectsDesc});
}

/// @nodoc
class __$$FeatImplCopyWithImpl<$Res>
    extends _$FeatCopyWithImpl<$Res, _$FeatImpl>
    implements _$$FeatImplCopyWith<$Res> {
  __$$FeatImplCopyWithImpl(_$FeatImpl _value, $Res Function(_$FeatImpl) _then)
      : super(_value, _then);

  /// Create a copy of Feat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? name = null,
    Object? desc = freezed,
    Object? prerequisite = freezed,
    Object? effectsDesc = freezed,
  }) {
    return _then(_$FeatImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisite: freezed == prerequisite
          ? _value.prerequisite
          : prerequisite // ignore: cast_nullable_to_non_nullable
              as String?,
      effectsDesc: freezed == effectsDesc
          ? _value._effectsDesc
          : effectsDesc // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatImpl implements _Feat {
  _$FeatImpl(
      {required this.slug,
      required this.name,
      required this.desc,
      required this.prerequisite,
      @JsonKey(name: 'effects_desc') required final List<String>? effectsDesc})
      : _effectsDesc = effectsDesc;

  factory _$FeatImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatImplFromJson(json);

  @override
  final String slug;
  @override
  final String name;
  @override
  final String? desc;
  @override
  final String? prerequisite;
  final List<String>? _effectsDesc;
  @override
  @JsonKey(name: 'effects_desc')
  List<String>? get effectsDesc {
    final value = _effectsDesc;
    if (value == null) return null;
    if (_effectsDesc is EqualUnmodifiableListView) return _effectsDesc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Feat(slug: $slug, name: $name, desc: $desc, prerequisite: $prerequisite, effectsDesc: $effectsDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.prerequisite, prerequisite) ||
                other.prerequisite == prerequisite) &&
            const DeepCollectionEquality()
                .equals(other._effectsDesc, _effectsDesc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slug, name, desc, prerequisite,
      const DeepCollectionEquality().hash(_effectsDesc));

  /// Create a copy of Feat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatImplCopyWith<_$FeatImpl> get copyWith =>
      __$$FeatImplCopyWithImpl<_$FeatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatImplToJson(
      this,
    );
  }
}

abstract class _Feat implements Feat {
  factory _Feat(
      {required final String slug,
      required final String name,
      required final String? desc,
      required final String? prerequisite,
      @JsonKey(name: 'effects_desc')
      required final List<String>? effectsDesc}) = _$FeatImpl;

  factory _Feat.fromJson(Map<String, dynamic> json) = _$FeatImpl.fromJson;

  @override
  String get slug;
  @override
  String get name;
  @override
  String? get desc;
  @override
  String? get prerequisite;
  @override
  @JsonKey(name: 'effects_desc')
  List<String>? get effectsDesc;

  /// Create a copy of Feat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatImplCopyWith<_$FeatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
