// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'liked_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikedState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  bool get isLikedProductsLoading => throw _privateConstructorUsedError;
  bool get isCategoriesLoading => throw _privateConstructorUsedError;
  bool get isBrandsLoading => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  List<ProductData> get likedProducts => throw _privateConstructorUsedError;
  List<ProductData> get filteredProducts => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  List<BrandData> get brands => throw _privateConstructorUsedError;
  int get selectedCategoryId => throw _privateConstructorUsedError;
  int get selectedBrandId => throw _privateConstructorUsedError;
  int get selectedSearchCategoryId => throw _privateConstructorUsedError;
  int get selectedSearchBrandId => throw _privateConstructorUsedError;
  PriceFilter get priceFilter => throw _privateConstructorUsedError;
  ListAlignment get listAlignment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikedStateCopyWith<LikedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedStateCopyWith<$Res> {
  factory $LikedStateCopyWith(
          LikedState value, $Res Function(LikedState) then) =
      _$LikedStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isLikedProductsLoading,
      bool isCategoriesLoading,
      bool isBrandsLoading,
      String query,
      List<ProductData> searchedProducts,
      List<ProductData> likedProducts,
      List<ProductData> filteredProducts,
      List<CategoryData> categories,
      List<BrandData> brands,
      int selectedCategoryId,
      int selectedBrandId,
      int selectedSearchCategoryId,
      int selectedSearchBrandId,
      PriceFilter priceFilter,
      ListAlignment listAlignment});
}

/// @nodoc
class _$LikedStateCopyWithImpl<$Res> implements $LikedStateCopyWith<$Res> {
  _$LikedStateCopyWithImpl(this._value, this._then);

  final LikedState _value;
  // ignore: unused_field
  final $Res Function(LikedState) _then;

  @override
  $Res call({
    Object? isSearching = freezed,
    Object? isSearchLoading = freezed,
    Object? isLikedProductsLoading = freezed,
    Object? isCategoriesLoading = freezed,
    Object? isBrandsLoading = freezed,
    Object? query = freezed,
    Object? searchedProducts = freezed,
    Object? likedProducts = freezed,
    Object? filteredProducts = freezed,
    Object? categories = freezed,
    Object? brands = freezed,
    Object? selectedCategoryId = freezed,
    Object? selectedBrandId = freezed,
    Object? selectedSearchCategoryId = freezed,
    Object? selectedSearchBrandId = freezed,
    Object? priceFilter = freezed,
    Object? listAlignment = freezed,
  }) {
    return _then(_value.copyWith(
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: isSearchLoading == freezed
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLikedProductsLoading: isLikedProductsLoading == freezed
          ? _value.isLikedProductsLoading
          : isLikedProductsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: isCategoriesLoading == freezed
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBrandsLoading: isBrandsLoading == freezed
          ? _value.isBrandsLoading
          : isBrandsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedProducts: searchedProducts == freezed
          ? _value.searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      likedProducts: likedProducts == freezed
          ? _value.likedProducts
          : likedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      filteredProducts: filteredProducts == freezed
          ? _value.filteredProducts
          : filteredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      brands: brands == freezed
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      selectedCategoryId: selectedCategoryId == freezed
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedBrandId: selectedBrandId == freezed
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSearchCategoryId: selectedSearchCategoryId == freezed
          ? _value.selectedSearchCategoryId
          : selectedSearchCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSearchBrandId: selectedSearchBrandId == freezed
          ? _value.selectedSearchBrandId
          : selectedSearchBrandId // ignore: cast_nullable_to_non_nullable
              as int,
      priceFilter: priceFilter == freezed
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as PriceFilter,
      listAlignment: listAlignment == freezed
          ? _value.listAlignment
          : listAlignment // ignore: cast_nullable_to_non_nullable
              as ListAlignment,
    ));
  }
}

/// @nodoc
abstract class _$$_LikedStateCopyWith<$Res>
    implements $LikedStateCopyWith<$Res> {
  factory _$$_LikedStateCopyWith(
          _$_LikedState value, $Res Function(_$_LikedState) then) =
      __$$_LikedStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isLikedProductsLoading,
      bool isCategoriesLoading,
      bool isBrandsLoading,
      String query,
      List<ProductData> searchedProducts,
      List<ProductData> likedProducts,
      List<ProductData> filteredProducts,
      List<CategoryData> categories,
      List<BrandData> brands,
      int selectedCategoryId,
      int selectedBrandId,
      int selectedSearchCategoryId,
      int selectedSearchBrandId,
      PriceFilter priceFilter,
      ListAlignment listAlignment});
}

/// @nodoc
class __$$_LikedStateCopyWithImpl<$Res> extends _$LikedStateCopyWithImpl<$Res>
    implements _$$_LikedStateCopyWith<$Res> {
  __$$_LikedStateCopyWithImpl(
      _$_LikedState _value, $Res Function(_$_LikedState) _then)
      : super(_value, (v) => _then(v as _$_LikedState));

  @override
  _$_LikedState get _value => super._value as _$_LikedState;

  @override
  $Res call({
    Object? isSearching = freezed,
    Object? isSearchLoading = freezed,
    Object? isLikedProductsLoading = freezed,
    Object? isCategoriesLoading = freezed,
    Object? isBrandsLoading = freezed,
    Object? query = freezed,
    Object? searchedProducts = freezed,
    Object? likedProducts = freezed,
    Object? filteredProducts = freezed,
    Object? categories = freezed,
    Object? brands = freezed,
    Object? selectedCategoryId = freezed,
    Object? selectedBrandId = freezed,
    Object? selectedSearchCategoryId = freezed,
    Object? selectedSearchBrandId = freezed,
    Object? priceFilter = freezed,
    Object? listAlignment = freezed,
  }) {
    return _then(_$_LikedState(
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: isSearchLoading == freezed
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLikedProductsLoading: isLikedProductsLoading == freezed
          ? _value.isLikedProductsLoading
          : isLikedProductsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: isCategoriesLoading == freezed
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBrandsLoading: isBrandsLoading == freezed
          ? _value.isBrandsLoading
          : isBrandsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedProducts: searchedProducts == freezed
          ? _value._searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      likedProducts: likedProducts == freezed
          ? _value._likedProducts
          : likedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      filteredProducts: filteredProducts == freezed
          ? _value._filteredProducts
          : filteredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      brands: brands == freezed
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      selectedCategoryId: selectedCategoryId == freezed
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedBrandId: selectedBrandId == freezed
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSearchCategoryId: selectedSearchCategoryId == freezed
          ? _value.selectedSearchCategoryId
          : selectedSearchCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSearchBrandId: selectedSearchBrandId == freezed
          ? _value.selectedSearchBrandId
          : selectedSearchBrandId // ignore: cast_nullable_to_non_nullable
              as int,
      priceFilter: priceFilter == freezed
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as PriceFilter,
      listAlignment: listAlignment == freezed
          ? _value.listAlignment
          : listAlignment // ignore: cast_nullable_to_non_nullable
              as ListAlignment,
    ));
  }
}

/// @nodoc

class _$_LikedState extends _LikedState {
  const _$_LikedState(
      {this.isSearching = false,
      this.isSearchLoading = false,
      this.isLikedProductsLoading = false,
      this.isCategoriesLoading = false,
      this.isBrandsLoading = false,
      this.query = '',
      final List<ProductData> searchedProducts = const [],
      final List<ProductData> likedProducts = const [],
      final List<ProductData> filteredProducts = const [],
      final List<CategoryData> categories = const [],
      final List<BrandData> brands = const [],
      this.selectedCategoryId = 0,
      this.selectedBrandId = 0,
      this.selectedSearchCategoryId = 0,
      this.selectedSearchBrandId = 0,
      this.priceFilter = PriceFilter.byLow,
      this.listAlignment = ListAlignment.vertically})
      : _searchedProducts = searchedProducts,
        _likedProducts = likedProducts,
        _filteredProducts = filteredProducts,
        _categories = categories,
        _brands = brands,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  @override
  @JsonKey()
  final bool isLikedProductsLoading;
  @override
  @JsonKey()
  final bool isCategoriesLoading;
  @override
  @JsonKey()
  final bool isBrandsLoading;
  @override
  @JsonKey()
  final String query;
  final List<ProductData> _searchedProducts;
  @override
  @JsonKey()
  List<ProductData> get searchedProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedProducts);
  }

  final List<ProductData> _likedProducts;
  @override
  @JsonKey()
  List<ProductData> get likedProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedProducts);
  }

  final List<ProductData> _filteredProducts;
  @override
  @JsonKey()
  List<ProductData> get filteredProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredProducts);
  }

  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<BrandData> _brands;
  @override
  @JsonKey()
  List<BrandData> get brands {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  @JsonKey()
  final int selectedCategoryId;
  @override
  @JsonKey()
  final int selectedBrandId;
  @override
  @JsonKey()
  final int selectedSearchCategoryId;
  @override
  @JsonKey()
  final int selectedSearchBrandId;
  @override
  @JsonKey()
  final PriceFilter priceFilter;
  @override
  @JsonKey()
  final ListAlignment listAlignment;

  @override
  String toString() {
    return 'LikedState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, isLikedProductsLoading: $isLikedProductsLoading, isCategoriesLoading: $isCategoriesLoading, isBrandsLoading: $isBrandsLoading, query: $query, searchedProducts: $searchedProducts, likedProducts: $likedProducts, filteredProducts: $filteredProducts, categories: $categories, brands: $brands, selectedCategoryId: $selectedCategoryId, selectedBrandId: $selectedBrandId, selectedSearchCategoryId: $selectedSearchCategoryId, selectedSearchBrandId: $selectedSearchBrandId, priceFilter: $priceFilter, listAlignment: $listAlignment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikedState &&
            const DeepCollectionEquality()
                .equals(other.isSearching, isSearching) &&
            const DeepCollectionEquality()
                .equals(other.isSearchLoading, isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other.isLikedProductsLoading, isLikedProductsLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCategoriesLoading, isCategoriesLoading) &&
            const DeepCollectionEquality()
                .equals(other.isBrandsLoading, isBrandsLoading) &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts) &&
            const DeepCollectionEquality()
                .equals(other._likedProducts, _likedProducts) &&
            const DeepCollectionEquality()
                .equals(other._filteredProducts, _filteredProducts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategoryId, selectedCategoryId) &&
            const DeepCollectionEquality()
                .equals(other.selectedBrandId, selectedBrandId) &&
            const DeepCollectionEquality().equals(
                other.selectedSearchCategoryId, selectedSearchCategoryId) &&
            const DeepCollectionEquality()
                .equals(other.selectedSearchBrandId, selectedSearchBrandId) &&
            const DeepCollectionEquality()
                .equals(other.priceFilter, priceFilter) &&
            const DeepCollectionEquality()
                .equals(other.listAlignment, listAlignment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSearching),
      const DeepCollectionEquality().hash(isSearchLoading),
      const DeepCollectionEquality().hash(isLikedProductsLoading),
      const DeepCollectionEquality().hash(isCategoriesLoading),
      const DeepCollectionEquality().hash(isBrandsLoading),
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(_searchedProducts),
      const DeepCollectionEquality().hash(_likedProducts),
      const DeepCollectionEquality().hash(_filteredProducts),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_brands),
      const DeepCollectionEquality().hash(selectedCategoryId),
      const DeepCollectionEquality().hash(selectedBrandId),
      const DeepCollectionEquality().hash(selectedSearchCategoryId),
      const DeepCollectionEquality().hash(selectedSearchBrandId),
      const DeepCollectionEquality().hash(priceFilter),
      const DeepCollectionEquality().hash(listAlignment));

  @JsonKey(ignore: true)
  @override
  _$$_LikedStateCopyWith<_$_LikedState> get copyWith =>
      __$$_LikedStateCopyWithImpl<_$_LikedState>(this, _$identity);
}

abstract class _LikedState extends LikedState {
  const factory _LikedState(
      {final bool isSearching,
      final bool isSearchLoading,
      final bool isLikedProductsLoading,
      final bool isCategoriesLoading,
      final bool isBrandsLoading,
      final String query,
      final List<ProductData> searchedProducts,
      final List<ProductData> likedProducts,
      final List<ProductData> filteredProducts,
      final List<CategoryData> categories,
      final List<BrandData> brands,
      final int selectedCategoryId,
      final int selectedBrandId,
      final int selectedSearchCategoryId,
      final int selectedSearchBrandId,
      final PriceFilter priceFilter,
      final ListAlignment listAlignment}) = _$_LikedState;
  const _LikedState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  bool get isLikedProductsLoading;
  @override
  bool get isCategoriesLoading;
  @override
  bool get isBrandsLoading;
  @override
  String get query;
  @override
  List<ProductData> get searchedProducts;
  @override
  List<ProductData> get likedProducts;
  @override
  List<ProductData> get filteredProducts;
  @override
  List<CategoryData> get categories;
  @override
  List<BrandData> get brands;
  @override
  int get selectedCategoryId;
  @override
  int get selectedBrandId;
  @override
  int get selectedSearchCategoryId;
  @override
  int get selectedSearchBrandId;
  @override
  PriceFilter get priceFilter;
  @override
  ListAlignment get listAlignment;
  @override
  @JsonKey(ignore: true)
  _$$_LikedStateCopyWith<_$_LikedState> get copyWith =>
      throw _privateConstructorUsedError;
}
