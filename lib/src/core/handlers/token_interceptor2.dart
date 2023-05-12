import 'package:dio/dio.dart';

import '../utils/utils.dart';

class TokenInterceptor2 extends Interceptor {
  final bool requireAuth;

  TokenInterceptor2({required this.requireAuth});

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final String token = LocalStorage.instance.getToken();
    if (requireAuth) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }
}
