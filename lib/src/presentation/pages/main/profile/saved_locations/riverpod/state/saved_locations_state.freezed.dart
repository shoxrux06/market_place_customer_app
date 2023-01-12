// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'saved_locations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedLocationsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  List<LocalAddressData> get addresses => throw _privateConstructorUsedError;
  List<Map<MarkerId, Marker>> get listOfMarkers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedLocationsStateCopyWith<SavedLocationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedLocationsStateCopyWith<$Res> {
  factory $SavedLocationsStateCopyWith(
          SavedLocationsState value, $Res Function(SavedLocationsState) then) =
      _$SavedLocationsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isUpdating,
      List<LocalAddressData> addresses,
      List<Map<MarkerId, Marker>> listOfMarkers});
}

/// @nodoc
class _$SavedLocationsStateCopyWithImpl<$Res>
    implements $SavedLocationsStateCopyWith<$Res> {
  _$SavedLocationsStateCopyWithImpl(this._value, this._then);

  final SavedLocationsState _value;
  // ignore: unused_field
  final $Res Function(SavedLocationsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isUpdating = freezed,
    Object? addresses = freezed,
    Object? listOfMarkers = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: isUpdating == freezed
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      listOfMarkers: listOfMarkers == freezed
          ? _value.listOfMarkers
          : listOfMarkers // ignore: cast_nullable_to_non_nullable
              as List<Map<MarkerId, Marker>>,
    ));
  }
}

/// @nodoc
abstract class _$$_SavedLocationsStateCopyWith<$Res>
    implements $SavedLocationsStateCopyWith<$Res> {
  factory _$$_SavedLocationsStateCopyWith(_$_SavedLocationsState value,
          $Res Function(_$_SavedLocationsState) then) =
      __$$_SavedLocationsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isUpdating,
      List<LocalAddressData> addresses,
      List<Map<MarkerId, Marker>> listOfMarkers});
}

/// @nodoc
class __$$_SavedLocationsStateCopyWithImpl<$Res>
    extends _$SavedLocationsStateCopyWithImpl<$Res>
    implements _$$_SavedLocationsStateCopyWith<$Res> {
  __$$_SavedLocationsStateCopyWithImpl(_$_SavedLocationsState _value,
      $Res Function(_$_SavedLocationsState) _then)
      : super(_value, (v) => _then(v as _$_SavedLocationsState));

  @override
  _$_SavedLocationsState get _value => super._value as _$_SavedLocationsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isUpdating = freezed,
    Object? addresses = freezed,
    Object? listOfMarkers = freezed,
  }) {
    return _then(_$_SavedLocationsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: isUpdating == freezed
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      addresses: addresses == freezed
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      listOfMarkers: listOfMarkers == freezed
          ? _value._listOfMarkers
          : listOfMarkers // ignore: cast_nullable_to_non_nullable
              as List<Map<MarkerId, Marker>>,
    ));
  }
}

/// @nodoc

class _$_SavedLocationsState extends _SavedLocationsState {
  const _$_SavedLocationsState(
      {this.isLoading = false,
      this.isUpdating = false,
      final List<LocalAddressData> addresses = const [],
      final List<Map<MarkerId, Marker>> listOfMarkers = const []})
      : _addresses = addresses,
        _listOfMarkers = listOfMarkers,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  final List<LocalAddressData> _addresses;
  @override
  @JsonKey()
  List<LocalAddressData> get addresses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  final List<Map<MarkerId, Marker>> _listOfMarkers;
  @override
  @JsonKey()
  List<Map<MarkerId, Marker>> get listOfMarkers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfMarkers);
  }

  @override
  String toString() {
    return 'SavedLocationsState(isLoading: $isLoading, isUpdating: $isUpdating, addresses: $addresses, listOfMarkers: $listOfMarkers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedLocationsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isUpdating, isUpdating) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality()
                .equals(other._listOfMarkers, _listOfMarkers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isUpdating),
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_listOfMarkers));

  @JsonKey(ignore: true)
  @override
  _$$_SavedLocationsStateCopyWith<_$_SavedLocationsState> get copyWith =>
      __$$_SavedLocationsStateCopyWithImpl<_$_SavedLocationsState>(
          this, _$identity);
}

abstract class _SavedLocationsState extends SavedLocationsState {
  const factory _SavedLocationsState(
          {final bool isLoading,
          final bool isUpdating,
          final List<LocalAddressData> addresses,
          final List<Map<MarkerId, Marker>> listOfMarkers}) =
      _$_SavedLocationsState;
  const _SavedLocationsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  List<LocalAddressData> get addresses;
  @override
  List<Map<MarkerId, Marker>> get listOfMarkers;
  @override
  @JsonKey(ignore: true)
  _$$_SavedLocationsStateCopyWith<_$_SavedLocationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
