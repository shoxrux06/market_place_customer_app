// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_modal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressModalState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<LocalAddressData> get addresses => throw _privateConstructorUsedError;
  String get activeAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressModalStateCopyWith<AddressModalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModalStateCopyWith<$Res> {
  factory $AddressModalStateCopyWith(
          AddressModalState value, $Res Function(AddressModalState) then) =
      _$AddressModalStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, List<LocalAddressData> addresses, String activeAddress});
}

/// @nodoc
class _$AddressModalStateCopyWithImpl<$Res>
    implements $AddressModalStateCopyWith<$Res> {
  _$AddressModalStateCopyWithImpl(this._value, this._then);

  final AddressModalState _value;
  // ignore: unused_field
  final $Res Function(AddressModalState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? addresses = freezed,
    Object? activeAddress = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      activeAddress: activeAddress == freezed
          ? _value.activeAddress
          : activeAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressModalStateCopyWith<$Res>
    implements $AddressModalStateCopyWith<$Res> {
  factory _$$_AddressModalStateCopyWith(_$_AddressModalState value,
          $Res Function(_$_AddressModalState) then) =
      __$$_AddressModalStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, List<LocalAddressData> addresses, String activeAddress});
}

/// @nodoc
class __$$_AddressModalStateCopyWithImpl<$Res>
    extends _$AddressModalStateCopyWithImpl<$Res>
    implements _$$_AddressModalStateCopyWith<$Res> {
  __$$_AddressModalStateCopyWithImpl(
      _$_AddressModalState _value, $Res Function(_$_AddressModalState) _then)
      : super(_value, (v) => _then(v as _$_AddressModalState));

  @override
  _$_AddressModalState get _value => super._value as _$_AddressModalState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? addresses = freezed,
    Object? activeAddress = freezed,
  }) {
    return _then(_$_AddressModalState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addresses: addresses == freezed
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      activeAddress: activeAddress == freezed
          ? _value.activeAddress
          : activeAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddressModalState extends _AddressModalState {
  const _$_AddressModalState(
      {this.isLoading = false,
      final List<LocalAddressData> addresses = const [],
      this.activeAddress = ''})
      : _addresses = addresses,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<LocalAddressData> _addresses;
  @override
  @JsonKey()
  List<LocalAddressData> get addresses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  @JsonKey()
  final String activeAddress;

  @override
  String toString() {
    return 'AddressModalState(isLoading: $isLoading, addresses: $addresses, activeAddress: $activeAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressModalState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality()
                .equals(other.activeAddress, activeAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(activeAddress));

  @JsonKey(ignore: true)
  @override
  _$$_AddressModalStateCopyWith<_$_AddressModalState> get copyWith =>
      __$$_AddressModalStateCopyWithImpl<_$_AddressModalState>(
          this, _$identity);
}

abstract class _AddressModalState extends AddressModalState {
  const factory _AddressModalState(
      {final bool isLoading,
      final List<LocalAddressData> addresses,
      final String activeAddress}) = _$_AddressModalState;
  const _AddressModalState._() : super._();

  @override
  bool get isLoading;
  @override
  List<LocalAddressData> get addresses;
  @override
  String get activeAddress;
  @override
  @JsonKey(ignore: true)
  _$$_AddressModalStateCopyWith<_$_AddressModalState> get copyWith =>
      throw _privateConstructorUsedError;
}
