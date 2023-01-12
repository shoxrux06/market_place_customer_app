import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/become_seller_provider.dart';
import 'widgets/select_shop_images_button.dart';
import 'widgets/shop_accepted_body.dart';
import 'widgets/shop_rejected_body.dart';
import 'widgets/shop_under_review_body.dart';

class BecomeSellerPage extends ConsumerStatefulWidget {
  const BecomeSellerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BecomeSellerPage> createState() => _BecomeSellerPageState();
}

class _BecomeSellerPageState extends ConsumerState<BecomeSellerPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  CameraPosition? cameraPosition;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(becomeSellerProvider.notifier).fetchProfileDetails(context);
      },
    );
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
    final state = ref.watch(becomeSellerProvider);
    final notifier = ref.read(becomeSellerProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading || state.isSaving,
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
            appBar: CommonAppBar(
              title: AppHelpers.getTranslation(TrKeys.becomeSeller),
              onLeadingPressed: () => context.popRoute(),
            ),
            body: state.isLoading
                ? JumpingDots(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  )
                : Column(
                    children: [
                      1.verticalSpace,
                      state.shopStatus == ShopStatus.approved
                          ? const Expanded(child: ShopAcceptedBody())
                          : state.shopStatus == ShopStatus.rejected
                              ? const Expanded(child: ShopRejectedBody())
                              : state.shopStatus == ShopStatus.newShop
                                  ? const Expanded(child: ShopUnderReviewBody())
                                  : Expanded(
                                      child: SingleChildScrollView(
                                        physics:
                                            const CustomBouncingScrollPhysics(),
                                        child: Container(
                                          color: isDarkMode
                                              ? AppColors.dontHaveAnAccBackDark
                                              : AppColors.white,
                                          padding: REdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              26.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                  TrKeys.uploadImage,
                                                ),
                                                style: GoogleFonts.k2d(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  letterSpacing: -14 * 0.03,
                                                  color: isDarkMode
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                              16.verticalSpace,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                        SelectShopImagesButton(
                                                      title: AppHelpers
                                                          .getTranslation(
                                                              TrKeys.logoImage),
                                                      onChangePhoto:
                                                          notifier.setLogoFile,
                                                      file: state.logoFile,
                                                    ),
                                                  ),
                                                  9.horizontalSpace,
                                                  Expanded(
                                                    child:
                                                        SelectShopImagesButton(
                                                      title: AppHelpers
                                                          .getTranslation(TrKeys
                                                              .backgroundImage),
                                                      onChangePhoto: notifier
                                                          .setBackgroundFile,
                                                      file:
                                                          state.backgroundFile,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.general),
                                                style: GoogleFonts.k2d(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  letterSpacing: -14 * 0.03,
                                                  color: isDarkMode
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                              16.verticalSpace,
                                              OutlinedBorderTextField(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.name),
                                                onChanged: notifier.setName,
                                              ),
                                              15.verticalSpace,
                                              OutlinedBorderTextField(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.phone),
                                                onChanged: notifier.setPhone,
                                              ),
                                              15.verticalSpace,
                                              OutlinedBorderTextField(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.description),
                                                onChanged:
                                                    notifier.setDescription,
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.showWorkingHours),
                                                style: GoogleFonts.k2d(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  letterSpacing: -14 * 0.03,
                                                  color: isDarkMode
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                              16.verticalSpace,
                                              SelectFromDialogButton(
                                                prefixIcon:
                                                    FlutterRemix.time_fill,
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.openTime),
                                                text: state.openTime.isEmpty
                                                    ? AppHelpers.getTranslation(
                                                        TrKeys.selectOpenTime)
                                                    : state.openTime,
                                                onTap: () {
                                                  AppHelpers
                                                      .showCustomModalBottomSheet(
                                                    context: context,
                                                    modal: TimePickerModal(
                                                      onSaved: (time) {
                                                        notifier
                                                            .setOpenTime(time);
                                                        context.popRoute();
                                                      },
                                                    ),
                                                    isDarkMode: isDarkMode,
                                                  );
                                                },
                                              ),
                                              16.verticalSpace,
                                              SelectFromDialogButton(
                                                prefixIcon:
                                                    FlutterRemix.time_fill,
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.closeTime),
                                                text: state.closeTime.isEmpty
                                                    ? AppHelpers.getTranslation(
                                                        TrKeys.selectCloseTime)
                                                    : state.closeTime,
                                                onTap: () {
                                                  AppHelpers
                                                      .showCustomModalBottomSheet(
                                                    context: context,
                                                    modal: TimePickerModal(
                                                      onSaved: (time) {
                                                        notifier
                                                            .setCloseTime(time);
                                                        context.popRoute();
                                                      },
                                                    ),
                                                    isDarkMode: isDarkMode,
                                                  );
                                                },
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.order),
                                                style: GoogleFonts.k2d(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  letterSpacing: -14 * 0.03,
                                                  color: isDarkMode
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                              16.verticalSpace,
                                              OutlinedBorderTextField(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.minimumAmount),
                                                onChanged:
                                                    notifier.setMinAmount,
                                              ),
                                              15.verticalSpace,
                                              OutlinedBorderTextField(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.tax),
                                                onChanged: notifier.setTax,
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.address),
                                                style: GoogleFonts.k2d(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  letterSpacing: -14 * 0.03,
                                                  color: isDarkMode
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                              16.verticalSpace,
                                              OutlinedBorderTextField(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.deliveryRange),
                                                onChanged:
                                                    notifier.setDeliveryRange,
                                              ),
                                              15.verticalSpace,
                                              OutlinedBorderTextField(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.address),
                                                textController:
                                                    state.addressController,
                                              ),
                                              15.verticalSpace,
                                              SizedBox(
                                                height: 480.r,
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                      child: GoogleMap(
                                                        zoomControlsEnabled:
                                                            false,
                                                        gestureRecognizers: {
                                                          Factory<
                                                              OneSequenceGestureRecognizer>(
                                                            () =>
                                                                EagerGestureRecognizer(),
                                                          )
                                                        },
                                                        initialCameraPosition:
                                                            const CameraPosition(
                                                          target: LatLng(
                                                            AppConstants
                                                                .demoLatitude,
                                                            AppConstants
                                                                .demoLongitude,
                                                          ),
                                                          zoom: 14,
                                                        ),
                                                        onMapCreated:
                                                            (controller) {
                                                          controller
                                                              .setMapStyle(
                                                            json.encode(
                                                              isDarkMode
                                                                  ? AppMapThemes
                                                                      .mapDarkTheme
                                                                  : AppMapThemes
                                                                      .mapLightTheme,
                                                            ),
                                                          );
                                                        },
                                                        onCameraMoveStarted:
                                                            () {
                                                          _animationController
                                                              .repeat(
                                                            min: AppConstants
                                                                .pinLoadingMin,
                                                            max: AppConstants
                                                                .pinLoadingMax,
                                                            period: _animationController
                                                                    .duration! *
                                                                (AppConstants
                                                                        .pinLoadingMax -
                                                                    AppConstants
                                                                        .pinLoadingMin),
                                                          );
                                                        },
                                                        onCameraIdle: () async {
                                                          _animationController
                                                              .forward(
                                                            from: AppConstants
                                                                .pinLoadingMax,
                                                          );
                                                          notifier
                                                              .fetchLocationName(
                                                                  context,
                                                                  cameraPosition
                                                                      ?.target);
                                                        },
                                                        onCameraMove:
                                                            (cameraPosition) {
                                                          this.cameraPosition =
                                                              cameraPosition;
                                                        },
                                                      ),
                                                    ),
                                                    IgnorePointer(
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            bottom: 78.0,
                                                          ),
                                                          child: Lottie.asset(
                                                            AppAssets.lottiePin,
                                                            onLoaded:
                                                                (composition) {
                                                              _animationController
                                                                      .duration =
                                                                  composition
                                                                      .duration;
                                                            },
                                                            controller:
                                                                _animationController,
                                                            width: 250,
                                                            height: 250,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              40.verticalSpace,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: AppColors.white,
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        onTap: () =>
                                                            context.popRoute(),
                                                        child: Container(
                                                          height: 46.r,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                              width: 1.r,
                                                              color: AppColors
                                                                  .black,
                                                            ),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            AppHelpers
                                                                .getTranslation(
                                                                    TrKeys
                                                                        .cancel),
                                                            style:
                                                                GoogleFonts.k2d(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15.sp,
                                                              letterSpacing:
                                                                  -14 * 0.01,
                                                              color: AppColors
                                                                  .black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  17.horizontalSpace,
                                                  Expanded(
                                                    child: AccentLoginButton(
                                                      title: AppHelpers
                                                          .getTranslation(
                                                              TrKeys.save),
                                                      isLoading: state.isSaving,
                                                      onPressed:
                                                          state.saveBtnEnabled
                                                              ? () {
                                                                  notifier
                                                                      .createShop(
                                                                    context,
                                                                    cameraPosition
                                                                        ?.target,
                                                                  );
                                                                }
                                                              : null,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              20.verticalSpace,
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
