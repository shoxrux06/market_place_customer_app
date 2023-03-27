import 'package:g_customer/src/models/response/bind_card_apply_response.dart';
import 'package:g_customer/src/models/response/bind_card_response.dart';
import 'package:g_customer/src/models/response/token_response.dart';

import '../core/handlers/handlers.dart';
import '../models/models.dart';
import '../models/response/card_list_response.dart';

abstract class PaymentsRepository {
  Future<ApiResult<PaymentsResponse>> getPayments();

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  });

  Future<ApiResult<TokenResponse>> getToken();

  Future<ApiResult<BindCardResponse>> bindCard({
    required String cardNumber,
    required String expiry,
  });

  Future<ApiResult<BindCardApplyResponse>> bindCardApply({
    required String transactionId,
    required String otp,
  });

  Future<ApiResult<CardListResponse>> getCardList({
    required int page,
    required int pageSize,
  });
}
