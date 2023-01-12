import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../repository.dart';

class ShopsRepositoryImpl extends ShopsRepository {
  @override
  Future<ApiResult<ShopsPaginateResponse>> getOpenNowShops() async {
    final data = {
      'open': 1,
      'perPage': 100,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get open shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getNewShops() async {
    final data = {
      'sort': 'desc',
      'perPage': 100,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get new shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> searchShops(String query) async {
    final data = {
      'search': query,
      'perPage': 5,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/search',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getNearbyShops(
    double latitude,
    double longitude,
  ) async {
    final data = {'clientLocation': '$latitude,$longitude'};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/nearby',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get nearby shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getAllShops() async {
    final data = {
      'per_page': 100,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get all shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleShopResponse>> getSingleShop(String uuid) async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/shops/$uuid', queryParameters: data);
      return ApiResult.success(
        data: SingleShopResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get single shop failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getShopsDeliveries(
    List<int> shopIds,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency().id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    for (int i = 0; i < shopIds.length; i++) {
      data['shops[$i]'] = shopIds[i];
    }
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/deliveries',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shops deliveries failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
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
  }) async {
    final data = {
      'tax': tax,
      'delivery_range': deliveryRange,
      'location': '$latitude,$longitude',
      'phone': phone,
      'open_time': openTime,
      'close_time': closeTime,
      'title': {'en': name},
      'description': {'en': description},
      'min_price': minPrice,
      'address': {'en': address},
      if (backgroundImage != null && logoImage != null)
        'images': [backgroundImage, logoImage],
    };
    debugPrint('===> create shop body: ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/shops',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create shop failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopDeliveriesResponse>> getOnlyDeliveries() async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency().id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/deliveries',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopDeliveriesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shops deliveries failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getWork247Shops() async {
    final data = {
      'always_open': 1,
      'perPage': 100,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get work 24/7 shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getPickupShops() async {
    final data = {
      'delivery': 'pickup',
      'perPage': 100,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get pickup shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getShopsByIds(
    List<int> shopIds,
  ) async {
    final data = <String, dynamic>{
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    for (int i = 0; i < shopIds.length; i++) {
      data['shops[$i]'] = shopIds[i];
    }
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shops by ids failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
