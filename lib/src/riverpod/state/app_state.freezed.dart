// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get isLtr => throw _privateConstructorUsedError;
  LanguageData? get activeLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({bool isDarkMode, bool isLtr, LanguageData? activeLanguage});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? isDarkMode = freezed,
    Object? isLtr = freezed,
    Object? activeLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      isDarkMode: isDarkMode == freezed
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isLtr: isLtr == freezed
          ? _value.isLtr
          : isLtr // ignore: cast_nullable_to_non_nullable
              as bool,
      activeLanguage: activeLanguage == freezed
          ? _value.activeLanguage
          : activeLanguage // ignore: cast_nullable_to_non_nullable
              as LanguageData?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isDarkMode, bool isLtr, LanguageData? activeLanguage});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, (v) => _then(v as _$_AppState));

  @override
  _$_AppState get _value => super._value as _$_AppState;

  @override
  $Res call({
    Object? isDarkMode = freezed,
    Object? isLtr = freezed,
    Object? activeLanguage = freezed,
  }) {
    return _then(_$_AppState(
      isDarkMode: isDarkMode == freezed
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isLtr: isLtr == freezed
          ? _value.isLtr
          : isLtr // ignore: cast_nullable_to_non_nullable
              as bool,
      activeLanguage: activeLanguage == freezed
          ? _value.activeLanguage
          : activeLanguage // ignore: cast_nullable_to_non_nullable
              as LanguageData?,
    ));
  }
}

/// @nodoc

class _$_AppState extends _AppState {
  const _$_AppState(
      {this.isDarkMode = false, this.isLtr = true, this.activeLanguage})
      : super._();

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool isLtr;
  @override
  final LanguageData? activeLanguage;

  @override
  String toString() {
    return 'AppState(isDarkMode: $isDarkMode, isLtr: $isLtr, activeLanguage: $activeLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            const DeepCollectionEquality()
                .equals(other.isDarkMode, isDarkMode) &&
            const DeepCollectionEquality().equals(other.isLtr, isLtr) &&
            const DeepCollectionEquality()
                .equals(other.activeLanguage, activeLanguage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isDarkMode),
      const DeepCollectionEquality().hash(isLtr),
      const DeepCollectionEquality().hash(activeLanguage));

  @JsonKey(ignore: true)
  @override
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState extends AppState {
  const factory _AppState(
      {final bool isDarkMode,
      final bool isLtr,
      final LanguageData? activeLanguage}) = _$_AppState;
  const _AppState._() : super._();

  @override
  bool get isDarkMode;
  @override
  bool get isLtr;
  @override
  LanguageData? get activeLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
