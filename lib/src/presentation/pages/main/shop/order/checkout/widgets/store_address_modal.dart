import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/checkout_provider.dart';

class StoreAddressModal extends ConsumerWidget {
  const StoreAddressModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: state.isStoreAddressLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                11.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 49.r,
                    height: 4.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.r),
                      color: isDarkMode
                          ? AppColors.dragElementDark
                          : AppColors.dragElement,
                    ),
                  ),
                ),
                16.verticalSpace,
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    state.shops[state.selectedShopIndex].translation?.address ??
                        AppHelpers.getTranslation(TrKeys.shopAddress),
                    style: GoogleFonts.k2d(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -14 * 0.01,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                16.verticalSpace,
                SizedBox(
                  height: 565.r,
                  width: 1.sw,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      )
                    },
                    onMapCreated: (controller) {
                      controller.setMapStyle(
                        json.encode(
                          isDarkMode
                              ? AppMapThemes.mapDarkTheme
                              : AppMapThemes.mapLightTheme,
                        ),
                      );
                    },
                    markers: Set<Marker>.of(state.markers.values),
                    initialCameraPosition: CameraPosition(
                      bearing: 0,
                      target: state.initialLatLng!,
                      tilt: 0,
                      zoom: 17,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
