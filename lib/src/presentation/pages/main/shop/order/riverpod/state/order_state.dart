import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default(false) bool isLoading,
    @Default([]) List<ShopData> shops,
    @Default([]) List<ShopTotalData> shopTotals,
    @Default(0) double totalProductPrice,
    @Default(0) double totalDiscount,
    @Default(0) double totalProductsTax,
    @Default(0) double totalShopsTax,
    @Default(0) double totalAmount,
    @Default(0) double coupon,
    ProductCalculateResponse? calculateResponse,
  }) = _OrderState;

  const OrderState._();
}