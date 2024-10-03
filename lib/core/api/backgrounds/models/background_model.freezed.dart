// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Background _$BackgroundFromJson(Map<String, dynamic> json) {
  return _Background.fromJson(json);
}

/// @nodoc
mixin _$Background {
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'skill_proficiencies')
  String? get skillProficiencies => throw _privateConstructorUsedError;
  @JsonKey(name: 'tool_proficiencies')
  String? get toolProficiencies => throw _privateConstructorUsedError;
  String? get languages => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get feature => throw _privateConstructorUsedError;
  @JsonKey(name: 'feature_desc')
  String get featureDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'suggested_characteristics')
  String get suggestedCharacteristics => throw _privateConstructorUsedError;

  /// Serializes this Background to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Background
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackgroundCopyWith<Background> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackgroundCopyWith<$Res> {
  factory $BackgroundCopyWith(
          Background value, $Res Function(Background) then) =
      _$BackgroundCopyWithImpl<$Res, Background>;
  @useResult
  $Res call(
      {String name,
      String slug,
      String desc,
      @JsonKey(name: 'skill_proficiencies') String? skillProficiencies,
      @JsonKey(name: 'tool_proficiencies') String? toolProficiencies,
      String? languages,
      String equipment,
      String feature,
      @JsonKey(name: 'feature_desc') String featureDesc,
      @JsonKey(name: 'suggested_characteristics')
      String suggestedCharacteristics});
}

/// @nodoc
class _$BackgroundCopyWithImpl<$Res, $Val extends Background>
    implements $BackgroundCopyWith<$Res> {
  _$BackgroundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Background
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? slug = null,
    Object? desc = null,
    Object? skillProficiencies = freezed,
    Object? toolProficiencies = freezed,
    Object? languages = freezed,
    Object? equipment = null,
    Object? feature = null,
    Object? featureDesc = null,
    Object? suggestedCharacteristics = null,
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
      skillProficiencies: freezed == skillProficiencies
          ? _value.skillProficiencies
          : skillProficiencies // ignore: cast_nullable_to_non_nullable
              as String?,
      toolProficiencies: freezed == toolProficiencies
          ? _value.toolProficiencies
          : toolProficiencies // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
      featureDesc: null == featureDesc
          ? _value.featureDesc
          : featureDesc // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedCharacteristics: null == suggestedCharacteristics
          ? _value.suggestedCharacteristics
          : suggestedCharacteristics // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackgroundImplCopyWith<$Res>
    implements $BackgroundCopyWith<$Res> {
  factory _$$BackgroundImplCopyWith(
          _$BackgroundImpl value, $Res Function(_$BackgroundImpl) then) =
      __$$BackgroundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String slug,
      String desc,
      @JsonKey(name: 'skill_proficiencies') String? skillProficiencies,
      @JsonKey(name: 'tool_proficiencies') String? toolProficiencies,
      String? languages,
      String equipment,
      String feature,
      @JsonKey(name: 'feature_desc') String featureDesc,
      @JsonKey(name: 'suggested_characteristics')
      String suggestedCharacteristics});
}

/// @nodoc
class __$$BackgroundImplCopyWithImpl<$Res>
    extends _$BackgroundCopyWithImpl<$Res, _$BackgroundImpl>
    implements _$$BackgroundImplCopyWith<$Res> {
  __$$BackgroundImplCopyWithImpl(
      _$BackgroundImpl _value, $Res Function(_$BackgroundImpl) _then)
      : super(_value, _then);

  /// Create a copy of Background
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? slug = null,
    Object? desc = null,
    Object? skillProficiencies = freezed,
    Object? toolProficiencies = freezed,
    Object? languages = freezed,
    Object? equipment = null,
    Object? feature = null,
    Object? featureDesc = null,
    Object? suggestedCharacteristics = null,
  }) {
    return _then(_$BackgroundImpl(
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
      skillProficiencies: freezed == skillProficiencies
          ? _value.skillProficiencies
          : skillProficiencies // ignore: cast_nullable_to_non_nullable
              as String?,
      toolProficiencies: freezed == toolProficiencies
          ? _value.toolProficiencies
          : toolProficiencies // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
      featureDesc: null == featureDesc
          ? _value.featureDesc
          : featureDesc // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedCharacteristics: null == suggestedCharacteristics
          ? _value.suggestedCharacteristics
          : suggestedCharacteristics // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackgroundImpl implements _Background {
  _$BackgroundImpl(
      {required this.name,
      required this.slug,
      required this.desc,
      @JsonKey(name: 'skill_proficiencies') this.skillProficiencies,
      @JsonKey(name: 'tool_proficiencies') this.toolProficiencies,
      this.languages,
      required this.equipment,
      required this.feature,
      @JsonKey(name: 'feature_desc') required this.featureDesc,
      @JsonKey(name: 'suggested_characteristics')
      required this.suggestedCharacteristics});

  factory _$BackgroundImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackgroundImplFromJson(json);

  @override
  final String name;
  @override
  final String slug;
  @override
  final String desc;
  @override
  @JsonKey(name: 'skill_proficiencies')
  final String? skillProficiencies;
  @override
  @JsonKey(name: 'tool_proficiencies')
  final String? toolProficiencies;
  @override
  final String? languages;
  @override
  final String equipment;
  @override
  final String feature;
  @override
  @JsonKey(name: 'feature_desc')
  final String featureDesc;
  @override
  @JsonKey(name: 'suggested_characteristics')
  final String suggestedCharacteristics;

  @override
  String toString() {
    return 'Background(name: $name, slug: $slug, desc: $desc, skillProficiencies: $skillProficiencies, toolProficiencies: $toolProficiencies, languages: $languages, equipment: $equipment, feature: $feature, featureDesc: $featureDesc, suggestedCharacteristics: $suggestedCharacteristics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackgroundImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.skillProficiencies, skillProficiencies) ||
                other.skillProficiencies == skillProficiencies) &&
            (identical(other.toolProficiencies, toolProficiencies) ||
                other.toolProficiencies == toolProficiencies) &&
            (identical(other.languages, languages) ||
                other.languages == languages) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.feature, feature) || other.feature == feature) &&
            (identical(other.featureDesc, featureDesc) ||
                other.featureDesc == featureDesc) &&
            (identical(
                    other.suggestedCharacteristics, suggestedCharacteristics) ||
                other.suggestedCharacteristics == suggestedCharacteristics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      slug,
      desc,
      skillProficiencies,
      toolProficiencies,
      languages,
      equipment,
      feature,
      featureDesc,
      suggestedCharacteristics);

  /// Create a copy of Background
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackgroundImplCopyWith<_$BackgroundImpl> get copyWith =>
      __$$BackgroundImplCopyWithImpl<_$BackgroundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackgroundImplToJson(
      this,
    );
  }
}

abstract class _Background implements Background {
  factory _Background(
      {required final String name,
      required final String slug,
      required final String desc,
      @JsonKey(name: 'skill_proficiencies') final String? skillProficiencies,
      @JsonKey(name: 'tool_proficiencies') final String? toolProficiencies,
      final String? languages,
      required final String equipment,
      required final String feature,
      @JsonKey(name: 'feature_desc') required final String featureDesc,
      @JsonKey(name: 'suggested_characteristics')
      required final String suggestedCharacteristics}) = _$BackgroundImpl;

  factory _Background.fromJson(Map<String, dynamic> json) =
      _$BackgroundImpl.fromJson;

  @override
  String get name;
  @override
  String get slug;
  @override
  String get desc;
  @override
  @JsonKey(name: 'skill_proficiencies')
  String? get skillProficiencies;
  @override
  @JsonKey(name: 'tool_proficiencies')
  String? get toolProficiencies;
  @override
  String? get languages;
  @override
  String get equipment;
  @override
  String get feature;
  @override
  @JsonKey(name: 'feature_desc')
  String get featureDesc;
  @override
  @JsonKey(name: 'suggested_characteristics')
  String get suggestedCharacteristics;

  /// Create a copy of Background
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackgroundImplCopyWith<_$BackgroundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
