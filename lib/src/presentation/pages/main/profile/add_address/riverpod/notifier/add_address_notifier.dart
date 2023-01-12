import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/di/dependency_manager.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../profile/riverpod/notifier/address_modal_notifier.dart';
import '../../../../profile/saved_locations/riverpod/notifier/saved_locations_notifier.dart';
import '../state/add_address_state.dart';
import '../../../../../../../models/models.dart' as models;

class AddAddressNotifier extends StateNotifier<AddAddressState> {
  Timer? _timer;

  AddAddressNotifier()
      : super(
          AddAddressState(textController: TextEditingController()),
        );

  void setQuery(BuildContext context) {
    if (state.textController?.text.trim().isNotEmpty ?? false) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          searchLocations(context);
        },
      );
    }
  }

  Future<void> searchLocations(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSearching: true);
      final result = await googlePlace.autocomplete.get(
        state.textController?.text.trim() ?? '',
      );
      state = state.copyWith(
        searchedLocations: result?.predictions ?? [],
        isSearching: false,
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  void clearSearchField() {
    state.textController?.clear();
    state = state.copyWith(searchedLocations: []);
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(mapController: controller);
  }

  void setChoosing(bool value) {
    state = state.copyWith(isChoosing: value);
  }

  Future<void> goToLocation(
    BuildContext context, {
    String? id,
    String? name,
  }) async {
    state.textController?.text = name ?? '';
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, searchedLocations: []);
      final result = await googlePlace.details.get(id ?? '');
      final newPosition = LatLng(
        result?.result?.geometry?.location?.lat ??
            (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
        result?.result?.geometry?.location?.lng ??
            (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
      );
      state.mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: newPosition,
            tilt: 0,
            zoom: 17,
          ),
        ),
      );
      state = state.copyWith(
        isLoading: false,
        location: models.LocalLocation(
          latitude: newPosition.latitude,
          longitude: newPosition.longitude,
        ),
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> goToMyLocation(
    BuildContext context,
    location.LocationData locationData,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final newPosition = LatLng(
        locationData.latitude ??
            (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
        locationData.longitude ??
            (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
      );
      state = state.copyWith(isLoading: true, searchedLocations: []);
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          newPosition.latitude,
          newPosition.longitude,
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
          state.textController?.text = placeName;
        }
      } catch (e) {
        state.textController?.text = '';
      }
      state.mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: newPosition,
            tilt: 0,
            zoom: 17,
          ),
        ),
      );
      state = state.copyWith(
        isLoading: false,
        location: models.LocalLocation(
          latitude: newPosition.latitude,
          longitude: newPosition.longitude,
        ),
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> findMyLocation(BuildContext context) async {
    location.LocationData? myLocationData;
    final locationInstance = location.Location();
    bool serviceEnabled;
    location.PermissionStatus permissionGranted;

    serviceEnabled = await locationInstance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationInstance.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await locationInstance.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await locationInstance.requestPermission();
      if (permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }
    try {
      myLocationData = await locationInstance.getLocation();
    } on Exception {
      myLocationData = null;
    }

    if (myLocationData != null) {
      if (mounted) {
        goToMyLocation(context, myLocationData);
      }
    }
  }

  Future<void> goToTappedLocation(BuildContext context, LatLng latLng) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, searchedLocations: []);
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          latLng.latitude,
          latLng.longitude,
          localeIdentifier: 'en',
        );
        if (placemarks.isNotEmpty) {
          final Placemark pos = placemarks[0];
          final List<String> addressData = [];
          if (pos.locality != null && pos.subLocality!.isNotEmpty) {
            addressData.add(pos.locality!);
          }
          if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
            addressData.add(pos.subLocality!);
          }
          if (pos.thoroughfare != null && pos.thoroughfare!.isNotEmpty) {
            addressData.add(pos.thoroughfare!);
          }
          addressData.add(pos.name!);
          final String placeName = addressData.join(', ');
          state.textController?.text = placeName;
        }
      } catch (e) {
        state.textController?.text = '';
      }
      state.mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: latLng,
            tilt: 0,
            zoom: 14,
          ),
        ),
      );
      state = state.copyWith(
        isLoading: false,
        location: models.LocalLocation(
          latitude: latLng.latitude,
          longitude: latLng.longitude,
        ),
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  Future<void> saveLocalAddress(
    BuildContext context,
    AddressModalNotifier addressNotifier,
    SavedLocationsNotifier savedLocationsNotifier,
    bool? hasBack, {
    VoidCallback? onBack,
    VoidCallback? onGoMain,
  }) async {
    state = state.copyWith(isSaving: true);
    final List<models.LocalAddressData> localAddresses =
        LocalStorage.instance.getLocalAddressesList();
    for (int i = 0; i < localAddresses.length; i++) {
      if (localAddresses[i].isSelected ?? false) {
        final updated = localAddresses[i].copyWith(isSelected: false);
        localAddresses[i] = updated;
      }
    }
    localAddresses.insert(
      0,
      models.LocalAddressData(
        title: state.title,
        location: state.location,
        address: state.textController?.text,
        isDefault: false,
        isSelected: true,
      ),
    );
    LocalStorage.instance.setLocalAddressesList(localAddresses);
    LocalStorage.instance.setActiveAddressTile(state.title);
    await Future.delayed(const Duration(seconds: 3));
    if (hasBack ?? false) {
      onBack?.call();
    } else {
      LocalStorage.instance.setAddressSelected(true);
      onGoMain?.call();
    }
    clearSearchField();
    state.mapController?.dispose();
    state = state.copyWith(isSaving: false);
  }

  Future<void> fetchLocationName(BuildContext context, LatLng? latLng) async {
    state = state.copyWith(
      location: models.LocalLocation(
        latitude: latLng?.latitude,
        longitude: latLng?.longitude,
      ),
    );
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          latLng?.latitude ??
              (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
          latLng?.longitude ??
              (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
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
          state.textController?.text = placeName;
        }
      } catch (e) {
        state.textController?.text = '';
      }
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
