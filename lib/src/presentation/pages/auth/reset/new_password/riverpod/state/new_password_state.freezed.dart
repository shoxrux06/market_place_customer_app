// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewPasswordState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showNewPassword => throw _privateConstructorUsedError;
  bool get showConfirmNewPassword => throw _privateConstructorUsedError;
  bool get isConfirmPasswordSame => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmNewPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPasswordStateCopyWith<NewPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPasswordStateCopyWith<$Res> {
  factory $NewPasswordStateCopyWith(
          NewPasswordState value, $Res Function(NewPasswordState) then) =
      _$NewPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool showNewPassword,
      bool showConfirmNewPassword,
      bool isConfirmPasswordSame,
      String newPassword,
      String confirmNewPassword});
}

/// @nodoc
class _$NewPasswordStateCopyWithImpl<$Res>
    implements $NewPasswordStateCopyWith<$Res> {
  _$NewPasswordStateCopyWithImpl(this._value, this._then);

  final NewPasswordState _value;
  // ignore: unused_field
  final $Res Function(NewPasswordState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? showNewPassword = freezed,
    Object? showConfirmNewPassword = freezed,
    Object? isConfirmPasswordSame = freezed,
    Object? newPassword = freezed,
    Object? confirmNewPassword = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showNewPassword: showNewPassword == freezed
          ? _value.showNewPassword
          : showNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmNewPassword: showConfirmNewPassword == freezed
          ? _value.showConfirmNewPassword
          : showConfirmNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordSame: isConfirmPasswordSame == freezed
          ? _value.isConfirmPasswordSame
          : isConfirmPasswordSame // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmNewPassword: confirmNewPassword == freezed
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NewPasswordStateCopyWith<$Res>
    implements $NewPasswordStateCopyWith<$Res> {
  factory _$$_NewPasswordStateCopyWith(
          _$_NewPasswordState value, $Res Function(_$_NewPasswordState) then) =
      __$$_NewPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool showNewPassword,
      bool showConfirmNewPassword,
      bool isConfirmPasswordSame,
      String newPassword,
      String confirmNewPassword});
}

/// @nodoc
class __$$_NewPasswordStateCopyWithImpl<$Res>
    extends _$NewPasswordStateCopyWithImpl<$Res>
    implements _$$_NewPasswordStateCopyWith<$Res> {
  __$$_NewPasswordStateCopyWithImpl(
      _$_NewPasswordState _value, $Res Function(_$_NewPasswordState) _then)
      : super(_value, (v) => _then(v as _$_NewPasswordState));

  @override
  _$_NewPasswordState get _value => super._value as _$_NewPasswordState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? showNewPassword = freezed,
    Object? showConfirmNewPassword = freezed,
    Object? isConfirmPasswordSame = freezed,
    Object? newPassword = freezed,
    Object? confirmNewPassword = freezed,
  }) {
    return _then(_$_NewPasswordState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showNewPassword: showNewPassword == freezed
          ? _value.showNewPassword
          : showNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmNewPassword: showConfirmNewPassword == freezed
          ? _value.showConfirmNewPassword
          : showConfirmNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordSame: isConfirmPasswordSame == freezed
          ? _value.isConfirmPasswordSame
          : isConfirmPasswordSame // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmNewPassword: confirmNewPassword == freezed
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NewPasswordState extends _NewPasswordState {
  const _$_NewPasswordState(
      {this.isLoading = false,
      this.showNewPassword = false,
      this.showConfirmNewPassword = false,
      this.isConfirmPasswordSame = true,
      this.newPassword = '',
      this.confirmNewPassword = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool showNewPassword;
  @override
  @JsonKey()
  final bool showConfirmNewPassword;
  @override
  @JsonKey()
  final bool isConfirmPasswordSame;
  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final String confirmNewPassword;

  @override
  String toString() {
    return 'NewPasswordState(isLoading: $isLoading, showNewPassword: $showNewPassword, showConfirmNewPassword: $showConfirmNewPassword, isConfirmPasswordSame: $isConfirmPasswordSame, newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewPasswordState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.showNewPassword, showNewPassword) &&
            const DeepCollectionEquality()
                .equals(other.showConfirmNewPassword, showConfirmNewPassword) &&
            const DeepCollectionEquality()
                .equals(other.isConfirmPasswordSame, isConfirmPasswordSame) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality()
                .equals(other.confirmNewPassword, confirmNewPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(showNewPassword),
      const DeepCollectionEquality().hash(showConfirmNewPassword),
      const DeepCollectionEquality().hash(isConfirmPasswordSame),
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(confirmNewPassword));

  @JsonKey(ignore: true)
  @override
  _$$_NewPasswordStateCopyWith<_$_NewPasswordState> get copyWith =>
      __$$_NewPasswordStateCopyWithImpl<_$_NewPasswordState>(this, _$identity);
}

abstract class _NewPasswordState extends NewPasswordState {
  const factory _NewPasswordState(
      {final bool isLoading,
      final bool showNewPassword,
      final bool showConfirmNewPassword,
      final bool isConfirmPasswordSame,
      final String newPassword,
      final String confirmNewPassword}) = _$_NewPasswordState;
  const _NewPasswordState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get showNewPassword;
  @override
  bool get showConfirmNewPassword;
  @override
  bool get isConfirmPasswordSame;
  @override
  String get newPassword;
  @override
  String get confirmNewPassword;
  @override
  @JsonKey(ignore: true)
  _$$_NewPasswordStateCopyWith<_$_NewPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
