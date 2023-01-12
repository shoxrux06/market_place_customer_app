import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../models/models.dart';

part 'liked_state.freezed.dart';

@freezed
class LikedState with _$LikedState {
  const factory LikedState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isLikedProductsLoading,
    @Default(false) bool isCategoriesLoading,
    @Default(false) bool isBrandsLoading,
    @Default('') String query,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<ProductData> likedProducts,
    @Default([]) List<ProductData> filteredProducts,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,
    @Default(0) int selectedCategoryId,
    @Default(0) int selectedBrandId,
    @Default(0) int selectedSearchCategoryId,
    @Default(0) int selectedSearchBrandId,
    @Default(PriceFilter.byLow) PriceFilter priceFilter,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _LikedState;

  const LikedState._();
}