import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../models/models.dart';

part 'most_sold_products_state.freezed.dart';

@freezed
class MostSoldProductsState with _$MostSoldProductsState{
  const factory MostSoldProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isCategoriesLoading,
    @Default(false) bool isBrandsLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,
    @Default(0) int selectedCategoryId,
    @Default(0) int selectedBrandId,
    @Default(0) int selectedSearchCategoryId,
    @Default(0) int selectedSearchBrandId,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _MostSoldProductsState;

  const MostSoldProductsState._();
}