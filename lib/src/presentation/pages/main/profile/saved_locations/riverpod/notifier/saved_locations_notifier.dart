import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../state/saved_locations_state.dart';

class SavedLocationsNotifier extends StateNotifier<SavedLocationsState> {
  final AddressRepository _addressRepository;

  SavedLocationsNotifier(this._addressRepository)
      : super(const SavedLocationsState());

  Future<void> fetchSavedLocations() async {
    state = state.copyWith(isLoading: true, addresses: []);
    await Future.delayed(const Duration(seconds: 1));
    final List<LocalAddressData> localAddresses =
        LocalStorage.instance.getLocalAddressesList();
    final customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(36.44.r, 50.r)),
      AppAssets.pngIcLocationPin,
    );
    const MarkerId markerId = MarkerId('markerId');
    List<Map<MarkerId, Marker>> listOfMarkers = [];
    for (int i = 0; i < localAddresses.length; i++) {
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          localAddresses[i].location?.latitude ??
              (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
          localAddresses[i].location?.longitude ?? (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
        ),
        draggable: false,
        icon: customIcon,
      );
      final Map<MarkerId, Marker> markerData = {};
      markerData[markerId] = marker;
      listOfMarkers.add(markerData);
    }
    state = state.copyWith(
      isLoading: false,
      addresses: localAddresses,
      listOfMarkers: listOfMarkers,
    );
  }

  Future<void> deleteAddress(
    BuildContext context,
    LocalAddressData address,
  ) async {
    int? index;
    final List<LocalAddressData> addresses = List.from(state.addresses);
    state = state.copyWith(isUpdating: true);
    if (address.id != null) {
      final connected = await AppConnectivity.connectivity();
      if (connected) {
        final response = await _addressRepository.deleteAddress(address.id!);
        response.when(
          success: (data) async {
            for (int i = 0; i < addresses.length; i++) {
              if (address.id == addresses[i].id) {
                index = i;
                break;
              }
            }
          },
          failure: (failure) {
            state = state.copyWith(isUpdating: false);
            if (failure == const NetworkExceptions.internalServerError()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(
                  TrKeys.somethingWentWrongWithTheServer,
                ),
              );
            } else if (failure ==
                const NetworkExceptions.unauthorisedRequest()) {
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
            debugPrint('==> delete addresses failure: $failure');
            return;
          },
        );
      } else {
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
          );
        }
        state = state.copyWith(isUpdating: false);
        return;
      }
    }
    if (index != null) {
      addresses.removeAt(index!);
    } else {
      addresses.remove(address);
    }
    if (address.isSelected ?? false) {
      final String title = addresses[0].title ?? '';
      addresses[0] = addresses[0].copyWith(isSelected: true);
      LocalStorage.instance.setActiveAddressTile(title);
    }
    LocalStorage.instance.setLocalAddressesList(addresses);
    state = state.copyWith(isUpdating: false, addresses: addresses);
  }
}
