import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:g_customer/src/core/handlers/card_token_interceptor.dart';
import 'package:g_customer/src/core/utils/local_storage.dart';

import '../constants/constants.dart';
import '../di/dependency_manager.dart';
import 'token_interceptor.dart';

class HttpService {

  String basicAuth = 'Basic ${base64.encode(utf8.encode('ZLxYtIFHxYnQXpGstH7Mm6Fy79Ia:mVDSfWJIF0M4Az9rYtcY9KfTnsAa'))}';

  Dio client({bool requireAuth = false}) => Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      sendTimeout: 60 * 1000,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json'
      },
    ),
  )
    ..interceptors.add(TokenInterceptor(requireAuth: requireAuth))
    ..interceptors.add(LogInterceptor());

  Dio dio() =>  Dio(
    BaseOptions(
      baseUrl: 'https://partner.paymo.uz',
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      sendTimeout: 60 * 1000,
      headers: {
        'authorization': basicAuth,
        'Content-type': 'application/x-www-form-urlencoded'
      },
    ),
  );

  Dio dio2() =>  Dio(
    BaseOptions(
      baseUrl: 'https://partner.paymo.uz',
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      sendTimeout: 60 * 1000,
      headers: {
        'authorization': 'Bearer ${LocalStorage.instance.getCardToken()}',
        'Content-type': 'application/json'
      },
    ),
  ) ..interceptors.add(CardTokenInterceptor(paymentsRepository: paymentsRepository));
}
