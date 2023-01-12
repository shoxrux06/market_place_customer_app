import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../theme/theme.dart';

class SavedLocationItem extends StatelessWidget {
  final LocalAddressData address;
  final Map<MarkerId, Marker> markers;
  final Function() onDelete;

  const SavedLocationItem({
    Key? key,
    required this.address,
    required this.markers,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isDarkMode ? AppColors.borderDark : AppColors.borderColor,
          width: 1.r,
        ),
      ),
      margin: REdgeInsets.only(bottom: 11),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 40.r,
                            height: 40.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: isDarkMode
                                  ? AppColors.mainBackDark
                                  : AppColors.black,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              FlutterRemix.map_pin_line,
                              color: AppColors.white,
                              size: 22.r,
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Text(
                              '${address.title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    LocalStorage.instance.getLocalAddressesList().length < 2
                        ? const SizedBox()
                        : GestureDetector(
                            child: Icon(
                              FlutterRemix.more_2_line,
                              size: 22.r,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                            onTapDown: (TapDownDetails details) {
                              final left = details.globalPosition.dx;
                              final right = details.globalPosition.dy;
                              showMenu(
                                context: context,
                                color: isDarkMode
                                    ? AppColors.mainBackDark
                                    : AppColors.white,
                                position: RelativeRect.fromLTRB(
                                  left.r,
                                  right.r + 20.r,
                                  20.r,
                                  0,
                                ),
                                items: [
                                  // PopupMenuItem(
                                  //   height: 25.r,
                                  //   textStyle: GoogleFonts.k2d(
                                  //     fontWeight: FontWeight.w500,
                                  //     fontSize: 13.sp,
                                  //     color: AppColors.black,
                                  //     letterSpacing: -0.2,
                                  //   ),
                                  //   child: Padding(
                                  //     padding: REdgeInsets.symmetric(vertical: 10),
                                  //     child: const Text('Edit'),
                                  //   ),
                                  //   onTap: () {
                                  //     debugPrint('==> Edit');
                                  //   },
                                  // ),
                                  PopupMenuItem(
                                    height: 25.r,
                                    textStyle: GoogleFonts.k2d(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      color: isDarkMode
                                          ? AppColors.white
                                          : AppColors.black,
                                      letterSpacing: -0.2,
                                    ),
                                    onTap: onDelete,
                                    child: Padding(
                                      padding:
                                          REdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        AppHelpers.getTranslation(
                                            TrKeys.delete),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  address.address ?? '',
                  maxLines: 2,
                  style: GoogleFonts.k2d(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: isDarkMode
                        ? AppColors.white
                        : AppColors.locationAddress,
                    letterSpacing: -0.4,
                  ),
                ),
              ],
            ),
          ),
          12.verticalSpace,
          SizedBox(
            height: 154.r,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
              child: GoogleMap(
                zoomControlsEnabled: false,
                tiltGesturesEnabled: false,
                compassEnabled: false,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                markers: Set<Marker>.of(markers.values),
                initialCameraPosition: CameraPosition(
                  bearing: 0,
                  target: LatLng(
                    address.location?.latitude ??
                        (AppHelpers.getInitialLatitude() ??
                            AppConstants.demoLatitude),
                    address.location?.longitude ?? (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
                  ),
                  tilt: 0,
                  zoom: 17,
                ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
