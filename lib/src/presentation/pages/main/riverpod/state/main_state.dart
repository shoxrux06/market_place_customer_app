import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../models/models.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isCategoriesLoading,
    @Default(false) bool isBrandsLoading,
    @Default('') String query,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,
    @Default(0) int lastActiveTab,
    @Default(0) int selectedCategoryId,
    @Default(0) int selectedBrandId,
    @Default(PriceFilter.byLow) PriceFilter priceFilter,
  }) = _MainState;

  const MainState._();
}