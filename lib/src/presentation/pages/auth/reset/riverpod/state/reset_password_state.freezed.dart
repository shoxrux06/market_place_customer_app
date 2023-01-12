// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPhoneError => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get verifyId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isPhoneError, String phone, String verifyId});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  final ResetPasswordState _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isPhoneError = freezed,
    Object? phone = freezed,
    Object? verifyId = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneError: isPhoneError == freezed
          ? _value.isPhoneError
          : isPhoneError // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verifyId: verifyId == freezed
          ? _value.verifyId
          : verifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ResetPasswordStateCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$_ResetPasswordStateCopyWith(_$_ResetPasswordState value,
          $Res Function(_$_ResetPasswordState) then) =
      __$$_ResetPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isPhoneError, String phone, String verifyId});
}

/// @nodoc
class __$$_ResetPasswordStateCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$$_ResetPasswordStateCopyWith<$Res> {
  __$$_ResetPasswordStateCopyWithImpl(
      _$_ResetPasswordState _value, $Res Function(_$_ResetPasswordState) _then)
      : super(_value, (v) => _then(v as _$_ResetPasswordState));

  @override
  _$_ResetPasswordState get _value => super._value as _$_ResetPasswordState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isPhoneError = freezed,
    Object? phone = freezed,
    Object? verifyId = freezed,
  }) {
    return _then(_$_ResetPasswordState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneError: isPhoneError == freezed
          ? _value.isPhoneError
          : isPhoneError // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verifyId: verifyId == freezed
          ? _value.verifyId
          : verifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordState extends _ResetPasswordState {
  const _$_ResetPasswordState(
      {this.isLoading = false,
      this.isPhoneError = false,
      this.phone = '',
      this.verifyId = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isPhoneError;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String verifyId;

  @override
  String toString() {
    return 'ResetPasswordState(isLoading: $isLoading, isPhoneError: $isPhoneError, phone: $phone, verifyId: $verifyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneError, isPhoneError) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.verifyId, verifyId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isPhoneError),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(verifyId));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      __$$_ResetPasswordStateCopyWithImpl<_$_ResetPasswordState>(
          this, _$identity);
}

abstract class _ResetPasswordState extends ResetPasswordState {
  const factory _ResetPasswordState(
      {final bool isLoading,
      final bool isPhoneError,
      final String phone,
      final String verifyId}) = _$_ResetPasswordState;
  const _ResetPasswordState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isPhoneError;
  @override
  String get phone;
  @override
  String get verifyId;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
