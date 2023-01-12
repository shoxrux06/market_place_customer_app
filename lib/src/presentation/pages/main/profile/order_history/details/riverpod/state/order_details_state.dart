import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'order_details_state.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isReviewing,
    @Default(false) bool isCancelable,
    @Default(false) bool canLeaveFeedback,
    @Default([]) List<ShopOrderDetails> shopOrderDetails,
    @Default(0) int activeShopIndex,
    @Default(0) double totalProductPrice,
    @Default(0) double discount,
    @Default(0) double totalProductTax,
    @Default(0) double totalShopTax,
    @Default(0) double coupon,
    @Default(0) double deliveryFee,
    @Default(0) double totalAmount,
    @Default(4.0) double rating,
    @Default('') String reviewText,
    SingleOrderResponse? orderResponse,
  }) = _OrderDetailsState;

  const OrderDetailsState._();
}
