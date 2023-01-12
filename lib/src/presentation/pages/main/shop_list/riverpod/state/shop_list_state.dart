import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'shop_list_state.freezed.dart';

@freezed
class ShopListState with _$ShopListState {
  const factory ShopListState({
    @Default(false) bool isBannersLoading,
    @Default(false) bool isCategoriesLoading,
    @Default([]) List<BannerData> banners,
    @Default([]) List<CategoryData> categories,
    @Default(0) int activeBanner,
  }) = _ShopListState;

  const ShopListState._();
}
