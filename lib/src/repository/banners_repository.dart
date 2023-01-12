import '../core/constants/constants.dart';
import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class BannersRepository {
  Future<ApiResult<BannersPaginateResponse>> getBannersPaginate(
    BannerType bannerType, {
    int? page,
    int? shopId,
  });

  Future<ApiResult<ProductsPaginateResponse>> getBannerProducts(int? bannerId);

  Future<ApiResult<void>> likeBanner(int? bannerId);
}
