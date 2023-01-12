import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../models/models.dart';

part 'category_products_state.freezed.dart';

@freezed
class CategoryProductsState with _$CategoryProductsState {
  const factory CategoryProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isMoreLoading,
    @Default(false) bool isBrandsLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<BrandData> brands,
    @Default(0) int productsCount,
    @Default(0) int selectedBrandId,
    @Default(0) int selectedSearchBrandId,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _CategoryProductsState;

  const CategoryProductsState._();
}
