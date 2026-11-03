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
  /// Код предыстории на сервере
  int get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Навыки, которые даёт предыстория
  List<Skill> get skills => throw _privateConstructorUsedError;

  /// Сколько навыков игрок выбирает сам (своя предыстория)
  int get skillChoices => throw _privateConstructorUsedError;
  String get tools => throw _privateConstructorUsedError;
  String get languages => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get feature => throw _privateConstructorUsedError;

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
      {int type,
      String name,
      String description,
      List<Skill> skills,
      int skillChoices,
      String tools,
      String languages,
      String equipment,
      String feature});
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
    Object? type = null,
    Object? name = null,
    Object? description = null,
    Object? skills = null,
    Object? skillChoices = null,
    Object? tools = null,
    Object? languages = null,
    Object? equipment = null,
    Object? feature = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      skillChoices: null == skillChoices
          ? _value.skillChoices
          : skillChoices // ignore: cast_nullable_to_non_nullable
              as int,
      tools: null == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
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
      {int type,
      String name,
      String description,
      List<Skill> skills,
      int skillChoices,
      String tools,
      String languages,
      String equipment,
      String feature});
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
    Object? type = null,
    Object? name = null,
    Object? description = null,
    Object? skills = null,
    Object? skillChoices = null,
    Object? tools = null,
    Object? languages = null,
    Object? equipment = null,
    Object? feature = null,
  }) {
    return _then(_$BackgroundImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      skillChoices: null == skillChoices
          ? _value.skillChoices
          : skillChoices // ignore: cast_nullable_to_non_nullable
              as int,
      tools: null == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackgroundImpl implements _Background {
  const _$BackgroundImpl(
      {required this.type,
      required this.name,
      required this.description,
      final List<Skill> skills = const [],
      this.skillChoices = 0,
      this.tools = '',
      this.languages = '',
      this.equipment = '',
      this.feature = ''})
      : _skills = skills;

  factory _$BackgroundImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackgroundImplFromJson(json);

  /// Код предыстории на сервере
  @override
  final int type;
  @override
  final String name;
  @override
  final String description;

  /// Навыки, которые даёт предыстория
  final List<Skill> _skills;

  /// Навыки, которые даёт предыстория
  @override
  @JsonKey()
  List<Skill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  /// Сколько навыков игрок выбирает сам (своя предыстория)
  @override
  @JsonKey()
  final int skillChoices;
  @override
  @JsonKey()
  final String tools;
  @override
  @JsonKey()
  final String languages;
  @override
  @JsonKey()
  final String equipment;
  @override
  @JsonKey()
  final String feature;

  @override
  String toString() {
    return 'Background(type: $type, name: $name, description: $description, skills: $skills, skillChoices: $skillChoices, tools: $tools, languages: $languages, equipment: $equipment, feature: $feature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackgroundImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.skillChoices, skillChoices) ||
                other.skillChoices == skillChoices) &&
            (identical(other.tools, tools) || other.tools == tools) &&
            (identical(other.languages, languages) ||
                other.languages == languages) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.feature, feature) || other.feature == feature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      name,
      description,
      const DeepCollectionEquality().hash(_skills),
      skillChoices,
      tools,
      languages,
      equipment,
      feature);

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
  const factory _Background(
      {required final int type,
      required final String name,
      required final String description,
      final List<Skill> skills,
      final int skillChoices,
      final String tools,
      final String languages,
      final String equipment,
      final String feature}) = _$BackgroundImpl;

  factory _Background.fromJson(Map<String, dynamic> json) =
      _$BackgroundImpl.fromJson;

  /// Код предыстории на сервере
  @override
  int get type;
  @override
  String get name;
  @override
  String get description;

  /// Навыки, которые даёт предыстория
  @override
  List<Skill> get skills;

  /// Сколько навыков игрок выбирает сам (своя предыстория)
  @override
  int get skillChoices;
  @override
  String get tools;
  @override
  String get languages;
  @override
  String get equipment;
  @override
  String get feature;

  /// Create a copy of Background
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackgroundImplCopyWith<_$BackgroundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
