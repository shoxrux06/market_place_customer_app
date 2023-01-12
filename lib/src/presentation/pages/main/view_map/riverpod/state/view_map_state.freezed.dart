// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewMapState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ShopData> get shops => throw _privateConstructorUsedError;
  Map<MarkerId, Marker> get shopMarkers => throw _privateConstructorUsedError;
  GlobalKey<State<StatefulWidget>>? get globalKey =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewMapStateCopyWith<ViewMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewMapStateCopyWith<$Res> {
  factory $ViewMapStateCopyWith(
          ViewMapState value, $Res Function(ViewMapState) then) =
      _$ViewMapStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<ShopData> shops,
      Map<MarkerId, Marker> shopMarkers,
      GlobalKey<State<StatefulWidget>>? globalKey});
}

/// @nodoc
class _$ViewMapStateCopyWithImpl<$Res> implements $ViewMapStateCopyWith<$Res> {
  _$ViewMapStateCopyWithImpl(this._value, this._then);

  final ViewMapState _value;
  // ignore: unused_field
  final $Res Function(ViewMapState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? shops = freezed,
    Object? shopMarkers = freezed,
    Object? globalKey = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shops: shops == freezed
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shopMarkers: shopMarkers == freezed
          ? _value.shopMarkers
          : shopMarkers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      globalKey: globalKey == freezed
          ? _value.globalKey
          : globalKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ViewMapStateCopyWith<$Res>
    implements $ViewMapStateCopyWith<$Res> {
  factory _$$_ViewMapStateCopyWith(
          _$_ViewMapState value, $Res Function(_$_ViewMapState) then) =
      __$$_ViewMapStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<ShopData> shops,
      Map<MarkerId, Marker> shopMarkers,
      GlobalKey<State<StatefulWidget>>? globalKey});
}

/// @nodoc
class __$$_ViewMapStateCopyWithImpl<$Res>
    extends _$ViewMapStateCopyWithImpl<$Res>
    implements _$$_ViewMapStateCopyWith<$Res> {
  __$$_ViewMapStateCopyWithImpl(
      _$_ViewMapState _value, $Res Function(_$_ViewMapState) _then)
      : super(_value, (v) => _then(v as _$_ViewMapState));

  @override
  _$_ViewMapState get _value => super._value as _$_ViewMapState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? shops = freezed,
    Object? shopMarkers = freezed,
    Object? globalKey = freezed,
  }) {
    return _then(_$_ViewMapState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shops: shops == freezed
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shopMarkers: shopMarkers == freezed
          ? _value._shopMarkers
          : shopMarkers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      globalKey: globalKey == freezed
          ? _value.globalKey
          : globalKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>?,
    ));
  }
}

/// @nodoc

class _$_ViewMapState extends _ViewMapState {
  const _$_ViewMapState(
      {this.isLoading = false,
      final List<ShopData> shops = const [],
      final Map<MarkerId, Marker> shopMarkers = const {},
      this.globalKey})
      : _shops = shops,
        _shopMarkers = shopMarkers,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ShopData> _shops;
  @override
  @JsonKey()
  List<ShopData> get shops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  final Map<MarkerId, Marker> _shopMarkers;
  @override
  @JsonKey()
  Map<MarkerId, Marker> get shopMarkers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_shopMarkers);
  }

  @override
  final GlobalKey<State<StatefulWidget>>? globalKey;

  @override
  String toString() {
    return 'ViewMapState(isLoading: $isLoading, shops: $shops, shopMarkers: $shopMarkers, globalKey: $globalKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewMapState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other._shops, _shops) &&
            const DeepCollectionEquality()
                .equals(other._shopMarkers, _shopMarkers) &&
            const DeepCollectionEquality().equals(other.globalKey, globalKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_shops),
      const DeepCollectionEquality().hash(_shopMarkers),
      const DeepCollectionEquality().hash(globalKey));

  @JsonKey(ignore: true)
  @override
  _$$_ViewMapStateCopyWith<_$_ViewMapState> get copyWith =>
      __$$_ViewMapStateCopyWithImpl<_$_ViewMapState>(this, _$identity);
}

abstract class _ViewMapState extends ViewMapState {
  const factory _ViewMapState(
      {final bool isLoading,
      final List<ShopData> shops,
      final Map<MarkerId, Marker> shopMarkers,
      final GlobalKey<State<StatefulWidget>>? globalKey}) = _$_ViewMapState;
  const _ViewMapState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ShopData> get shops;
  @override
  Map<MarkerId, Marker> get shopMarkers;
  @override
  GlobalKey<State<StatefulWidget>>? get globalKey;
  @override
  @JsonKey(ignore: true)
  _$$_ViewMapStateCopyWith<_$_ViewMapState> get copyWith =>
      throw _privateConstructorUsedError;
}
