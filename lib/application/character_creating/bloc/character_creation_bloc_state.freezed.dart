// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_creation_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CharacterCreationBlocState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCreated => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  CharacterCreationBlocState? get previousState =>
      throw _privateConstructorUsedError;
  Race? get characterRace => throw _privateConstructorUsedError;
  Class? get characterClass => throw _privateConstructorUsedError;
  GenerationMethod? get generationMethod => throw _privateConstructorUsedError;

  /// Базовые характеристики (до бонусов расы)
  Attributes? get baseStats => throw _privateConstructorUsedError;
  String? get rollToken => throw _privateConstructorUsedError;

  /// Выбор бонусов расы; null — ещё не выбраны
  List<Ability>? get bonusChoices => throw _privateConstructorUsedError;
  Background? get background => throw _privateConstructorUsedError;

  /// Выбор навыков; null — шаг навыков ещё не пройден
  SkillSelection? get skills => throw _privateConstructorUsedError;

  /// Лист, посчитанный сервером для текущего черновика
  CharacterSheet? get sheet => throw _privateConstructorUsedError;
  bool get isPreviewLoading => throw _privateConstructorUsedError;
  String? get previewError => throw _privateConstructorUsedError;

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterCreationBlocStateCopyWith<CharacterCreationBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCreationBlocStateCopyWith<$Res> {
  factory $CharacterCreationBlocStateCopyWith(CharacterCreationBlocState value,
          $Res Function(CharacterCreationBlocState) then) =
      _$CharacterCreationBlocStateCopyWithImpl<$Res,
          CharacterCreationBlocState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isCreated,
      String? errorMessage,
      CharacterCreationBlocState? previousState,
      Race? characterRace,
      Class? characterClass,
      GenerationMethod? generationMethod,
      Attributes? baseStats,
      String? rollToken,
      List<Ability>? bonusChoices,
      Background? background,
      SkillSelection? skills,
      CharacterSheet? sheet,
      bool isPreviewLoading,
      String? previewError});

  $CharacterCreationBlocStateCopyWith<$Res>? get previousState;
  $RaceCopyWith<$Res>? get characterRace;
  $ClassCopyWith<$Res>? get characterClass;
  $AttributesCopyWith<$Res>? get baseStats;
  $BackgroundCopyWith<$Res>? get background;
  $SkillSelectionCopyWith<$Res>? get skills;
  $CharacterSheetCopyWith<$Res>? get sheet;
}

/// @nodoc
class _$CharacterCreationBlocStateCopyWithImpl<$Res,
        $Val extends CharacterCreationBlocState>
    implements $CharacterCreationBlocStateCopyWith<$Res> {
  _$CharacterCreationBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCreated = null,
    Object? errorMessage = freezed,
    Object? previousState = freezed,
    Object? characterRace = freezed,
    Object? characterClass = freezed,
    Object? generationMethod = freezed,
    Object? baseStats = freezed,
    Object? rollToken = freezed,
    Object? bonusChoices = freezed,
    Object? background = freezed,
    Object? skills = freezed,
    Object? sheet = freezed,
    Object? isPreviewLoading = null,
    Object? previewError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreated: null == isCreated
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CharacterCreationBlocState?,
      characterRace: freezed == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race?,
      characterClass: freezed == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class?,
      generationMethod: freezed == generationMethod
          ? _value.generationMethod
          : generationMethod // ignore: cast_nullable_to_non_nullable
              as GenerationMethod?,
      baseStats: freezed == baseStats
          ? _value.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Attributes?,
      rollToken: freezed == rollToken
          ? _value.rollToken
          : rollToken // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusChoices: freezed == bonusChoices
          ? _value.bonusChoices
          : bonusChoices // ignore: cast_nullable_to_non_nullable
              as List<Ability>?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Background?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as SkillSelection?,
      sheet: freezed == sheet
          ? _value.sheet
          : sheet // ignore: cast_nullable_to_non_nullable
              as CharacterSheet?,
      isPreviewLoading: null == isPreviewLoading
          ? _value.isPreviewLoading
          : isPreviewLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      previewError: freezed == previewError
          ? _value.previewError
          : previewError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCreationBlocStateCopyWith<$Res>? get previousState {
    if (_value.previousState == null) {
      return null;
    }

    return $CharacterCreationBlocStateCopyWith<$Res>(_value.previousState!,
        (value) {
      return _then(_value.copyWith(previousState: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RaceCopyWith<$Res>? get characterRace {
    if (_value.characterRace == null) {
      return null;
    }

    return $RaceCopyWith<$Res>(_value.characterRace!, (value) {
      return _then(_value.copyWith(characterRace: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassCopyWith<$Res>? get characterClass {
    if (_value.characterClass == null) {
      return null;
    }

    return $ClassCopyWith<$Res>(_value.characterClass!, (value) {
      return _then(_value.copyWith(characterClass: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res>? get baseStats {
    if (_value.baseStats == null) {
      return null;
    }

    return $AttributesCopyWith<$Res>(_value.baseStats!, (value) {
      return _then(_value.copyWith(baseStats: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BackgroundCopyWith<$Res>? get background {
    if (_value.background == null) {
      return null;
    }

    return $BackgroundCopyWith<$Res>(_value.background!, (value) {
      return _then(_value.copyWith(background: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkillSelectionCopyWith<$Res>? get skills {
    if (_value.skills == null) {
      return null;
    }

    return $SkillSelectionCopyWith<$Res>(_value.skills!, (value) {
      return _then(_value.copyWith(skills: value) as $Val);
    });
  }

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterSheetCopyWith<$Res>? get sheet {
    if (_value.sheet == null) {
      return null;
    }

    return $CharacterSheetCopyWith<$Res>(_value.sheet!, (value) {
      return _then(_value.copyWith(sheet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterCreationBlocStateImplCopyWith<$Res>
    implements $CharacterCreationBlocStateCopyWith<$Res> {
  factory _$$CharacterCreationBlocStateImplCopyWith(
          _$CharacterCreationBlocStateImpl value,
          $Res Function(_$CharacterCreationBlocStateImpl) then) =
      __$$CharacterCreationBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isCreated,
      String? errorMessage,
      CharacterCreationBlocState? previousState,
      Race? characterRace,
      Class? characterClass,
      GenerationMethod? generationMethod,
      Attributes? baseStats,
      String? rollToken,
      List<Ability>? bonusChoices,
      Background? background,
      SkillSelection? skills,
      CharacterSheet? sheet,
      bool isPreviewLoading,
      String? previewError});

  @override
  $CharacterCreationBlocStateCopyWith<$Res>? get previousState;
  @override
  $RaceCopyWith<$Res>? get characterRace;
  @override
  $ClassCopyWith<$Res>? get characterClass;
  @override
  $AttributesCopyWith<$Res>? get baseStats;
  @override
  $BackgroundCopyWith<$Res>? get background;
  @override
  $SkillSelectionCopyWith<$Res>? get skills;
  @override
  $CharacterSheetCopyWith<$Res>? get sheet;
}

/// @nodoc
class __$$CharacterCreationBlocStateImplCopyWithImpl<$Res>
    extends _$CharacterCreationBlocStateCopyWithImpl<$Res,
        _$CharacterCreationBlocStateImpl>
    implements _$$CharacterCreationBlocStateImplCopyWith<$Res> {
  __$$CharacterCreationBlocStateImplCopyWithImpl(
      _$CharacterCreationBlocStateImpl _value,
      $Res Function(_$CharacterCreationBlocStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCreated = null,
    Object? errorMessage = freezed,
    Object? previousState = freezed,
    Object? characterRace = freezed,
    Object? characterClass = freezed,
    Object? generationMethod = freezed,
    Object? baseStats = freezed,
    Object? rollToken = freezed,
    Object? bonusChoices = freezed,
    Object? background = freezed,
    Object? skills = freezed,
    Object? sheet = freezed,
    Object? isPreviewLoading = null,
    Object? previewError = freezed,
  }) {
    return _then(_$CharacterCreationBlocStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreated: null == isCreated
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CharacterCreationBlocState?,
      characterRace: freezed == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race?,
      characterClass: freezed == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class?,
      generationMethod: freezed == generationMethod
          ? _value.generationMethod
          : generationMethod // ignore: cast_nullable_to_non_nullable
              as GenerationMethod?,
      baseStats: freezed == baseStats
          ? _value.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Attributes?,
      rollToken: freezed == rollToken
          ? _value.rollToken
          : rollToken // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusChoices: freezed == bonusChoices
          ? _value._bonusChoices
          : bonusChoices // ignore: cast_nullable_to_non_nullable
              as List<Ability>?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Background?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as SkillSelection?,
      sheet: freezed == sheet
          ? _value.sheet
          : sheet // ignore: cast_nullable_to_non_nullable
              as CharacterSheet?,
      isPreviewLoading: null == isPreviewLoading
          ? _value.isPreviewLoading
          : isPreviewLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      previewError: freezed == previewError
          ? _value.previewError
          : previewError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CharacterCreationBlocStateImpl extends _CharacterCreationBlocState {
  _$CharacterCreationBlocStateImpl(
      {this.isLoading = false,
      this.isCreated = false,
      this.errorMessage,
      this.previousState,
      this.characterRace,
      this.characterClass,
      this.generationMethod,
      this.baseStats,
      this.rollToken,
      final List<Ability>? bonusChoices,
      this.background,
      this.skills,
      this.sheet,
      this.isPreviewLoading = false,
      this.previewError})
      : _bonusChoices = bonusChoices,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCreated;
  @override
  final String? errorMessage;
  @override
  final CharacterCreationBlocState? previousState;
  @override
  final Race? characterRace;
  @override
  final Class? characterClass;
  @override
  final GenerationMethod? generationMethod;

  /// Базовые характеристики (до бонусов расы)
  @override
  final Attributes? baseStats;
  @override
  final String? rollToken;

  /// Выбор бонусов расы; null — ещё не выбраны
  final List<Ability>? _bonusChoices;

  /// Выбор бонусов расы; null — ещё не выбраны
  @override
  List<Ability>? get bonusChoices {
    final value = _bonusChoices;
    if (value == null) return null;
    if (_bonusChoices is EqualUnmodifiableListView) return _bonusChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Background? background;

  /// Выбор навыков; null — шаг навыков ещё не пройден
  @override
  final SkillSelection? skills;

  /// Лист, посчитанный сервером для текущего черновика
  @override
  final CharacterSheet? sheet;
  @override
  @JsonKey()
  final bool isPreviewLoading;
  @override
  final String? previewError;

  @override
  String toString() {
    return 'CharacterCreationBlocState(isLoading: $isLoading, isCreated: $isCreated, errorMessage: $errorMessage, previousState: $previousState, characterRace: $characterRace, characterClass: $characterClass, generationMethod: $generationMethod, baseStats: $baseStats, rollToken: $rollToken, bonusChoices: $bonusChoices, background: $background, skills: $skills, sheet: $sheet, isPreviewLoading: $isPreviewLoading, previewError: $previewError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterCreationBlocStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCreated, isCreated) ||
                other.isCreated == isCreated) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState) &&
            (identical(other.characterRace, characterRace) ||
                other.characterRace == characterRace) &&
            (identical(other.characterClass, characterClass) ||
                other.characterClass == characterClass) &&
            (identical(other.generationMethod, generationMethod) ||
                other.generationMethod == generationMethod) &&
            (identical(other.baseStats, baseStats) ||
                other.baseStats == baseStats) &&
            (identical(other.rollToken, rollToken) ||
                other.rollToken == rollToken) &&
            const DeepCollectionEquality()
                .equals(other._bonusChoices, _bonusChoices) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.sheet, sheet) || other.sheet == sheet) &&
            (identical(other.isPreviewLoading, isPreviewLoading) ||
                other.isPreviewLoading == isPreviewLoading) &&
            (identical(other.previewError, previewError) ||
                other.previewError == previewError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isCreated,
      errorMessage,
      previousState,
      characterRace,
      characterClass,
      generationMethod,
      baseStats,
      rollToken,
      const DeepCollectionEquality().hash(_bonusChoices),
      background,
      skills,
      sheet,
      isPreviewLoading,
      previewError);

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterCreationBlocStateImplCopyWith<_$CharacterCreationBlocStateImpl>
      get copyWith => __$$CharacterCreationBlocStateImplCopyWithImpl<
          _$CharacterCreationBlocStateImpl>(this, _$identity);
}

abstract class _CharacterCreationBlocState extends CharacterCreationBlocState {
  factory _CharacterCreationBlocState(
      {final bool isLoading,
      final bool isCreated,
      final String? errorMessage,
      final CharacterCreationBlocState? previousState,
      final Race? characterRace,
      final Class? characterClass,
      final GenerationMethod? generationMethod,
      final Attributes? baseStats,
      final String? rollToken,
      final List<Ability>? bonusChoices,
      final Background? background,
      final SkillSelection? skills,
      final CharacterSheet? sheet,
      final bool isPreviewLoading,
      final String? previewError}) = _$CharacterCreationBlocStateImpl;
  _CharacterCreationBlocState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isCreated;
  @override
  String? get errorMessage;
  @override
  CharacterCreationBlocState? get previousState;
  @override
  Race? get characterRace;
  @override
  Class? get characterClass;
  @override
  GenerationMethod? get generationMethod;

  /// Базовые характеристики (до бонусов расы)
  @override
  Attributes? get baseStats;
  @override
  String? get rollToken;

  /// Выбор бонусов расы; null — ещё не выбраны
  @override
  List<Ability>? get bonusChoices;
  @override
  Background? get background;

  /// Выбор навыков; null — шаг навыков ещё не пройден
  @override
  SkillSelection? get skills;

  /// Лист, посчитанный сервером для текущего черновика
  @override
  CharacterSheet? get sheet;
  @override
  bool get isPreviewLoading;
  @override
  String? get previewError;

  /// Create a copy of CharacterCreationBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterCreationBlocStateImplCopyWith<_$CharacterCreationBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SkillSelection {
  /// Навыки своей предыстории
  List<Skill> get background => throw _privateConstructorUsedError;

  /// Навыки расы на выбор (полуэльф)
  List<Skill> get race => throw _privateConstructorUsedError;
  List<Skill> get characterClass => throw _privateConstructorUsedError;

  /// Компетентность (плут)
  List<Skill> get expertise => throw _privateConstructorUsedError;

  /// Create a copy of SkillSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillSelectionCopyWith<SkillSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillSelectionCopyWith<$Res> {
  factory $SkillSelectionCopyWith(
          SkillSelection value, $Res Function(SkillSelection) then) =
      _$SkillSelectionCopyWithImpl<$Res, SkillSelection>;
  @useResult
  $Res call(
      {List<Skill> background,
      List<Skill> race,
      List<Skill> characterClass,
      List<Skill> expertise});
}

/// @nodoc
class _$SkillSelectionCopyWithImpl<$Res, $Val extends SkillSelection>
    implements $SkillSelectionCopyWith<$Res> {
  _$SkillSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = null,
    Object? race = null,
    Object? characterClass = null,
    Object? expertise = null,
  }) {
    return _then(_value.copyWith(
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      race: null == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      characterClass: null == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      expertise: null == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillSelectionImplCopyWith<$Res>
    implements $SkillSelectionCopyWith<$Res> {
  factory _$$SkillSelectionImplCopyWith(_$SkillSelectionImpl value,
          $Res Function(_$SkillSelectionImpl) then) =
      __$$SkillSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Skill> background,
      List<Skill> race,
      List<Skill> characterClass,
      List<Skill> expertise});
}

/// @nodoc
class __$$SkillSelectionImplCopyWithImpl<$Res>
    extends _$SkillSelectionCopyWithImpl<$Res, _$SkillSelectionImpl>
    implements _$$SkillSelectionImplCopyWith<$Res> {
  __$$SkillSelectionImplCopyWithImpl(
      _$SkillSelectionImpl _value, $Res Function(_$SkillSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = null,
    Object? race = null,
    Object? characterClass = null,
    Object? expertise = null,
  }) {
    return _then(_$SkillSelectionImpl(
      background: null == background
          ? _value._background
          : background // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      race: null == race
          ? _value._race
          : race // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      characterClass: null == characterClass
          ? _value._characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      expertise: null == expertise
          ? _value._expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
    ));
  }
}

/// @nodoc

class _$SkillSelectionImpl extends _SkillSelection {
  const _$SkillSelectionImpl(
      {final List<Skill> background = const [],
      final List<Skill> race = const [],
      final List<Skill> characterClass = const [],
      final List<Skill> expertise = const []})
      : _background = background,
        _race = race,
        _characterClass = characterClass,
        _expertise = expertise,
        super._();

  /// Навыки своей предыстории
  final List<Skill> _background;

  /// Навыки своей предыстории
  @override
  @JsonKey()
  List<Skill> get background {
    if (_background is EqualUnmodifiableListView) return _background;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_background);
  }

  /// Навыки расы на выбор (полуэльф)
  final List<Skill> _race;

  /// Навыки расы на выбор (полуэльф)
  @override
  @JsonKey()
  List<Skill> get race {
    if (_race is EqualUnmodifiableListView) return _race;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_race);
  }

  final List<Skill> _characterClass;
  @override
  @JsonKey()
  List<Skill> get characterClass {
    if (_characterClass is EqualUnmodifiableListView) return _characterClass;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characterClass);
  }

  /// Компетентность (плут)
  final List<Skill> _expertise;

  /// Компетентность (плут)
  @override
  @JsonKey()
  List<Skill> get expertise {
    if (_expertise is EqualUnmodifiableListView) return _expertise;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expertise);
  }

  @override
  String toString() {
    return 'SkillSelection(background: $background, race: $race, characterClass: $characterClass, expertise: $expertise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillSelectionImpl &&
            const DeepCollectionEquality()
                .equals(other._background, _background) &&
            const DeepCollectionEquality().equals(other._race, _race) &&
            const DeepCollectionEquality()
                .equals(other._characterClass, _characterClass) &&
            const DeepCollectionEquality()
                .equals(other._expertise, _expertise));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_background),
      const DeepCollectionEquality().hash(_race),
      const DeepCollectionEquality().hash(_characterClass),
      const DeepCollectionEquality().hash(_expertise));

  /// Create a copy of SkillSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillSelectionImplCopyWith<_$SkillSelectionImpl> get copyWith =>
      __$$SkillSelectionImplCopyWithImpl<_$SkillSelectionImpl>(
          this, _$identity);
}

abstract class _SkillSelection extends SkillSelection {
  const factory _SkillSelection(
      {final List<Skill> background,
      final List<Skill> race,
      final List<Skill> characterClass,
      final List<Skill> expertise}) = _$SkillSelectionImpl;
  const _SkillSelection._() : super._();

  /// Навыки своей предыстории
  @override
  List<Skill> get background;

  /// Навыки расы на выбор (полуэльф)
  @override
  List<Skill> get race;
  @override
  List<Skill> get characterClass;

  /// Компетентность (плут)
  @override
  List<Skill> get expertise;

  /// Create a copy of SkillSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillSelectionImplCopyWith<_$SkillSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
