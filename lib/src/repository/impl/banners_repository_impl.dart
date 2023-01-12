import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../repository.dart';

class BannersRepositoryImpl extends BannersRepository {
  @override
  Future<ApiResult<BannersPaginateResponse>> getBannersPaginate(
    BannerType bannerType, {
    int? page,
    int? shopId,
  }) async {
    final data = {
      'type': bannerType == BannerType.look ? 'look' : 'banner',
      'perPage': page != null ? 10 : 100,
      if (page != null) 'page': page,
      if (shopId != null) 'shop_id': shopId,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/banners/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BannersPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get banners paginate failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getBannerProducts(
    int? bannerId,
  ) async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/banners/$bannerId/products',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get banner products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> likeBanner(int? bannerId) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post('/api/v1/rest/banners/$bannerId/liked');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> like banner failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
