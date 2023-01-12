import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<ApiResult<ProfileResponse>> getProfileDetails() async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency().id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/profile/show',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get profile details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateGeneralInfo({
    required String firstName,
    required String lastName,
    String? birthdate,
    String? gender,
    String? phone,
    String? email,
    String? password,
    String? passwordConfirm,
  }) async {
    final data = {
      'firstname': firstName,
      'lastname': lastName,
      if (gender != null) 'gender': gender,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (birthdate != null) 'birthday': birthdate,
      if (gender != null) 'gender': gender,
      if (password != null) 'password': password,
      if (passwordConfirm != null) 'password_confirmation': passwordConfirm,
    };
    debugPrint('===> update general info data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/user/profile/update',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update profile details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateProfileImage({
    required String firstName,
    required String imageUrl,
  }) async {
    final data = {
      'firstname': firstName,
      'images': [imageUrl],
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/user/profile/update',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update profile image failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updatePassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    final data = {
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/profile/password/update',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update password failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<WalletHistoriesResponse>> getWalletHistories(
    int page,
  ) async {
    final data = {
      'sort': 'asc',
      'column': 'created_at',
      'page': page,
      'currency_id': LocalStorage.instance.getSelectedCurrency().id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/wallet/histories',
        queryParameters: data,
      );
      return ApiResult.success(
        data: WalletHistoriesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get wallet histories failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> updateFirebaseToken(String? token) async {
    final data = {if (token != null) 'firebase_token': token};
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/profile/firebase/token/update',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update firebase token failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
