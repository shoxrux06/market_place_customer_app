// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'saved_stores_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedStoresState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  List<ShopData> get searchedShops => throw _privateConstructorUsedError;
  List<ShopData> get shops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedStoresStateCopyWith<SavedStoresState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedStoresStateCopyWith<$Res> {
  factory $SavedStoresStateCopyWith(
          SavedStoresState value, $Res Function(SavedStoresState) then) =
      _$SavedStoresStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      String query,
      List<ShopData> searchedShops,
      List<ShopData> shops});
}

/// @nodoc
class _$SavedStoresStateCopyWithImpl<$Res>
    implements $SavedStoresStateCopyWith<$Res> {
  _$SavedStoresStateCopyWithImpl(this._value, this._then);

  final SavedStoresState _value;
  // ignore: unused_field
  final $Res Function(SavedStoresState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSearching = freezed,
    Object? isSearchLoading = freezed,
    Object? query = freezed,
    Object? searchedShops = freezed,
    Object? shops = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: isSearchLoading == freezed
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedShops: searchedShops == freezed
          ? _value.searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shops: shops == freezed
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ));
  }
}

/// @nodoc
abstract class _$$_SavedStoresStateCopyWith<$Res>
    implements $SavedStoresStateCopyWith<$Res> {
  factory _$$_SavedStoresStateCopyWith(
          _$_SavedStoresState value, $Res Function(_$_SavedStoresState) then) =
      __$$_SavedStoresStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      String query,
      List<ShopData> searchedShops,
      List<ShopData> shops});
}

/// @nodoc
class __$$_SavedStoresStateCopyWithImpl<$Res>
    extends _$SavedStoresStateCopyWithImpl<$Res>
    implements _$$_SavedStoresStateCopyWith<$Res> {
  __$$_SavedStoresStateCopyWithImpl(
      _$_SavedStoresState _value, $Res Function(_$_SavedStoresState) _then)
      : super(_value, (v) => _then(v as _$_SavedStoresState));

  @override
  _$_SavedStoresState get _value => super._value as _$_SavedStoresState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSearching = freezed,
    Object? isSearchLoading = freezed,
    Object? query = freezed,
    Object? searchedShops = freezed,
    Object? shops = freezed,
  }) {
    return _then(_$_SavedStoresState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: isSearchLoading == freezed
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedShops: searchedShops == freezed
          ? _value._searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shops: shops == freezed
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ));
  }
}

/// @nodoc

class _$_SavedStoresState extends _SavedStoresState {
  const _$_SavedStoresState(
      {this.isLoading = false,
      this.isSearching = false,
      this.isSearchLoading = false,
      this.query = '',
      final List<ShopData> searchedShops = const [],
      final List<ShopData> shops = const []})
      : _searchedShops = searchedShops,
        _shops = shops,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  @override
  @JsonKey()
  final String query;
  final List<ShopData> _searchedShops;
  @override
  @JsonKey()
  List<ShopData> get searchedShops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedShops);
  }

  final List<ShopData> _shops;
  @override
  @JsonKey()
  List<ShopData> get shops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  @override
  String toString() {
    return 'SavedStoresState(isLoading: $isLoading, isSearching: $isSearching, isSearchLoading: $isSearchLoading, query: $query, searchedShops: $searchedShops, shops: $shops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedStoresState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isSearching, isSearching) &&
            const DeepCollectionEquality()
                .equals(other.isSearchLoading, isSearchLoading) &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality()
                .equals(other._searchedShops, _searchedShops) &&
            const DeepCollectionEquality().equals(other._shops, _shops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSearching),
      const DeepCollectionEquality().hash(isSearchLoading),
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(_searchedShops),
      const DeepCollectionEquality().hash(_shops));

  @JsonKey(ignore: true)
  @override
  _$$_SavedStoresStateCopyWith<_$_SavedStoresState> get copyWith =>
      __$$_SavedStoresStateCopyWithImpl<_$_SavedStoresState>(this, _$identity);
}

abstract class _SavedStoresState extends SavedStoresState {
  const factory _SavedStoresState(
      {final bool isLoading,
      final bool isSearching,
      final bool isSearchLoading,
      final String query,
      final List<ShopData> searchedShops,
      final List<ShopData> shops}) = _$_SavedStoresState;
  const _SavedStoresState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  String get query;
  @override
  List<ShopData> get searchedShops;
  @override
  List<ShopData> get shops;
  @override
  @JsonKey(ignore: true)
  _$$_SavedStoresStateCopyWith<_$_SavedStoresState> get copyWith =>
      throw _privateConstructorUsedError;
}
