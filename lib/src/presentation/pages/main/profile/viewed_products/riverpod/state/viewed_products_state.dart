import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../models/models.dart';

part 'viewed_products_state.freezed.dart';

@freezed
class ViewedProductsState with _$ViewedProductsState {
  const factory ViewedProductsState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isViewedProductsLoading,
    @Default(false) bool isCategoriesLoading,
    @Default(false) bool isBrandsLoading,
    @Default('') String query,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<ProductData> viewedProducts,
    @Default([]) List<ProductData> filteredProducts,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,
    @Default(0) int selectedCategoryId,
    @Default(0) int selectedBrandId,
    @Default(0) int selectedSearchCategoryId,
    @Default(0) int selectedSearchBrandId,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _ViewedProductsState;

  const ViewedProductsState._();
}