import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../state/enter_phone_state.dart';

class EnterPhoneNotifier extends StateNotifier<EnterPhoneState> {
  final AuthRepository _authRepository;
  final CurrenciesRepository _currenciesRepository;
  final AddressRepository _addressRepository;

  EnterPhoneNotifier(
    this._authRepository,
    this._currenciesRepository,
    this._addressRepository,
  ) : super(const EnterPhoneState(agreedToPrivacy: false));

  void setPhone(String text) {
    state = state.copyWith(phone: text.trim());
  }

  void setVerifyId(String? value) {
    state = state.copyWith(verifyId: value?.trim() ?? '');
  }

  void toggleAgreed() {
    state = state.copyWith(agreedToPrivacy: !state.agreedToPrivacy);
  }

  void clearStates() {
    state = state.copyWith(agreedToPrivacy: false, phone: '');
  }

  Future<void> sendOtp(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.sendOtp(phone: state.phone.trim());
      response.when(
        success: (data) async {
          state = state.copyWith(
            verifyId: data.data?.verifyId ?? '',
            isLoading: false,
          );
          context.pushRoute(const RegisterConfirmationRoute());
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          if (failure == const NetworkExceptions.badRequest()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.smsDidntSend),
            );
          }
          debugPrint('==> send otp failure: $failure');
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

  Future<void> registerWithGoogle(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isGoogleLoading: true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
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
          fetchCurrencies(context);
          final addressResponse = await _addressRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) async {
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

// Future<void> loginWithFacebook(BuildContext context) async {
//   final connected = await AppConnectivity.connectivity();
//   if (connected) {
//     state = state.copyWith(isGoogleLoading: true);
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     debugPrint('===> google sign in accessToken: ${credential.accessToken}');
//     debugPrint('===> google sign in email: ${googleUser.email}');
//     state = state.copyWith(isGoogleLoading: true);
//   } else {
//     if (mounted) {
//       AppHelpers.showNoConnectionSnackBar(context);
//     }
//   }
// }

// bool saveAddressesToLocal(List<AddressData>? data) {
//   if (data == null || data.isEmpty) {
//     return false;
//   } else {
//     String title = '';
//     int activeIndex = 0;
//     final List<LocalAddressData> localAddresses = [];
//     for (int i = 0; i < data.length; i++) {
//       final local = LocalAddressData(
//         title: data[i].title,
//         address: data[i].address,
//         location: LocalLocation(
//           latitude: double.parse(data[i].location?.latitude ?? ''),
//           longitude: double.parse(data[i].location?.longitude ?? ''),
//         ),
//         isDefault: false,
//         isSelected: false,
//       );
//       localAddresses.add(local);
//       if (data[i].isDefault ?? false) {
//         activeIndex = i;
//       }
//     }
//
//     final local = localAddresses[activeIndex]
//         .copyWith(isSelected: true, isDefault: true);
//     localAddresses[activeIndex] = local;
//     title = localAddresses[activeIndex].title ?? '';
//     LocalStorage.instance.setLocalAddressesList(localAddresses);
//     LocalStorage.instance.setActiveAddressTile(title);
//     LocalStorage.instance.setAddressSelected(true);
//     return true;
//   }
// }
}
