import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../models/models.dart';
import '../repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  @override
  Future<ApiResult<AddressesResponse>> getUserAddresses() async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/addresses');
      log('===> getting address data: ${response.data}');
      return ApiResult.success(
        data: AddressesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get addresses failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteAddress(int addressId) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.delete('/api/v1/dashboard/user/addresses/$addressId');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete address failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleAddressResponse>> createAddress(
    LocalAddressData address,
  ) async {
    final data = {
      'address': address.address,
      'location':
          '${address.location?.latitude},${address.location?.longitude}',
      'active': 1,
      'title': address.title,
      'default': (address.isSelected ?? false) ? 1 : 0,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/addresses',
        data: data,
      );
      return ApiResult.success(
        data: SingleAddressResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create address failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
