import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../models/models.dart';
import '../../../../riverpod/provider/app_provider.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'riverpod/provider/view_map_provider.dart';

class ViewMapPage extends ConsumerStatefulWidget {
  const ViewMapPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ViewMapPage> createState() => _ViewMapPageState();
}

class _ViewMapPageState extends ConsumerState<ViewMapPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(viewMapProvider.notifier).fetchShops(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(viewMapProvider);
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SlidingUpPanel(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                minHeight: 116.r,
                maxHeight: 1.sh -
                    MediaQuery.of(context).viewPadding.top -
                    kToolbarHeight -
                    54.r -
                    40.r,
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                body: Padding(
                  padding: REdgeInsets.only(bottom: 250),
                  child: Stack(
                    children: [
                      GoogleMap(
                        padding: REdgeInsets.only(bottom: 15),
                        myLocationButtonEnabled: false,
                        initialCameraPosition: CameraPosition(
                          bearing: 0,
                          target: LatLng(
                            (AppHelpers.getInitialLatitude() ??
                                AppConstants.demoLatitude),
                            (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
                          ),
                          tilt: 0,
                          zoom: 12,
                        ),
                        onMapCreated: (controller) {
                          controller.setMapStyle(
                            json.encode(
                              isDarkMode
                                  ? AppMapThemes.mapDarkTheme
                                  : AppMapThemes.mapLightTheme,
                            ),
                          );
                        },
                        mapToolbarEnabled: false,
                        zoomControlsEnabled: false,
                        markers: Set<Marker>.of(state.shopMarkers.values),
                      ),
                    ],
                  ),
                ),
                padding: REdgeInsets.symmetric(horizontal: 15),
                panel: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    8.verticalSpace,
                    Container(
                      width: 49.r,
                      height: 3.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62.r),
                        color: isDarkMode
                            ? AppColors.dragElementDark
                            : AppColors.dragElement,
                      ),
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: state.isLoading
                          ? const JumpingDots()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const CustomBouncingScrollPhysics(),
                              itemCount: state.shops.length,
                              itemBuilder: (context, index) {
                                final ShopData shop = state.shops[index];
                                return MainShopItem(shop: shop);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
