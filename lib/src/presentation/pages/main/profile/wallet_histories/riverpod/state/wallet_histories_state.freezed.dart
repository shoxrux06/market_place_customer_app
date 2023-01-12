// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_histories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletHistoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<WalletData> get wallets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletHistoriesStateCopyWith<WalletHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoriesStateCopyWith<$Res> {
  factory $WalletHistoriesStateCopyWith(WalletHistoriesState value,
          $Res Function(WalletHistoriesState) then) =
      _$WalletHistoriesStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isMoreLoading, List<WalletData> wallets});
}

/// @nodoc
class _$WalletHistoriesStateCopyWithImpl<$Res>
    implements $WalletHistoriesStateCopyWith<$Res> {
  _$WalletHistoriesStateCopyWithImpl(this._value, this._then);

  final WalletHistoriesState _value;
  // ignore: unused_field
  final $Res Function(WalletHistoriesState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? wallets = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wallets: wallets == freezed
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<WalletData>,
    ));
  }
}

/// @nodoc
abstract class _$$_WalletHistoriesStateCopyWith<$Res>
    implements $WalletHistoriesStateCopyWith<$Res> {
  factory _$$_WalletHistoriesStateCopyWith(_$_WalletHistoriesState value,
          $Res Function(_$_WalletHistoriesState) then) =
      __$$_WalletHistoriesStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isMoreLoading, List<WalletData> wallets});
}

/// @nodoc
class __$$_WalletHistoriesStateCopyWithImpl<$Res>
    extends _$WalletHistoriesStateCopyWithImpl<$Res>
    implements _$$_WalletHistoriesStateCopyWith<$Res> {
  __$$_WalletHistoriesStateCopyWithImpl(_$_WalletHistoriesState _value,
      $Res Function(_$_WalletHistoriesState) _then)
      : super(_value, (v) => _then(v as _$_WalletHistoriesState));

  @override
  _$_WalletHistoriesState get _value => super._value as _$_WalletHistoriesState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? wallets = freezed,
  }) {
    return _then(_$_WalletHistoriesState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wallets: wallets == freezed
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<WalletData>,
    ));
  }
}

/// @nodoc

class _$_WalletHistoriesState extends _WalletHistoriesState {
  const _$_WalletHistoriesState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<WalletData> wallets = const []})
      : _wallets = wallets,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<WalletData> _wallets;
  @override
  @JsonKey()
  List<WalletData> get wallets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  @override
  String toString() {
    return 'WalletHistoriesState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, wallets: $wallets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletHistoriesState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isMoreLoading, isMoreLoading) &&
            const DeepCollectionEquality().equals(other._wallets, _wallets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(_wallets));

  @JsonKey(ignore: true)
  @override
  _$$_WalletHistoriesStateCopyWith<_$_WalletHistoriesState> get copyWith =>
      __$$_WalletHistoriesStateCopyWithImpl<_$_WalletHistoriesState>(
          this, _$identity);
}

abstract class _WalletHistoriesState extends WalletHistoriesState {
  const factory _WalletHistoriesState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<WalletData> wallets}) = _$_WalletHistoriesState;
  const _WalletHistoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<WalletData> get wallets;
  @override
  @JsonKey(ignore: true)
  _$$_WalletHistoriesStateCopyWith<_$_WalletHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
