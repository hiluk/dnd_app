// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dnd_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DndColors {
  Color get primary => throw _privateConstructorUsedError;
  Color get onPrimary => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color primary, Color onPrimary) light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color primary, Color onPrimary)? light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color primary, Color onPrimary)? light,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DndColorsLight value) light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DndColorsLight value)? light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DndColorsLight value)? light,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DndColorsCopyWith<DndColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DndColorsCopyWith<$Res> {
  factory $DndColorsCopyWith(DndColors value, $Res Function(DndColors) then) =
      _$DndColorsCopyWithImpl<$Res, DndColors>;
  @useResult
  $Res call({Color primary, Color onPrimary});
}

/// @nodoc
class _$DndColorsCopyWithImpl<$Res, $Val extends DndColors>
    implements $DndColorsCopyWith<$Res> {
  _$DndColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? onPrimary = null,
  }) {
    return _then(_value.copyWith(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as Color,
      onPrimary: null == onPrimary
          ? _value.onPrimary
          : onPrimary // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DndColorsLightImplCopyWith<$Res>
    implements $DndColorsCopyWith<$Res> {
  factory _$$DndColorsLightImplCopyWith(_$DndColorsLightImpl value,
          $Res Function(_$DndColorsLightImpl) then) =
      __$$DndColorsLightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color primary, Color onPrimary});
}

/// @nodoc
class __$$DndColorsLightImplCopyWithImpl<$Res>
    extends _$DndColorsCopyWithImpl<$Res, _$DndColorsLightImpl>
    implements _$$DndColorsLightImplCopyWith<$Res> {
  __$$DndColorsLightImplCopyWithImpl(
      _$DndColorsLightImpl _value, $Res Function(_$DndColorsLightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? onPrimary = null,
  }) {
    return _then(_$DndColorsLightImpl(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as Color,
      onPrimary: null == onPrimary
          ? _value.onPrimary
          : onPrimary // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$DndColorsLightImpl implements DndColorsLight {
  const _$DndColorsLightImpl(
      {required this.primary = const Color.fromRGBO(211, 36, 48, 1),
      required this.onPrimary = const Color.fromRGBO(255, 239, 244, 1)});

  @override
  @JsonKey()
  final Color primary;
  @override
  @JsonKey()
  final Color onPrimary;

  @override
  String toString() {
    return 'DndColors.light(primary: $primary, onPrimary: $onPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DndColorsLightImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.onPrimary, onPrimary) ||
                other.onPrimary == onPrimary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, primary, onPrimary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DndColorsLightImplCopyWith<_$DndColorsLightImpl> get copyWith =>
      __$$DndColorsLightImplCopyWithImpl<_$DndColorsLightImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color primary, Color onPrimary) light,
  }) {
    return light(primary, onPrimary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color primary, Color onPrimary)? light,
  }) {
    return light?.call(primary, onPrimary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color primary, Color onPrimary)? light,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(primary, onPrimary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DndColorsLight value) light,
  }) {
    return light(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DndColorsLight value)? light,
  }) {
    return light?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DndColorsLight value)? light,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class DndColorsLight implements DndColors {
  const factory DndColorsLight(
      {required final Color primary,
      required final Color onPrimary}) = _$DndColorsLightImpl;

  @override
  Color get primary;
  @override
  Color get onPrimary;
  @override
  @JsonKey(ignore: true)
  _$$DndColorsLightImplCopyWith<_$DndColorsLightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
