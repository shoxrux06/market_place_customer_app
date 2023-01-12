import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../state/profile_settings_state.dart';

class ProfileSettingsNotifier extends StateNotifier<ProfileSettingsState> {
  final UserRepository _userRepository;
  final GalleryRepository _galleryRepository;

  ProfileSettingsNotifier(this._userRepository, this._galleryRepository)
      : super(const ProfileSettingsState());

  Future<void> fetchProfileDetails(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, userResponse: null);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          state = state.copyWith(
            userResponse: data,
            firstName: data.data?.firstname ?? '',
            lastName: data.data?.lastname ?? '',
            male: data.data?.gender ?? '',
            dob: data.data?.birthday?.substring(0, 10) ?? '',
            phone: data.data?.phone ?? '',
            isPhoneEditable: (data.data?.phone ?? '').isEmpty,
            email: data.data?.email ?? '',
            imageUrl: data.data?.img,
            isLoading: false,
          );
          LocalStorage.instance.setProfileImage(data.data?.img);
          LocalStorage.instance.setWalletData(data.data?.wallet);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          }
          debugPrint('==> get profile details failure: $failure');
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

  void setMale(String value) {
    state = state.copyWith(male: value);
  }

  void setFirstName(String value) {
    state = state.copyWith(firstName: value);
  }

  void setLastName(String value) {
    state = state.copyWith(lastName: value);
  }

  void setDob(DateTime? date) {
    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
    state = state.copyWith(dob: formattedDate);
  }

  void setNewPassword(String value) {
    state = state.copyWith(newPassword: value.trim());
  }

  void setConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value.trim());
  }

  void setPhone(String value) {
    state = state.copyWith(phone: value.trim());
  }

  void toggleNewPasswordVisibility() {
    state = state.copyWith(isVisibleNew: !state.isVisibleNew);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(isVisibleConfirm: !state.isVisibleConfirm);
  }

  Future<void> updateGeneralInfo(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSaving: true);
      final response = await _userRepository.updateGeneralInfo(
        firstName: state.firstName.trim(),
        lastName: state.lastName.trim(),
        birthdate: state.dob,
        gender: state.male,
        phone: state.isPhoneEditable ? state.phone : null,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isSaving: false);
          LocalStorage.instance.setProfileImage(data.data?.img);
          fetchProfileDetails(context);
          context.popRoute();
        },
        failure: (failure) {
          state = state.copyWith(isSaving: false);
          debugPrint('==> update profile details failure: $failure');
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

  Future<void> updateProfileImage(BuildContext context, XFile file) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isUpdatingImage: true);
      String? url;
      final imageResponse =
          await _galleryRepository.uploadImage(file, UploadType.users);
      imageResponse.when(
        success: (data) {
          url = data.imageData?.title;
        },
        failure: (failure) {
          debugPrint('==> upload profile image failure: $failure');
        },
      );
      if (url == null) {
        state = state.copyWith(isUpdatingImage: false);
        return;
      }
      final response = await _userRepository.updateProfileImage(
        imageUrl: url!,
        firstName: state.firstName,
      );
      debugPrint('===> image url $url');
      response.when(
        success: (data) {
          state = state.copyWith(
            isUpdatingImage: false,
            imageUrl: data.data?.img,
          );
          LocalStorage.instance.setProfileImage(data.data?.img);
        },
        failure: (failure) {
          state = state.copyWith(isUpdatingImage: false);
          debugPrint('==> update profile image failure: $failure');
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

  Future<void> updatePassword(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (state.newPassword != state.confirmPassword) {
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(
              TrKeys.confirmPasswordDoesntMatchWithNewPassword,
            ),
          );
        }
        return;
      }
      state = state.copyWith(isSaving: true);
      final response = await _userRepository.updatePassword(
        password: state.newPassword,
        passwordConfirmation: state.confirmPassword,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isSaving: false);
          context.popRoute();
        },
        failure: (failure) {
          state = state.copyWith(isSaving: false);
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
