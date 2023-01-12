import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../state/new_password_state.dart';

class NewPasswordNotifier extends StateNotifier<NewPasswordState> {
  final UserRepository _userRepository;

  NewPasswordNotifier(this._userRepository) : super(const NewPasswordState());

  void setNewPassword(String value) {
    state = state.copyWith(newPassword: value, isConfirmPasswordSame: true);
  }

  void setConfirmPassword(String value) {
    state =
        state.copyWith(confirmNewPassword: value, isConfirmPasswordSame: true);
  }

  void toggleNewPassword() {
    state = state.copyWith(showNewPassword: !state.showNewPassword);
  }

  void toggleConfirmPassword() {
    state =
        state.copyWith(showConfirmNewPassword: !state.showConfirmNewPassword);
  }

  Future<void> updatePassword(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (!AppValidators.arePasswordsTheSame(
        state.newPassword.trim(),
        state.confirmNewPassword.trim(),
      )) {
        state = state.copyWith(isConfirmPasswordSame: false);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.updatePassword(
        password: state.newPassword.trim(),
        passwordConfirmation: state.confirmNewPassword.trim(),
      );
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          context.router.popUntilRoot();
          context.replaceRoute(AddAddressRoute(isRequired: true));
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(TrKeys.errorWithUpdatingPassword),
          );
          debugPrint('==> update password failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
