import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'shop_details_state.freezed.dart';

@freezed
class ShopDetailsState with _$ShopDetailsState {
  const factory ShopDetailsState({
    @Default(false) bool isBrandsLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isLoading,
    @Default(false) bool isCategoriesLoading,
    @Default(false) bool isLooksLoading,
    @Default(false) bool isViewedProductsLoading,
    @Default(false) bool isMostSoldProductsLoading,
    @Default(false) bool isDiscountProductsLoading,
    @Default(false) bool isBannersLoading,
    @Default(false) bool isNewProductsLoading,
    @Default([]) List<BrandData> brands,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<CategoryData> subCategories,
    @Default([]) List<ProductData> viewedProducts,
    @Default([]) List<ProductData> mostSoldProducts,
    @Default([]) List<ProductData> discountProducts,
    @Default([]) List<BannerData> banners,
    @Default([]) List<ProductData> newProducts,
    @Default([]) List<String> deliveryTimes,
    @Default([]) List<LookLikeData> lookLikes,
    @Default('') String query,
    @Default('') String shopTitle,
    @Default(0) int selectedCategoryId,
    @Default(0) int selectedBrandId,
    @Default(0) int bannerIndex,
    ShopData? shopData,
    CategoryData? selectedCategory,
  }) = _ShopDetailsState;

  const ShopDetailsState._();
}