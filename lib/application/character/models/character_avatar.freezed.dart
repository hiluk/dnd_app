// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_avatar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterAvatar _$CharacterAvatarFromJson(Map<String, dynamic> json) {
  return _CharacterAvatar.fromJson(json);
}

/// @nodoc
mixin _$CharacterAvatar {
  /// Адрес файла относительно API; меняется при каждой загрузке
  String get url => throw _privateConstructorUsedError;

  /// Фон по краям прозрачный: можно показать фигурой
  bool get hasTransparency => throw _privateConstructorUsedError;
  AvatarMode get mode => throw _privateConstructorUsedError;
  double get offsetX => throw _privateConstructorUsedError;
  double get offsetY => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;

  /// Serializes this CharacterAvatar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterAvatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterAvatarCopyWith<CharacterAvatar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterAvatarCopyWith<$Res> {
  factory $CharacterAvatarCopyWith(
          CharacterAvatar value, $Res Function(CharacterAvatar) then) =
      _$CharacterAvatarCopyWithImpl<$Res, CharacterAvatar>;
  @useResult
  $Res call(
      {String url,
      bool hasTransparency,
      AvatarMode mode,
      double offsetX,
      double offsetY,
      double scale});
}

/// @nodoc
class _$CharacterAvatarCopyWithImpl<$Res, $Val extends CharacterAvatar>
    implements $CharacterAvatarCopyWith<$Res> {
  _$CharacterAvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterAvatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? hasTransparency = null,
    Object? mode = null,
    Object? offsetX = null,
    Object? offsetY = null,
    Object? scale = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hasTransparency: null == hasTransparency
          ? _value.hasTransparency
          : hasTransparency // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AvatarMode,
      offsetX: null == offsetX
          ? _value.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _value.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterAvatarImplCopyWith<$Res>
    implements $CharacterAvatarCopyWith<$Res> {
  factory _$$CharacterAvatarImplCopyWith(_$CharacterAvatarImpl value,
          $Res Function(_$CharacterAvatarImpl) then) =
      __$$CharacterAvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      bool hasTransparency,
      AvatarMode mode,
      double offsetX,
      double offsetY,
      double scale});
}

/// @nodoc
class __$$CharacterAvatarImplCopyWithImpl<$Res>
    extends _$CharacterAvatarCopyWithImpl<$Res, _$CharacterAvatarImpl>
    implements _$$CharacterAvatarImplCopyWith<$Res> {
  __$$CharacterAvatarImplCopyWithImpl(
      _$CharacterAvatarImpl _value, $Res Function(_$CharacterAvatarImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterAvatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? hasTransparency = null,
    Object? mode = null,
    Object? offsetX = null,
    Object? offsetY = null,
    Object? scale = null,
  }) {
    return _then(_$CharacterAvatarImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hasTransparency: null == hasTransparency
          ? _value.hasTransparency
          : hasTransparency // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AvatarMode,
      offsetX: null == offsetX
          ? _value.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _value.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterAvatarImpl extends _CharacterAvatar {
  const _$CharacterAvatarImpl(
      {required this.url,
      this.hasTransparency = false,
      this.mode = AvatarMode.frame,
      this.offsetX = 0,
      this.offsetY = 0,
      this.scale = 1})
      : super._();

  factory _$CharacterAvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterAvatarImplFromJson(json);

  /// Адрес файла относительно API; меняется при каждой загрузке
  @override
  final String url;

  /// Фон по краям прозрачный: можно показать фигурой
  @override
  @JsonKey()
  final bool hasTransparency;
  @override
  @JsonKey()
  final AvatarMode mode;
  @override
  @JsonKey()
  final double offsetX;
  @override
  @JsonKey()
  final double offsetY;
  @override
  @JsonKey()
  final double scale;

  @override
  String toString() {
    return 'CharacterAvatar(url: $url, hasTransparency: $hasTransparency, mode: $mode, offsetX: $offsetX, offsetY: $offsetY, scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterAvatarImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.hasTransparency, hasTransparency) ||
                other.hasTransparency == hasTransparency) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.offsetX, offsetX) || other.offsetX == offsetX) &&
            (identical(other.offsetY, offsetY) || other.offsetY == offsetY) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, hasTransparency, mode, offsetX, offsetY, scale);

  /// Create a copy of CharacterAvatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterAvatarImplCopyWith<_$CharacterAvatarImpl> get copyWith =>
      __$$CharacterAvatarImplCopyWithImpl<_$CharacterAvatarImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterAvatarImplToJson(
      this,
    );
  }
}

abstract class _CharacterAvatar extends CharacterAvatar {
  const factory _CharacterAvatar(
      {required final String url,
      final bool hasTransparency,
      final AvatarMode mode,
      final double offsetX,
      final double offsetY,
      final double scale}) = _$CharacterAvatarImpl;
  const _CharacterAvatar._() : super._();

  factory _CharacterAvatar.fromJson(Map<String, dynamic> json) =
      _$CharacterAvatarImpl.fromJson;

  /// Адрес файла относительно API; меняется при каждой загрузке
  @override
  String get url;

  /// Фон по краям прозрачный: можно показать фигурой
  @override
  bool get hasTransparency;
  @override
  AvatarMode get mode;
  @override
  double get offsetX;
  @override
  double get offsetY;
  @override
  double get scale;

  /// Create a copy of CharacterAvatar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterAvatarImplCopyWith<_$CharacterAvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvatarLayout _$AvatarLayoutFromJson(Map<String, dynamic> json) {
  return _AvatarLayout.fromJson(json);
}

/// @nodoc
mixin _$AvatarLayout {
  AvatarMode get mode => throw _privateConstructorUsedError;
  double get offsetX => throw _privateConstructorUsedError;
  double get offsetY => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;

  /// Serializes this AvatarLayout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvatarLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarLayoutCopyWith<AvatarLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarLayoutCopyWith<$Res> {
  factory $AvatarLayoutCopyWith(
          AvatarLayout value, $Res Function(AvatarLayout) then) =
      _$AvatarLayoutCopyWithImpl<$Res, AvatarLayout>;
  @useResult
  $Res call({AvatarMode mode, double offsetX, double offsetY, double scale});
}

/// @nodoc
class _$AvatarLayoutCopyWithImpl<$Res, $Val extends AvatarLayout>
    implements $AvatarLayoutCopyWith<$Res> {
  _$AvatarLayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvatarLayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? offsetX = null,
    Object? offsetY = null,
    Object? scale = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AvatarMode,
      offsetX: null == offsetX
          ? _value.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _value.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarLayoutImplCopyWith<$Res>
    implements $AvatarLayoutCopyWith<$Res> {
  factory _$$AvatarLayoutImplCopyWith(
          _$AvatarLayoutImpl value, $Res Function(_$AvatarLayoutImpl) then) =
      __$$AvatarLayoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AvatarMode mode, double offsetX, double offsetY, double scale});
}

/// @nodoc
class __$$AvatarLayoutImplCopyWithImpl<$Res>
    extends _$AvatarLayoutCopyWithImpl<$Res, _$AvatarLayoutImpl>
    implements _$$AvatarLayoutImplCopyWith<$Res> {
  __$$AvatarLayoutImplCopyWithImpl(
      _$AvatarLayoutImpl _value, $Res Function(_$AvatarLayoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvatarLayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? offsetX = null,
    Object? offsetY = null,
    Object? scale = null,
  }) {
    return _then(_$AvatarLayoutImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AvatarMode,
      offsetX: null == offsetX
          ? _value.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _value.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarLayoutImpl implements _AvatarLayout {
  const _$AvatarLayoutImpl(
      {this.mode = AvatarMode.frame,
      this.offsetX = 0,
      this.offsetY = 0,
      this.scale = 1});

  factory _$AvatarLayoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarLayoutImplFromJson(json);

  @override
  @JsonKey()
  final AvatarMode mode;
  @override
  @JsonKey()
  final double offsetX;
  @override
  @JsonKey()
  final double offsetY;
  @override
  @JsonKey()
  final double scale;

  @override
  String toString() {
    return 'AvatarLayout(mode: $mode, offsetX: $offsetX, offsetY: $offsetY, scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarLayoutImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.offsetX, offsetX) || other.offsetX == offsetX) &&
            (identical(other.offsetY, offsetY) || other.offsetY == offsetY) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mode, offsetX, offsetY, scale);

  /// Create a copy of AvatarLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarLayoutImplCopyWith<_$AvatarLayoutImpl> get copyWith =>
      __$$AvatarLayoutImplCopyWithImpl<_$AvatarLayoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarLayoutImplToJson(
      this,
    );
  }
}

abstract class _AvatarLayout implements AvatarLayout {
  const factory _AvatarLayout(
      {final AvatarMode mode,
      final double offsetX,
      final double offsetY,
      final double scale}) = _$AvatarLayoutImpl;

  factory _AvatarLayout.fromJson(Map<String, dynamic> json) =
      _$AvatarLayoutImpl.fromJson;

  @override
  AvatarMode get mode;
  @override
  double get offsetX;
  @override
  double get offsetY;
  @override
  double get scale;

  /// Create a copy of AvatarLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarLayoutImplCopyWith<_$AvatarLayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
