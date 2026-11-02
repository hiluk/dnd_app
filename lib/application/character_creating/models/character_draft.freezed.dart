// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterDraft _$CharacterDraftFromJson(Map<String, dynamic> json) {
  return _CharacterDraft.fromJson(json);
}

/// @nodoc
mixin _$CharacterDraft {
  String get name => throw _privateConstructorUsedError;
  @CharacterRaceTypeConverter()
  Race get characterRace => throw _privateConstructorUsedError;
  @CharacterClassTypeConverter()
  Class get characterClass => throw _privateConstructorUsedError;
  GenerationMethod get generationMethod => throw _privateConstructorUsedError;

  /// Базовые характеристики (до бонусов расы)
  Attributes get baseStats => throw _privateConstructorUsedError;
  List<Ability> get bonusChoices => throw _privateConstructorUsedError;

  /// Предыстория; до шага навыков не указывается
  @JsonKey(includeIfNull: false)
  @BackgroundConverter()
  Background? get background => throw _privateConstructorUsedError;

  /// Навыки, выбранные для своей предыстории
  List<Skill> get backgroundSkills => throw _privateConstructorUsedError;

  /// Навыки, выбранные от расы (полуэльф)
  List<Skill> get raceSkills => throw _privateConstructorUsedError;

  /// Навыки, выбранные из списка класса
  List<Skill> get classSkills => throw _privateConstructorUsedError;

  /// Навыки с компетентностью (плут)
  List<Skill> get expertise => throw _privateConstructorUsedError;

  /// Подпись результата бросков с сервера
  @JsonKey(includeIfNull: false)
  String? get rollToken => throw _privateConstructorUsedError;

  /// Serializes this CharacterDraft to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterDraftCopyWith<CharacterDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDraftCopyWith<$Res> {
  factory $CharacterDraftCopyWith(
          CharacterDraft value, $Res Function(CharacterDraft) then) =
      _$CharacterDraftCopyWithImpl<$Res, CharacterDraft>;
  @useResult
  $Res call(
      {String name,
      @CharacterRaceTypeConverter() Race characterRace,
      @CharacterClassTypeConverter() Class characterClass,
      GenerationMethod generationMethod,
      Attributes baseStats,
      List<Ability> bonusChoices,
      @JsonKey(includeIfNull: false)
      @BackgroundConverter()
      Background? background,
      List<Skill> backgroundSkills,
      List<Skill> raceSkills,
      List<Skill> classSkills,
      List<Skill> expertise,
      @JsonKey(includeIfNull: false) String? rollToken});

  $RaceCopyWith<$Res> get characterRace;
  $ClassCopyWith<$Res> get characterClass;
  $AttributesCopyWith<$Res> get baseStats;
  $BackgroundCopyWith<$Res>? get background;
}

/// @nodoc
class _$CharacterDraftCopyWithImpl<$Res, $Val extends CharacterDraft>
    implements $CharacterDraftCopyWith<$Res> {
  _$CharacterDraftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? characterRace = null,
    Object? characterClass = null,
    Object? generationMethod = null,
    Object? baseStats = null,
    Object? bonusChoices = null,
    Object? background = freezed,
    Object? backgroundSkills = null,
    Object? raceSkills = null,
    Object? classSkills = null,
    Object? expertise = null,
    Object? rollToken = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      characterRace: null == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race,
      characterClass: null == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class,
      generationMethod: null == generationMethod
          ? _value.generationMethod
          : generationMethod // ignore: cast_nullable_to_non_nullable
              as GenerationMethod,
      baseStats: null == baseStats
          ? _value.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
      bonusChoices: null == bonusChoices
          ? _value.bonusChoices
          : bonusChoices // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Background?,
      backgroundSkills: null == backgroundSkills
          ? _value.backgroundSkills
          : backgroundSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      raceSkills: null == raceSkills
          ? _value.raceSkills
          : raceSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      classSkills: null == classSkills
          ? _value.classSkills
          : classSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      expertise: null == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      rollToken: freezed == rollToken
          ? _value.rollToken
          : rollToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RaceCopyWith<$Res> get characterRace {
    return $RaceCopyWith<$Res>(_value.characterRace, (value) {
      return _then(_value.copyWith(characterRace: value) as $Val);
    });
  }

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassCopyWith<$Res> get characterClass {
    return $ClassCopyWith<$Res>(_value.characterClass, (value) {
      return _then(_value.copyWith(characterClass: value) as $Val);
    });
  }

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get baseStats {
    return $AttributesCopyWith<$Res>(_value.baseStats, (value) {
      return _then(_value.copyWith(baseStats: value) as $Val);
    });
  }

  /// Create a copy of CharacterDraft
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
}

/// @nodoc
abstract class _$$CharacterDraftImplCopyWith<$Res>
    implements $CharacterDraftCopyWith<$Res> {
  factory _$$CharacterDraftImplCopyWith(_$CharacterDraftImpl value,
          $Res Function(_$CharacterDraftImpl) then) =
      __$$CharacterDraftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @CharacterRaceTypeConverter() Race characterRace,
      @CharacterClassTypeConverter() Class characterClass,
      GenerationMethod generationMethod,
      Attributes baseStats,
      List<Ability> bonusChoices,
      @JsonKey(includeIfNull: false)
      @BackgroundConverter()
      Background? background,
      List<Skill> backgroundSkills,
      List<Skill> raceSkills,
      List<Skill> classSkills,
      List<Skill> expertise,
      @JsonKey(includeIfNull: false) String? rollToken});

  @override
  $RaceCopyWith<$Res> get characterRace;
  @override
  $ClassCopyWith<$Res> get characterClass;
  @override
  $AttributesCopyWith<$Res> get baseStats;
  @override
  $BackgroundCopyWith<$Res>? get background;
}

/// @nodoc
class __$$CharacterDraftImplCopyWithImpl<$Res>
    extends _$CharacterDraftCopyWithImpl<$Res, _$CharacterDraftImpl>
    implements _$$CharacterDraftImplCopyWith<$Res> {
  __$$CharacterDraftImplCopyWithImpl(
      _$CharacterDraftImpl _value, $Res Function(_$CharacterDraftImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? characterRace = null,
    Object? characterClass = null,
    Object? generationMethod = null,
    Object? baseStats = null,
    Object? bonusChoices = null,
    Object? background = freezed,
    Object? backgroundSkills = null,
    Object? raceSkills = null,
    Object? classSkills = null,
    Object? expertise = null,
    Object? rollToken = freezed,
  }) {
    return _then(_$CharacterDraftImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      characterRace: null == characterRace
          ? _value.characterRace
          : characterRace // ignore: cast_nullable_to_non_nullable
              as Race,
      characterClass: null == characterClass
          ? _value.characterClass
          : characterClass // ignore: cast_nullable_to_non_nullable
              as Class,
      generationMethod: null == generationMethod
          ? _value.generationMethod
          : generationMethod // ignore: cast_nullable_to_non_nullable
              as GenerationMethod,
      baseStats: null == baseStats
          ? _value.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Attributes,
      bonusChoices: null == bonusChoices
          ? _value._bonusChoices
          : bonusChoices // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Background?,
      backgroundSkills: null == backgroundSkills
          ? _value._backgroundSkills
          : backgroundSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      raceSkills: null == raceSkills
          ? _value._raceSkills
          : raceSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      classSkills: null == classSkills
          ? _value._classSkills
          : classSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      expertise: null == expertise
          ? _value._expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      rollToken: freezed == rollToken
          ? _value.rollToken
          : rollToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterDraftImpl implements _CharacterDraft {
  const _$CharacterDraftImpl(
      {this.name = '',
      @CharacterRaceTypeConverter() required this.characterRace,
      @CharacterClassTypeConverter() required this.characterClass,
      required this.generationMethod,
      required this.baseStats,
      final List<Ability> bonusChoices = const [],
      @JsonKey(includeIfNull: false) @BackgroundConverter() this.background,
      final List<Skill> backgroundSkills = const [],
      final List<Skill> raceSkills = const [],
      final List<Skill> classSkills = const [],
      final List<Skill> expertise = const [],
      @JsonKey(includeIfNull: false) this.rollToken})
      : _bonusChoices = bonusChoices,
        _backgroundSkills = backgroundSkills,
        _raceSkills = raceSkills,
        _classSkills = classSkills,
        _expertise = expertise;

  factory _$CharacterDraftImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterDraftImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @CharacterRaceTypeConverter()
  final Race characterRace;
  @override
  @CharacterClassTypeConverter()
  final Class characterClass;
  @override
  final GenerationMethod generationMethod;

  /// Базовые характеристики (до бонусов расы)
  @override
  final Attributes baseStats;
  final List<Ability> _bonusChoices;
  @override
  @JsonKey()
  List<Ability> get bonusChoices {
    if (_bonusChoices is EqualUnmodifiableListView) return _bonusChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusChoices);
  }

  /// Предыстория; до шага навыков не указывается
  @override
  @JsonKey(includeIfNull: false)
  @BackgroundConverter()
  final Background? background;

  /// Навыки, выбранные для своей предыстории
  final List<Skill> _backgroundSkills;

  /// Навыки, выбранные для своей предыстории
  @override
  @JsonKey()
  List<Skill> get backgroundSkills {
    if (_backgroundSkills is EqualUnmodifiableListView)
      return _backgroundSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backgroundSkills);
  }

  /// Навыки, выбранные от расы (полуэльф)
  final List<Skill> _raceSkills;

  /// Навыки, выбранные от расы (полуэльф)
  @override
  @JsonKey()
  List<Skill> get raceSkills {
    if (_raceSkills is EqualUnmodifiableListView) return _raceSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_raceSkills);
  }

  /// Навыки, выбранные из списка класса
  final List<Skill> _classSkills;

  /// Навыки, выбранные из списка класса
  @override
  @JsonKey()
  List<Skill> get classSkills {
    if (_classSkills is EqualUnmodifiableListView) return _classSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_classSkills);
  }

  /// Навыки с компетентностью (плут)
  final List<Skill> _expertise;

  /// Навыки с компетентностью (плут)
  @override
  @JsonKey()
  List<Skill> get expertise {
    if (_expertise is EqualUnmodifiableListView) return _expertise;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expertise);
  }

  /// Подпись результата бросков с сервера
  @override
  @JsonKey(includeIfNull: false)
  final String? rollToken;

  @override
  String toString() {
    return 'CharacterDraft(name: $name, characterRace: $characterRace, characterClass: $characterClass, generationMethod: $generationMethod, baseStats: $baseStats, bonusChoices: $bonusChoices, background: $background, backgroundSkills: $backgroundSkills, raceSkills: $raceSkills, classSkills: $classSkills, expertise: $expertise, rollToken: $rollToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterDraftImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.characterRace, characterRace) ||
                other.characterRace == characterRace) &&
            (identical(other.characterClass, characterClass) ||
                other.characterClass == characterClass) &&
            (identical(other.generationMethod, generationMethod) ||
                other.generationMethod == generationMethod) &&
            (identical(other.baseStats, baseStats) ||
                other.baseStats == baseStats) &&
            const DeepCollectionEquality()
                .equals(other._bonusChoices, _bonusChoices) &&
            (identical(other.background, background) ||
                other.background == background) &&
            const DeepCollectionEquality()
                .equals(other._backgroundSkills, _backgroundSkills) &&
            const DeepCollectionEquality()
                .equals(other._raceSkills, _raceSkills) &&
            const DeepCollectionEquality()
                .equals(other._classSkills, _classSkills) &&
            const DeepCollectionEquality()
                .equals(other._expertise, _expertise) &&
            (identical(other.rollToken, rollToken) ||
                other.rollToken == rollToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      characterRace,
      characterClass,
      generationMethod,
      baseStats,
      const DeepCollectionEquality().hash(_bonusChoices),
      background,
      const DeepCollectionEquality().hash(_backgroundSkills),
      const DeepCollectionEquality().hash(_raceSkills),
      const DeepCollectionEquality().hash(_classSkills),
      const DeepCollectionEquality().hash(_expertise),
      rollToken);

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterDraftImplCopyWith<_$CharacterDraftImpl> get copyWith =>
      __$$CharacterDraftImplCopyWithImpl<_$CharacterDraftImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterDraftImplToJson(
      this,
    );
  }
}

abstract class _CharacterDraft implements CharacterDraft {
  const factory _CharacterDraft(
          {final String name,
          @CharacterRaceTypeConverter() required final Race characterRace,
          @CharacterClassTypeConverter() required final Class characterClass,
          required final GenerationMethod generationMethod,
          required final Attributes baseStats,
          final List<Ability> bonusChoices,
          @JsonKey(includeIfNull: false)
          @BackgroundConverter()
          final Background? background,
          final List<Skill> backgroundSkills,
          final List<Skill> raceSkills,
          final List<Skill> classSkills,
          final List<Skill> expertise,
          @JsonKey(includeIfNull: false) final String? rollToken}) =
      _$CharacterDraftImpl;

  factory _CharacterDraft.fromJson(Map<String, dynamic> json) =
      _$CharacterDraftImpl.fromJson;

  @override
  String get name;
  @override
  @CharacterRaceTypeConverter()
  Race get characterRace;
  @override
  @CharacterClassTypeConverter()
  Class get characterClass;
  @override
  GenerationMethod get generationMethod;

  /// Базовые характеристики (до бонусов расы)
  @override
  Attributes get baseStats;
  @override
  List<Ability> get bonusChoices;

  /// Предыстория; до шага навыков не указывается
  @override
  @JsonKey(includeIfNull: false)
  @BackgroundConverter()
  Background? get background;

  /// Навыки, выбранные для своей предыстории
  @override
  List<Skill> get backgroundSkills;

  /// Навыки, выбранные от расы (полуэльф)
  @override
  List<Skill> get raceSkills;

  /// Навыки, выбранные из списка класса
  @override
  List<Skill> get classSkills;

  /// Навыки с компетентностью (плут)
  @override
  List<Skill> get expertise;

  /// Подпись результата бросков с сервера
  @override
  @JsonKey(includeIfNull: false)
  String? get rollToken;

  /// Create a copy of CharacterDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterDraftImplCopyWith<_$CharacterDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
