import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/handlers/handlers.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../../repository/repository.dart';
import '../state/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final AddressRepository _addressRepository;
  final CurrenciesRepository _currenciesRepository;
  final UserRepository _userRepository;

  LoginNotifier(
    this._authRepository,
    this._addressRepository,
    this._currenciesRepository,
    this._userRepository,
  ) : super(const LoginState());

  void setPassword(String text) {
    state = state.copyWith(
      password: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setEmail(String text) {
    state = state.copyWith(
      email: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setShowPassword(bool show) {
    state = state.copyWith(showPassword: show);
  }

  Future<void> login(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (!AppValidators.isValidEmail(state.email)) {
        state = state.copyWith(isEmailNotValid: true);
        return;
      }
      if (!AppValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordNotValid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.login(
        email: state.email,
        password: state.password,
      );
      response.when(
        success: (data) async {
          LocalStorage.instance.setUser(data.data);
          LocalStorage.instance.setToken(data.data?.accessToken ?? '');
          LocalStorage.instance.setFirstName(data.data?.user?.firstname);
          LocalStorage.instance.setLastName(data.data?.user?.lastname);
          LocalStorage.instance.setProfileImage(data.data?.user?.img);
          fetchCurrencies(context);
          getProfileDetails(context);
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> getting firebase token error: $e');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          final addressResponse = await _addressRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) async {
              state = state.copyWith(isLoading: false);
              if (saveAddressesToLocal(addressData.data)) {
                context.replaceRoute(const ShopMainRoute());
              } else {
                context.replaceRoute(AddAddressRoute(isRequired: true));
              }
            },
            failure: (addressFailure) {
              state = state.copyWith(isLoading: false);
              debugPrint('==> address failure: $addressFailure');
            },
          );
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false, isLoginError: true);
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.emailNotVerifiedYet),
            );
          }
          debugPrint('==> login failure: $failure');
        },
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
      state = state.copyWith(isCurrenciesLoading: true);
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
          state = state.copyWith(isCurrenciesLoading: false);
        },
        failure: (failure) {
          state = state.copyWith(isCurrenciesLoading: false);
          debugPrint('==> get currency failure: $failure');
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

  Future<void> getProfileDetails(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isProfileDetailsLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) async {
          LocalStorage.instance.setWalletData(data.data?.wallet);
          state = state.copyWith(isProfileDetailsLoading: false);
        },
        failure: (failure) {
          state = state.copyWith(isProfileDetailsLoading: false);
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

  Future<void> loginWithGoogle(BuildContext context) async {
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
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          final addressResponse = await _addressRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) {
              log('===> getting address data: $addressData');
              state = state.copyWith(isGoogleLoading: false);
              if (saveAddressesToLocal(addressData.data)) {
                context.replaceRoute(const ShopMainRoute());
              } else {
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

  Future<void> loginWithFacebook(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isFacebookLoading: true);
      AccessToken? accessToken = await FacebookAuth.instance.accessToken;
      if (accessToken != null) {
        final LoginResult loginResult = await FacebookAuth.instance.login();
        if (loginResult.status == LoginStatus.success) {
          final userData = await FacebookAuth.instance.getUserData();
          debugPrint('==> facebook auth email: ${userData['email']}');
          debugPrint('==> facebook auth name: ${userData['name']}');
          debugPrint('==> facebook auth id: ${userData['id']}');
        }
        accessToken = loginResult.accessToken;
      } else {
        final userData = await FacebookAuth.instance.getUserData();
        debugPrint('==> facebook auth email: ${userData['email']}');
        debugPrint('==> facebook auth name: ${userData['name']}');
        debugPrint('==> facebook auth id: ${userData['id']}');
      }
      state = state.copyWith(isFacebookLoading: false);
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
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
        final double? latitude =
            double.tryParse(data[i].location?.latitude ?? '');
        final double? longitude =
            double.tryParse(data[i].location?.longitude ?? '');
        if (latitude != null && longitude != null) {
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

  Future<void> skipForNow(BuildContext context) async {
    LocalStorage.instance.setIsGuest(true);
    fetchCurrencies(context);
    if (LocalStorage.instance.getLocalAddressesList().isEmpty) {
      context.replaceRoute(AddAddressRoute(isRequired: true));
    } else {
      context.replaceRoute(const ShopMainRoute());
    }
  }
}
