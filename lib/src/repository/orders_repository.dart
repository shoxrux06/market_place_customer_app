import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class OrdersRepository {
  Future<ApiResult<CreateOrderResponse>> createOrder(OrderBodyData orderBody);

  Future<ApiResult<OrderPaginateResponse>> getCompletedOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getOpenOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getCanceledOrders(int page);

  Future<ApiResult<SingleOrderResponse>> getSingleOrder(int orderId);

  Future<ApiResult<void>> addReview(
    int orderId, {
    required double rating,
    required String comment,
  });

  Future<ApiResult<CouponResponse>> checkCoupon({
    required String coupon,
    required int shopId,
  });

  Future<ApiResult<CashbackResponse>> checkCashback({required double amount});
}
