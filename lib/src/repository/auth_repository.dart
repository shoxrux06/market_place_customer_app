import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  });

  Future<ApiResult<LoginResponse>> loginWithGoogle({
    required String email,
    required String displayName,
    required String id,
  });

  Future<ApiResult<RegisterResponse>> sendOtp({required String phone});

  Future<ApiResult<RegisterResponse>> forgotPassword({required String phone});

  Future<ApiResult<VerifyPhoneResponse>> verifyPhone({
    required String verifyId,
    required String verifyCode,
  });

  Future<ApiResult<VerifyPhoneResponse>> forgotPasswordConfirm({
    required String verifyId,
    required String verifyCode,
  });
}
