import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../repository.dart';

class BrandsRepositoryImpl extends BrandsRepository {
  @override
  Future<ApiResult<BrandsPaginateResponse>> getBrandsPaginate(int page) async {
    final data = {'page': page, 'perPage': 18};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/brands/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BrandsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get brands paginate failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleBrandResponse>> getSingleBrand(int id) async {
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get('/api/v1/rest/brands/$id');
      return ApiResult.success(
        data: SingleBrandResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get brand failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<BrandsPaginateResponse>> getAllBrands() async {
    final data = {
      'perPage': 1000,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/brands/paginate',
        queryParameters: data,
      );
      print('Brands List *****${response}*****');
      print('Brands List Length *****${response}*****');
      return ApiResult.success(
        data: BrandsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get all brands failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<BrandsPaginateResponse>> searchBrands(String query) async {
    final data = {'search': query, 'perPage': 5};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/brands/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BrandsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search brands failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
