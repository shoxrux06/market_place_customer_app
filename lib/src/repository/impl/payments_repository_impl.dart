import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g_customer/src/models/response/bind_card_apply_response.dart';
import 'package:g_customer/src/models/response/bind_card_response.dart';
import 'package:g_customer/src/models/response/card_list_response.dart';
import 'package:g_customer/src/models/response/token_response.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../repository.dart';

class PaymentsRepositoryImpl extends PaymentsRepository {
  @override
  Future<ApiResult<PaymentsResponse>> getPayments() async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/payments', queryParameters: data);
      return ApiResult.success(
        data: PaymentsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get payments failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    debugPrint('===> create transaction body: ${jsonEncode(data)}');
    debugPrint('===> create transaction order id: $orderId');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/order/$orderId/transactions',
        data: data,
      );
      return ApiResult.success(
        data: TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  @override
  Future<ApiResult<TokenResponse>> getToken() async{
    try {
      final client = inject<HttpService>().dio();
      final response = await client.post(
        '/token?grant_type=client_credentials',
      );
      print('Get Token <<${response.data}>>');
      return ApiResult.success(
        data: TokenResponse.fromJson(response.data),
      );
    } catch (e) {
      print('==> getToken failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }


  @override
  Future<ApiResult<BindCardResponse>> bindCard({required String cardNumber, required String expiry}) async {
    final data = {
      'card_number': cardNumber,
      'expiry': expiry,
    };

    try {
      final client = inject<HttpService>().dio2();
      final response = await client.post(
        '/partner/bind-card/create',
        data: jsonEncode(data),
      );
      print('Bind Card <<${response.data}>>');
      return ApiResult.success(
        data: BindCardResponse.fromJson(response.data),
      );
    } catch (e) {
      print('==> bindCard failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<BindCardApplyResponse>> bindCardApply({required String transactionId, required String otp}) async{
    final data = {
      'transaction_id': transactionId,
      'otp': otp,
    };
    try {
      final client = inject<HttpService>().dio2();
      final response = await client.post(
        '/partner/bind-card/apply',
        data: jsonEncode(data),
      );
      return ApiResult.success(
        data: BindCardApplyResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> bindCardApply failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CardListResponse>> getCardList({required int page, required int pageSize}) async{
    final data = {
      'page': page,
      'page_size': pageSize,
    };
    try {
      final client = inject<HttpService>().dio2();
      final response = await client.post(
        '/partner/list-cards',
        data: jsonEncode(data),
      );
      return ApiResult.success(
        data: CardListResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> CardList failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}
