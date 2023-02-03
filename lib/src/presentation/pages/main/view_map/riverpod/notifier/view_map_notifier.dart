import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../components/components.dart';
import '../state/view_map_state.dart';

class ViewMapNotifier extends StateNotifier<ViewMapState> {
  final ShopsRepository _shopsRepository;

  ViewMapNotifier(this._shopsRepository)
      : super(ViewMapState(globalKey: GlobalKey()));

  Future<void> fetchShops(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _shopsRepository.getAllShops();
      print('Response shops${response}');
      response.when(
        success: (data) async {
          state = state.copyWith(
            shops: data.data ?? [],
            isLoading: false,
          );
          fetchMarkers(context);
        },
        failure: (activeFailure) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get shops failure: $activeFailure');
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

  Future<void> fetchMarkers(BuildContext context) async {
    final ImageCropper image = ImageCropper();
    for (int i = 0; i < state.shops.length; i++) {
      final MarkerId markerId = MarkerId('$i-${state.shops[i].id}');
      final latitude =
          double.tryParse(state.shops[i].location?.latitude ?? '0') ??
              (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude);
      final longitude =
          double.tryParse(state.shops[i].location?.longitude ?? '0') ??
              (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude);
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(latitude, longitude),
        icon: await image.resizeAndCircle(state.shops[i].logoImg, 150),
        infoWindow: InfoWindow(
          title: state.shops[i].translation?.title?.toUpperCase(),
          snippet:
              '${AppHelpers.getTranslation(TrKeys.workingHours)}: ${state.shops[i].openTime} - ${state.shops[i].closeTime}',
        ),
      );
      final Map<MarkerId, Marker> markers = Map.from(state.shopMarkers);
      markers[markerId] = marker;
      state = state.copyWith(shopMarkers: markers);
    }
  }
}
