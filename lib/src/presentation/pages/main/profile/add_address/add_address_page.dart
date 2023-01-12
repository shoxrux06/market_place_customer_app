import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as lottie;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/add_address_provider.dart';
import 'widgets/enter_location_title_modal.dart';
import 'widgets/my_location_button.dart';
import 'widgets/searched_location_item.dart';

class AddAddressPage extends ConsumerStatefulWidget {
  final bool isRequired;

  const AddAddressPage({Key? key, required this.isRequired}) : super(key: key);

  @override
  ConsumerState<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends ConsumerState<AddAddressPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  CameraPosition? cameraPosition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addAddressProvider);
    final notifier = ref.read(addAddressProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isSaving,
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
            appBar: CommonAppBar(
              title: AppHelpers.getTranslation(TrKeys.enterADeliveryAddress),
              hasBack: !widget.isRequired,
              onLeadingPressed: context.popRoute,
            ),
            body: Stack(
              children: [
                GoogleMap(
                  tiltGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    bearing: 0,
                    target: LatLng(
                      AppHelpers.getInitialLatitude() ??
                          AppConstants.demoLatitude,
                      AppHelpers.getInitialLongitude() ??
                          AppConstants.demoLongitude,
                    ),
                    tilt: 0,
                    zoom: 17,
                  ),
                  onMapCreated: (controller) {
                    controller.setMapStyle(
                      json.encode(
                        isDarkMode
                            ? AppMapThemes.mapDarkTheme
                            : AppMapThemes.mapLightTheme,
                      ),
                    );
                    notifier.setMapController(controller);
                  },
                  onTap: (LatLng tapped) =>
                      notifier.goToTappedLocation(context, tapped),
                  zoomControlsEnabled: false,
                  onCameraMoveStarted: () {
                    _animationController.repeat(
                      min: AppConstants.pinLoadingMin,
                      max: AppConstants.pinLoadingMax,
                      period: _animationController.duration! *
                          (AppConstants.pinLoadingMax -
                              AppConstants.pinLoadingMin),
                    );
                    notifier.setChoosing(true);
                  },
                  onCameraIdle: () async {
                    _animationController.forward(
                      from: AppConstants.pinLoadingMax,
                    );
                    notifier.fetchLocationName(context, cameraPosition?.target);
                    notifier.setChoosing(false);
                  },
                  onCameraMove: (cameraPosition) {
                    this.cameraPosition = cameraPosition;
                  },
                ),
                IgnorePointer(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 78.0,
                      ),
                      child: lottie.Lottie.asset(
                        AppAssets.lottiePin,
                        onLoaded: (composition) {
                          _animationController.duration = composition.duration;
                        },
                        controller: _animationController,
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchTextField(
                      textEditingController: state.textController,
                      onChanged: (value) => notifier.setQuery(context),
                      hintText:
                          AppHelpers.getTranslation(TrKeys.searchLocation),
                      suffixIcon: IconButton(
                        splashRadius: 10,
                        icon: Icon(
                          FlutterRemix.close_line,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          size: 18.r,
                        ),
                        onPressed: notifier.clearSearchField,
                      ),
                    ),
                    state.isSearching
                        ? const SearchLocationListShimmer()
                        : ListView.builder(
                            physics: const CustomBouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.searchedLocations.length,
                            itemBuilder: (context, index) {
                              final location = state.searchedLocations[index];
                              return SearchedLocationItem(
                                location: location,
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  notifier.goToLocation(
                                    context,
                                    id: location.placeId,
                                    name:
                                        location.structuredFormatting?.mainText,
                                  );
                                },
                              );
                            },
                          ),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: state.isChoosing ? -50.r : 20.r,
                  left: 15.r,
                  right: 15.r,
                  child: AccentLoginButton(
                    title: AppHelpers.getTranslation(TrKeys.confirmLocation),
                    onPressed: state.location == null
                        ? null
                        : () {
                            AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: EnterLocationTitleModal(
                                hasBack: !widget.isRequired,
                              ),
                              isDarkMode: isDarkMode,
                            );
                          },
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: 89.r,
                  right: state.isChoosing ? -55.r : 15.r,
                  child: MyLocationButton(
                    onTap: () => notifier.findMyLocation(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
