// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isResending => throw _privateConstructorUsedError;
  bool get isTimeExpired => throw _privateConstructorUsedError;
  bool get isCodeError => throw _privateConstructorUsedError;
  bool get isInitializing => throw _privateConstructorUsedError;
  String get confirmCode => throw _privateConstructorUsedError;
  String get timerText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<CardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isResending,
      bool isTimeExpired,
      bool isCodeError,
      bool isInitializing,
      String confirmCode,
      String timerText});
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res> implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  final CardState _value;
  // ignore: unused_field
  final $Res Function(CardState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isResending = freezed,
    Object? isTimeExpired = freezed,
    Object? isCodeError = freezed,
    Object? isInitializing = freezed,
    Object? confirmCode = freezed,
    Object? timerText = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: isResending == freezed
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: isTimeExpired == freezed
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeError: isCodeError == freezed
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitializing: isInitializing == freezed
          ? _value.isInitializing
          : isInitializing // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmCode: confirmCode == freezed
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: timerText == freezed
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CardStateCopyWith<$Res> implements $CardStateCopyWith<$Res> {
  factory _$$_CardStateCopyWith(
          _$_CardState value, $Res Function(_$_CardState) then) =
      __$$_CardStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isResending,
      bool isTimeExpired,
      bool isCodeError,
      bool isInitializing,
      String confirmCode,
      String timerText});
}

/// @nodoc
class __$$_CardStateCopyWithImpl<$Res> extends _$CardStateCopyWithImpl<$Res>
    implements _$$_CardStateCopyWith<$Res> {
  __$$_CardStateCopyWithImpl(
      _$_CardState _value, $Res Function(_$_CardState) _then)
      : super(_value, (v) => _then(v as _$_CardState));

  @override
  _$_CardState get _value => super._value as _$_CardState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isResending = freezed,
    Object? isTimeExpired = freezed,
    Object? isCodeError = freezed,
    Object? isInitializing = freezed,
    Object? confirmCode = freezed,
    Object? timerText = freezed,
  }) {
    return _then(_$_CardState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: isResending == freezed
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: isTimeExpired == freezed
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeError: isCodeError == freezed
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitializing: isInitializing == freezed
          ? _value.isInitializing
          : isInitializing // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmCode: confirmCode == freezed
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: timerText == freezed
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CardState extends _CardState {
  const _$_CardState(
      {this.isLoading = false,
      this.isResending = false,
      this.isTimeExpired = false,
      this.isCodeError = false,
      this.isInitializing = false,
      this.confirmCode = '',
      this.timerText = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isResending;
  @override
  @JsonKey()
  final bool isTimeExpired;
  @override
  @JsonKey()
  final bool isCodeError;
  @override
  @JsonKey()
  final bool isInitializing;
  @override
  @JsonKey()
  final String confirmCode;
  @override
  @JsonKey()
  final String timerText;

  @override
  String toString() {
    return 'CardState(isLoading: $isLoading, isResending: $isResending, isTimeExpired: $isTimeExpired, isCodeError: $isCodeError, isInitializing: $isInitializing, confirmCode: $confirmCode, timerText: $timerText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isResending, isResending) &&
            const DeepCollectionEquality()
                .equals(other.isTimeExpired, isTimeExpired) &&
            const DeepCollectionEquality()
                .equals(other.isCodeError, isCodeError) &&
            const DeepCollectionEquality()
                .equals(other.isInitializing, isInitializing) &&
            const DeepCollectionEquality()
                .equals(other.confirmCode, confirmCode) &&
            const DeepCollectionEquality().equals(other.timerText, timerText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isResending),
      const DeepCollectionEquality().hash(isTimeExpired),
      const DeepCollectionEquality().hash(isCodeError),
      const DeepCollectionEquality().hash(isInitializing),
      const DeepCollectionEquality().hash(confirmCode),
      const DeepCollectionEquality().hash(timerText));

  @JsonKey(ignore: true)
  @override
  _$$_CardStateCopyWith<_$_CardState> get copyWith =>
      __$$_CardStateCopyWithImpl<_$_CardState>(this, _$identity);
}

abstract class _CardState extends CardState {
  const factory _CardState(
      {final bool isLoading,
      final bool isResending,
      final bool isTimeExpired,
      final bool isCodeError,
      final bool isInitializing,
      final String confirmCode,
      final String timerText}) = _$_CardState;
  const _CardState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isResending;
  @override
  bool get isTimeExpired;
  @override
  bool get isCodeError;
  @override
  bool get isInitializing;
  @override
  String get confirmCode;
  @override
  String get timerText;
  @override
  @JsonKey(ignore: true)
  _$$_CardStateCopyWith<_$_CardState> get copyWith =>
      throw _privateConstructorUsedError;
}
