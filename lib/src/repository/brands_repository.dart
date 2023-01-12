import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class BrandsRepository {
  Future<ApiResult<BrandsPaginateResponse>> getBrandsPaginate(int page);

  Future<ApiResult<BrandsPaginateResponse>> searchBrands(String query);

  Future<ApiResult<SingleBrandResponse>> getSingleBrand(int id);

  Future<ApiResult<BrandsPaginateResponse>> getAllBrands();
}
