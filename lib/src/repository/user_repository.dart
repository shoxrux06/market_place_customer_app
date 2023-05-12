import 'package:g_customer/src/models/response/delete_user_response.dart';

import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class UserRepository {
  Future<ApiResult<ProfileResponse>> getProfileDetails();

  Future<ApiResult<ProfileResponse>> updateGeneralInfo({
    required String firstName,
    required String lastName,
    String? birthdate,
    String? gender,
    String? phone,
    String? email,
    String? password,
    String? passwordConfirm,
  });

  Future<ApiResult<DeleteUserResponse>> deleteUserInfo({
    required String uuid,
  });

  Future<ApiResult<ProfileResponse>> updateProfileImage({
    required String firstName,
    required String imageUrl,
  });

  Future<ApiResult<ProfileResponse>> updatePassword({
    required String password,
    required String passwordConfirmation,
  });

  Future<ApiResult<WalletHistoriesResponse>> getWalletHistories(int page);

  Future<ApiResult<void>> updateFirebaseToken(String? token);
}
