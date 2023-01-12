// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brands_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BrandsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<BrandData> get brands => throw _privateConstructorUsedError;
  List<BrandData> get searchedBrands => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandsStateCopyWith<BrandsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandsStateCopyWith<$Res> {
  factory $BrandsStateCopyWith(
          BrandsState value, $Res Function(BrandsState) then) =
      _$BrandsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      bool isMoreLoading,
      List<BrandData> brands,
      List<BrandData> searchedBrands,
      String query});
}

/// @nodoc
class _$BrandsStateCopyWithImpl<$Res> implements $BrandsStateCopyWith<$Res> {
  _$BrandsStateCopyWithImpl(this._value, this._then);

  final BrandsState _value;
  // ignore: unused_field
  final $Res Function(BrandsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSearching = freezed,
    Object? isSearchLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? brands = freezed,
    Object? searchedBrands = freezed,
    Object? query = freezed,
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
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: brands == freezed
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      searchedBrands: searchedBrands == freezed
          ? _value.searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BrandsStateCopyWith<$Res>
    implements $BrandsStateCopyWith<$Res> {
  factory _$$_BrandsStateCopyWith(
          _$_BrandsState value, $Res Function(_$_BrandsState) then) =
      __$$_BrandsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      bool isMoreLoading,
      List<BrandData> brands,
      List<BrandData> searchedBrands,
      String query});
}

/// @nodoc
class __$$_BrandsStateCopyWithImpl<$Res> extends _$BrandsStateCopyWithImpl<$Res>
    implements _$$_BrandsStateCopyWith<$Res> {
  __$$_BrandsStateCopyWithImpl(
      _$_BrandsState _value, $Res Function(_$_BrandsState) _then)
      : super(_value, (v) => _then(v as _$_BrandsState));

  @override
  _$_BrandsState get _value => super._value as _$_BrandsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSearching = freezed,
    Object? isSearchLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? brands = freezed,
    Object? searchedBrands = freezed,
    Object? query = freezed,
  }) {
    return _then(_$_BrandsState(
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
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: brands == freezed
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      searchedBrands: searchedBrands == freezed
          ? _value._searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BrandsState extends _BrandsState {
  const _$_BrandsState(
      {this.isLoading = false,
      this.isSearching = false,
      this.isSearchLoading = false,
      this.isMoreLoading = false,
      final List<BrandData> brands = const [],
      final List<BrandData> searchedBrands = const [],
      this.query = ''})
      : _brands = brands,
        _searchedBrands = searchedBrands,
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
  final bool isMoreLoading;
  final List<BrandData> _brands;
  @override
  @JsonKey()
  List<BrandData> get brands {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  final List<BrandData> _searchedBrands;
  @override
  @JsonKey()
  List<BrandData> get searchedBrands {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedBrands);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'BrandsState(isLoading: $isLoading, isSearching: $isSearching, isSearchLoading: $isSearchLoading, isMoreLoading: $isMoreLoading, brands: $brands, searchedBrands: $searchedBrands, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrandsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isSearching, isSearching) &&
            const DeepCollectionEquality()
                .equals(other.isSearchLoading, isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other.isMoreLoading, isMoreLoading) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality()
                .equals(other._searchedBrands, _searchedBrands) &&
            const DeepCollectionEquality().equals(other.query, query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSearching),
      const DeepCollectionEquality().hash(isSearchLoading),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(_brands),
      const DeepCollectionEquality().hash(_searchedBrands),
      const DeepCollectionEquality().hash(query));

  @JsonKey(ignore: true)
  @override
  _$$_BrandsStateCopyWith<_$_BrandsState> get copyWith =>
      __$$_BrandsStateCopyWithImpl<_$_BrandsState>(this, _$identity);
}

abstract class _BrandsState extends BrandsState {
  const factory _BrandsState(
      {final bool isLoading,
      final bool isSearching,
      final bool isSearchLoading,
      final bool isMoreLoading,
      final List<BrandData> brands,
      final List<BrandData> searchedBrands,
      final String query}) = _$_BrandsState;
  const _BrandsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  bool get isMoreLoading;
  @override
  List<BrandData> get brands;
  @override
  List<BrandData> get searchedBrands;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$_BrandsStateCopyWith<_$_BrandsState> get copyWith =>
      throw _privateConstructorUsedError;
}
