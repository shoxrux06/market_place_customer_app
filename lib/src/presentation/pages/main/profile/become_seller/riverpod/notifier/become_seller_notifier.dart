import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../state/become_seller_state.dart';

class BecomeSellerNotifier extends StateNotifier<BecomeSellerState> {
  final ShopsRepository _shopsRepository;
  final GalleryRepository _galleryRepository;
  final UserRepository _userRepository;

  BecomeSellerNotifier(
    this._shopsRepository,
    this._galleryRepository,
    this._userRepository,
  ) : super(BecomeSellerState(addressController: TextEditingController()));

  Future<void> fetchProfileDetails(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          final status = data.data?.shop?.status;
          ShopStatus shopStatus = ShopStatus.notRequested;
          if (status != null) {
            switch (status) {
              case 'new':
                shopStatus = ShopStatus.newShop;
                break;
              case 'rejected':
                shopStatus = ShopStatus.rejected;
                break;
              case 'approved':
                shopStatus = ShopStatus.approved;
                break;
              default:
                shopStatus = ShopStatus.notRequested;
                break;
            }
          }
          state = state.copyWith(isLoading: false, shopStatus: shopStatus);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          } else if (failure == const NetworkExceptions.unauthorisedRequest()) {
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

  void setLogoFile(XFile? file) {
    state = state.copyWith(logoFile: file);
    checkSaveEnabled();
  }

  void setBackgroundFile(XFile? file) {
    state = state.copyWith(backgroundFile: file);
    checkSaveEnabled();
  }

  void setName(String value) {
    state = state.copyWith(name: value);
    checkSaveEnabled();
  }

  void setPhone(String value) {
    state = state.copyWith(phone: value);
    checkSaveEnabled();
  }

  void setDescription(String value) {
    state = state.copyWith(description: value);
    checkSaveEnabled();
  }

  void setOpenTime(DateTime date) {
    final String formattedTime = DateFormat.Hm().format(date);
    state = state.copyWith(openTime: formattedTime);
    checkSaveEnabled();
  }

  void setCloseTime(DateTime date) {
    final String formattedTime = DateFormat.Hm().format(date);
    state = state.copyWith(closeTime: formattedTime);
    checkSaveEnabled();
  }

  void setMinAmount(String value) {
    state = state.copyWith(minAmount: value);
    checkSaveEnabled();
  }

  void setTax(String value) {
    state = state.copyWith(tax: value);
    checkSaveEnabled();
  }

  void setDeliveryRange(String value) {
    state = state.copyWith(deliveryRange: value);
    checkSaveEnabled();
  }

  Future<void> fetchLocationName(BuildContext context, LatLng? latLng) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          latLng?.latitude ?? (AppHelpers.getInitialLatitude() ??AppConstants.demoLatitude),
          latLng?.longitude ?? (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
          localeIdentifier: 'en',
        );

        if (placemarks.isNotEmpty) {
          final Placemark pos = placemarks[0];
          final List<String> addressData = [];
          addressData.add(pos.locality!);
          if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
            addressData.add(pos.subLocality!);
          }
          if (pos.thoroughfare != null && pos.thoroughfare!.isNotEmpty) {
            addressData.add(pos.thoroughfare!);
          }
          addressData.add(pos.name!);
          final String placeName = addressData.join(', ');
          state.addressController?.text = placeName;
        }
      } catch (e) {
        state.addressController?.text = '';
      }
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
    checkSaveEnabled();
  }

  void checkSaveEnabled() {
    bool isSaveEnabled = false;
    if (state.logoFile != null &&
        state.backgroundFile != null &&
        state.name.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.description.isNotEmpty &&
        state.openTime.isNotEmpty &&
        state.closeTime.isNotEmpty &&
        state.minAmount.isNotEmpty &&
        state.tax.isNotEmpty &&
        state.deliveryRange.isNotEmpty &&
        state.addressController!.text.isNotEmpty) {
      isSaveEnabled = true;
    }
    state = state.copyWith(saveBtnEnabled: isSaveEnabled);
  }

  Future<void> createShop(BuildContext context, LatLng? latLng) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSaving: true);
      final double? tax = double.tryParse(state.tax);
      if (tax == null) {
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(TrKeys.taxShouldBeANumber),
          );
        }
        state = state.copyWith(isSaving: false);
        return;
      }
      final double? deliveryRange = double.tryParse(state.deliveryRange);
      if (deliveryRange == null) {
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(TrKeys.deliveryRangeShouldBeANumber),
          );
        }
        state = state.copyWith(isSaving: false);
        return;
      }
      final double? minAmount = double.tryParse(state.minAmount);
      if (minAmount == null) {
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(TrKeys.minimumAmountShouldBeANumber),
          );
        }
        state = state.copyWith(isSaving: false);
        return;
      }
      String? logoImage;
      String? backgroundImage;
      final logoResponse = await _galleryRepository.uploadImage(
        state.logoFile!,
        UploadType.shopsLogo,
      );
      logoResponse.when(
        success: (data) {
          logoImage = data.imageData?.title;
        },
        failure: (failure) {
          debugPrint('===> upload logo image failure: $failure');
        },
      );
      final backgroundResponse = await _galleryRepository.uploadImage(
        state.backgroundFile!,
        UploadType.shopsBack,
      );
      backgroundResponse.when(
        success: (data) {
          backgroundImage = data.imageData?.title;
        },
        failure: (failure) {
          debugPrint('===> upload background image failure: $failure');
        },
      );
      final response = await _shopsRepository.createShop(
        tax: tax,
        deliveryRange: deliveryRange,
        latitude: latLng?.latitude ?? (AppHelpers.getInitialLatitude() ??AppConstants.demoLatitude),
        longitude: latLng?.longitude ?? (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
        phone: state.phone,
        openTime: state.openTime,
        closeTime: state.closeTime,
        name: state.name,
        description: state.description,
        minPrice: minAmount,
        address: state.addressController!.text,
        logoImage: logoImage,
        backgroundImage: backgroundImage,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isSaving: false);
          fetchProfileDetails(context);
        },
        failure: (failure) {
          state = state.copyWith(isSaving: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          } else if (failure == const NetworkExceptions.unauthorisedRequest()) {
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
          debugPrint('==> create shop failure: $failure');
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
