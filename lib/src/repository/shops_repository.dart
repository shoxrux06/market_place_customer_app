import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class ShopsRepository {
  Future<ApiResult<ShopsPaginateResponse>> getOpenNowShops();

  Future<ApiResult<ShopsPaginateResponse>> getNewShops();

  Future<ApiResult<ShopsPaginateResponse>> getWork247Shops();

  Future<ApiResult<ShopsPaginateResponse>> getPickupShops();

  Future<ApiResult<ShopsPaginateResponse>> searchShops(String query);

  Future<ApiResult<ShopsPaginateResponse>> getNearbyShops(
    double latitude,
    double longitude,
  );

  Future<ApiResult<ShopsPaginateResponse>> getAllShops();

  Future<ApiResult<SingleShopResponse>> getSingleShop(String uuid);

  Future<ApiResult<ShopsPaginateResponse>> getShopsDeliveries(
    List<int> shopIds,
  );

  Future<ApiResult<ShopDeliveriesResponse>> getOnlyDeliveries();

  Future<ApiResult<void>> createShop({
    required double tax,
    required double deliveryRange,
    required double latitude,
    required double longitude,
    required String phone,
    required String openTime,
    required String closeTime,
    required String name,
    required String description,
    required double minPrice,
    required String address,
    String? logoImage,
    String? backgroundImage,
  });

  Future<ApiResult<ShopsPaginateResponse>> getShopsByIds(
    List<int> shopIds,
  );
}
