import 'package:dio/dio.dart';

import '../../repository/payments_repository.dart';
import '../utils/utils.dart';

class CardTokenInterceptor extends Interceptor {

  final PaymentsRepository paymentsRepository;
  CardTokenInterceptor({required this.paymentsRepository});

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final String token = LocalStorage.instance.getCardToken();
    if (token.isNotEmpty) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async{
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      await getToken();
      err.requestOptions.headers['Authorization'] = 'Bearer ${LocalStorage.instance.getCardToken()}';
    }
    return err.response;
  }

  Future<void> getToken() async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final bindCardResponse = await paymentsRepository.getToken();
      bindCardResponse.when(
        success: (token) {
          LocalStorage.instance.setCardToken(token.accessToken);
          print('getToken <<$token>>');
        },
        failure: (bindCardFailure) {
          print(bindCardFailure);
        },
      );
    }
  }

}
