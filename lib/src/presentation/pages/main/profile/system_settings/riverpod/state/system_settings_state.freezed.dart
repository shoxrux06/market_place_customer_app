// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'system_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SystemSettingsState {
  bool get isCurrenciesLoading => throw _privateConstructorUsedError;
  bool get isCurrencySaving => throw _privateConstructorUsedError;
  List<CurrencyData> get currencies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SystemSettingsStateCopyWith<SystemSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemSettingsStateCopyWith<$Res> {
  factory $SystemSettingsStateCopyWith(
          SystemSettingsState value, $Res Function(SystemSettingsState) then) =
      _$SystemSettingsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isCurrenciesLoading,
      bool isCurrencySaving,
      List<CurrencyData> currencies});
}

/// @nodoc
class _$SystemSettingsStateCopyWithImpl<$Res>
    implements $SystemSettingsStateCopyWith<$Res> {
  _$SystemSettingsStateCopyWithImpl(this._value, this._then);

  final SystemSettingsState _value;
  // ignore: unused_field
  final $Res Function(SystemSettingsState) _then;

  @override
  $Res call({
    Object? isCurrenciesLoading = freezed,
    Object? isCurrencySaving = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_value.copyWith(
      isCurrenciesLoading: isCurrenciesLoading == freezed
          ? _value.isCurrenciesLoading
          : isCurrenciesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrencySaving: isCurrencySaving == freezed
          ? _value.isCurrencySaving
          : isCurrencySaving // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: currencies == freezed
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
    ));
  }
}

/// @nodoc
abstract class _$$_SystemSettingsStateCopyWith<$Res>
    implements $SystemSettingsStateCopyWith<$Res> {
  factory _$$_SystemSettingsStateCopyWith(_$_SystemSettingsState value,
          $Res Function(_$_SystemSettingsState) then) =
      __$$_SystemSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isCurrenciesLoading,
      bool isCurrencySaving,
      List<CurrencyData> currencies});
}

/// @nodoc
class __$$_SystemSettingsStateCopyWithImpl<$Res>
    extends _$SystemSettingsStateCopyWithImpl<$Res>
    implements _$$_SystemSettingsStateCopyWith<$Res> {
  __$$_SystemSettingsStateCopyWithImpl(_$_SystemSettingsState _value,
      $Res Function(_$_SystemSettingsState) _then)
      : super(_value, (v) => _then(v as _$_SystemSettingsState));

  @override
  _$_SystemSettingsState get _value => super._value as _$_SystemSettingsState;

  @override
  $Res call({
    Object? isCurrenciesLoading = freezed,
    Object? isCurrencySaving = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_$_SystemSettingsState(
      isCurrenciesLoading: isCurrenciesLoading == freezed
          ? _value.isCurrenciesLoading
          : isCurrenciesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrencySaving: isCurrencySaving == freezed
          ? _value.isCurrencySaving
          : isCurrencySaving // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: currencies == freezed
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
    ));
  }
}

/// @nodoc

class _$_SystemSettingsState extends _SystemSettingsState {
  const _$_SystemSettingsState(
      {this.isCurrenciesLoading = false,
      this.isCurrencySaving = false,
      final List<CurrencyData> currencies = const []})
      : _currencies = currencies,
        super._();

  @override
  @JsonKey()
  final bool isCurrenciesLoading;
  @override
  @JsonKey()
  final bool isCurrencySaving;
  final List<CurrencyData> _currencies;
  @override
  @JsonKey()
  List<CurrencyData> get currencies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  @override
  String toString() {
    return 'SystemSettingsState(isCurrenciesLoading: $isCurrenciesLoading, isCurrencySaving: $isCurrencySaving, currencies: $currencies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemSettingsState &&
            const DeepCollectionEquality()
                .equals(other.isCurrenciesLoading, isCurrenciesLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCurrencySaving, isCurrencySaving) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isCurrenciesLoading),
      const DeepCollectionEquality().hash(isCurrencySaving),
      const DeepCollectionEquality().hash(_currencies));

  @JsonKey(ignore: true)
  @override
  _$$_SystemSettingsStateCopyWith<_$_SystemSettingsState> get copyWith =>
      __$$_SystemSettingsStateCopyWithImpl<_$_SystemSettingsState>(
          this, _$identity);
}

abstract class _SystemSettingsState extends SystemSettingsState {
  const factory _SystemSettingsState(
      {final bool isCurrenciesLoading,
      final bool isCurrencySaving,
      final List<CurrencyData> currencies}) = _$_SystemSettingsState;
  const _SystemSettingsState._() : super._();

  @override
  bool get isCurrenciesLoading;
  @override
  bool get isCurrencySaving;
  @override
  List<CurrencyData> get currencies;
  @override
  @JsonKey(ignore: true)
  _$$_SystemSettingsStateCopyWith<_$_SystemSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
