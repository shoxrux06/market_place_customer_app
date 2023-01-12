import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isBrandsLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,
    @Default('') String query,
    @Default(0) int selectedCategoryId,
    @Default(0) int selectedBrandId,
  }) = _CategoriesState;

  const CategoriesState._();
}