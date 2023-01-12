// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'select_lang_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectLangState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<LanguageData> get languages => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectLangStateCopyWith<SelectLangState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLangStateCopyWith<$Res> {
  factory $SelectLangStateCopyWith(
          SelectLangState value, $Res Function(SelectLangState) then) =
      _$SelectLangStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<LanguageData> languages,
      int selectedIndex});
}

/// @nodoc
class _$SelectLangStateCopyWithImpl<$Res>
    implements $SelectLangStateCopyWith<$Res> {
  _$SelectLangStateCopyWithImpl(this._value, this._then);

  final SelectLangState _value;
  // ignore: unused_field
  final $Res Function(SelectLangState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSaving = freezed,
    Object? languages = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SelectLangStateCopyWith<$Res>
    implements $SelectLangStateCopyWith<$Res> {
  factory _$$_SelectLangStateCopyWith(
          _$_SelectLangState value, $Res Function(_$_SelectLangState) then) =
      __$$_SelectLangStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<LanguageData> languages,
      int selectedIndex});
}

/// @nodoc
class __$$_SelectLangStateCopyWithImpl<$Res>
    extends _$SelectLangStateCopyWithImpl<$Res>
    implements _$$_SelectLangStateCopyWith<$Res> {
  __$$_SelectLangStateCopyWithImpl(
      _$_SelectLangState _value, $Res Function(_$_SelectLangState) _then)
      : super(_value, (v) => _then(v as _$_SelectLangState));

  @override
  _$_SelectLangState get _value => super._value as _$_SelectLangState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSaving = freezed,
    Object? languages = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_$_SelectLangState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: languages == freezed
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SelectLangState extends _SelectLangState {
  const _$_SelectLangState(
      {this.isLoading = false,
      this.isSaving = false,
      final List<LanguageData> languages = const [],
      this.selectedIndex = 0})
      : _languages = languages,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<LanguageData> _languages;
  @override
  @JsonKey()
  List<LanguageData> get languages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  @JsonKey()
  final int selectedIndex;

  @override
  String toString() {
    return 'SelectLangState(isLoading: $isLoading, isSaving: $isSaving, languages: $languages, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectLangState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSaving, isSaving) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other.selectedIndex, selectedIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSaving),
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(selectedIndex));

  @JsonKey(ignore: true)
  @override
  _$$_SelectLangStateCopyWith<_$_SelectLangState> get copyWith =>
      __$$_SelectLangStateCopyWithImpl<_$_SelectLangState>(this, _$identity);
}

abstract class _SelectLangState extends SelectLangState {
  const factory _SelectLangState(
      {final bool isLoading,
      final bool isSaving,
      final List<LanguageData> languages,
      final int selectedIndex}) = _$_SelectLangState;
  const _SelectLangState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<LanguageData> get languages;
  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$_SelectLangStateCopyWith<_$_SelectLangState> get copyWith =>
      throw _privateConstructorUsedError;
}
