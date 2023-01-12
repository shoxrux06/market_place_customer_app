import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../../repository/repository.dart';
import '../state/register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  final AddressRepository _addressRepository;
  final CurrenciesRepository _currenciesRepository;

  RegisterNotifier(
    this._userRepository,
    this._authRepository,
    this._addressRepository,
    this._currenciesRepository,
  ) : super(const RegisterState());

  void setPassword(String password) {
    state = state.copyWith(password: password.trim(), isPasswordInvalid: false);
  }

  void setConfirmPassword(String password) {
    state = state.copyWith(
      confirmPassword: password.trim(),
      isConfirmPasswordInvalid: false,
    );
  }

  void setFirstName(String name) {
    state = state.copyWith(firstName: name.trim());
  }

  void setEmail(String value) {
    state = state.copyWith(email: value.trim(), isEmailInvalid: false);
  }

  void setLatName(String name) {
    state = state.copyWith(lastName: name.trim());
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  Future<void> register(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (!AppValidators.isValidEmail(state.email)) {
        state = state.copyWith(isEmailInvalid: true);
        return;
      }
      if (!AppValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordInvalid: true);
        return;
      }
      if (!AppValidators.isValidPassword(state.confirmPassword)) {
        state = state.copyWith(isConfirmPasswordInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.updateGeneralInfo(
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
        password: state.password,
        passwordConfirm: state.confirmPassword,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          LocalStorage.instance.setFirstName(data.data?.firstname);
          LocalStorage.instance.setLastName(data.data?.lastname);
          context.router.popUntilRoot();
          context.replaceRoute(AddAddressRoute(isRequired: true));
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(TrKeys.errorWithCreatingAccount),
          );
          debugPrint('==> register failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> registerWithGoogle(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isGoogleLoading: true);
      GoogleSignInAccount? googleUser;
      try {
        googleUser = await GoogleSignIn().signIn();
      } catch (e) {
        state = state.copyWith(isGoogleLoading: false);
        debugPrint('===> login with google exception: $e');
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(e.toString()),
          );
        }
      }
      if (googleUser == null) {
        state = state.copyWith(isGoogleLoading: false);
        return;
      }
      final response = await _authRepository.loginWithGoogle(
        email: googleUser.email,
        displayName: googleUser.displayName ?? '',
        id: googleUser.id,
      );
      response.when(
        success: (data) async {
          LocalStorage.instance.setUser(data.data);
          LocalStorage.instance.setToken(data.data?.accessToken ?? '');
          LocalStorage.instance.setFirstName(data.data?.user?.firstname);
          LocalStorage.instance.setLastName(data.data?.user?.lastname);
          LocalStorage.instance.setProfileImage(data.data?.user?.img);
          LocalStorage.instance.setAuthenticatedWithSocial(true);
          fetchCurrencies(context);
          final fcmToken = await FirebaseMessaging.instance.getToken();
          _userRepository.updateFirebaseToken(fcmToken);
          final addressResponse = await _addressRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) {
              log('===> getting address data: $addressData');
              state = state.copyWith(isGoogleLoading: false);
              if (saveAddressesToLocal(addressData.data)) {
                context.router.popUntilRoot();
                context.replaceRoute(const ShopMainRoute());
              } else {
                context.router.popUntilRoot();
                context.replaceRoute(AddAddressRoute(isRequired: true));
              }
            },
            failure: (addressFailure) {
              state = state.copyWith(isLoading: false);
              debugPrint('==> address failure: $addressFailure');
            },
          );
        },
        failure: (failure) {},
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchCurrencies(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final response = await _currenciesRepository.getCurrencies();
      response.when(
        success: (data) async {
          int defaultCurrencyIndex = 0;
          final List<CurrencyData> currencies = data.data ?? [];
          for (int i = 0; i < currencies.length; i++) {
            if (currencies[i].isDefault ?? false) {
              defaultCurrencyIndex = i;
              break;
            }
          }
          LocalStorage.instance
              .setSelectedCurrency(currencies[defaultCurrencyIndex]);
        },
        failure: (failure) {
          debugPrint('==> get currency failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  bool saveAddressesToLocal(List<AddressData>? data) {
    if (data == null || data.isEmpty) {
      return false;
    } else {
      String title = '';
      int activeIndex = 0;
      final List<LocalAddressData> localAddresses = [];
      for (int i = 0; i < data.length; i++) {
        final local = LocalAddressData(
          id: data[i].id,
          title: data[i].title,
          address: data[i].address,
          location: LocalLocation(
            latitude: double.parse(data[i].location?.latitude ?? ''),
            longitude: double.parse(data[i].location?.longitude ?? ''),
          ),
          isDefault: false,
          isSelected: false,
        );
        localAddresses.add(local);
        if (data[i].isDefault ?? false) {
          activeIndex = i;
        }
      }

      final local = localAddresses[activeIndex]
          .copyWith(isSelected: true, isDefault: true);
      localAddresses[activeIndex] = local;
      title = localAddresses[activeIndex].title ?? '';
      LocalStorage.instance.setLocalAddressesList(localAddresses);
      LocalStorage.instance.setActiveAddressTile(title);
      LocalStorage.instance.setAddressSelected(true);
      return true;
    }
  }
}
