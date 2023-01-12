import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'chat/riverpod/provider/chat_provider.dart';
import 'riverpod/provider/address_modal_provider.dart';
import 'widgets/address_button.dart';
import 'widgets/logout_modal.dart';
import 'widgets/profile_menu_button.dart';

class ProfileModal extends ConsumerStatefulWidget {
  const ProfileModal({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends ConsumerState<ProfileModal> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(addressModalProvider.notifier).fetchLocalAddresses();
        ref.read(chatProvider.notifier).fetchChats(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          11.verticalSpace,
          Container(
            width: 49.r,
            height: 4.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(62.r),
              color: isDarkMode
                  ? AppColors.dragElementDark
                  : AppColors.dragElement,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              width: 20.r,
              height: 20.r,
              margin: EdgeInsetsDirectional.only(end: 15.r),
              child: IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 20.r,
                onPressed: context.popRoute,
                icon: Icon(
                  FlutterRemix.close_circle_fill,
                  size: 20.r,
                  color: isDarkMode
                      ? AppColors.white
                      : AppColors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 15.r),
              child: const AddressButton(),
            ),
          ),
          15.verticalSpace,
          Divider(
            thickness: 1.r,
            height: 0.r,
            color: isDarkMode
                ? AppColors.white.withOpacity(0.06)
                : AppColors.black.withOpacity(0.01),
          ),
          15.verticalSpace,
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppConstants.imageBaseUrl}/${LocalStorage.instance.getProfileImage()}',
                          width: 50.r,
                          height: 50.r,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return MakeShimmer(
                              child: Container(
                                width: 50.r,
                                height: 50.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: isDarkMode
                                      ? AppColors.dontHaveAnAccBackDark
                                      : AppColors.white,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Container(
                              height: 50.r,
                              width: 50.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: isDarkMode
                                    ? AppColors.dontHaveAnAccBackDark
                                    : AppColors.white,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                FlutterRemix.image_line,
                                size: 20.r,
                                color: isDarkMode
                                    ? AppColors.white.withOpacity(0.5)
                                    : AppColors.black.withOpacity(0.4),
                              ),
                            );
                          },
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: Container(
                          height: 50.r,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.dontHaveAnAccBackDark
                                : AppColors.dontHaveAccBtnBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          alignment: Alignment.center,
                          padding: REdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FlutterRemix.wallet_3_line,
                                    size: 18.r,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    LocalStorage.instance
                                                .getWalletData()
                                                ?.price !=
                                            null
                                        ? intl.NumberFormat.currency(
                                            symbol: LocalStorage.instance
                                                .getSelectedCurrency()
                                                .symbol,
                                          ).format(
                                            LocalStorage.instance
                                                .getWalletData()
                                                ?.price,
                                          )
                                        : AppHelpers.getTranslation(
                                            TrKeys.noWallet),
                                    style: GoogleFonts.k2d(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                      color: isDarkMode
                                          ? AppColors.white
                                          : AppColors.black,
                                    ),
                                  ),
                                  7.horizontalSpace,
                                  Icon(
                                    FlutterRemix.link,
                                    size: 18.r,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ],
                              ),
                              Icon(
                                FlutterRemix.add_circle_fill,
                                size: 20.r,
                                color: AppColors.accentGreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Material(
                        borderRadius: BorderRadius.circular(8.r),
                        color: isDarkMode
                            ? AppColors.dontHaveAnAccBackDark
                            : AppColors.dontHaveAccBtnBack,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () => context.router
                              .popAndPush(const SystemSettingsRoute()),
                          child: Container(
                            width: 50.r,
                            height: 50.r,
                            alignment: Alignment.center,
                            child: Icon(
                              FlutterRemix.settings_3_line,
                              size: 22.r,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const CustomBouncingScrollPhysics(),
                      children: [
                        ProfileMenuButton(
                          iconData: FlutterRemix.user_settings_line,
                          title: AppHelpers.getTranslation(
                              TrKeys.personalInformation),
                          onTap: () {
                            if (LocalStorage.instance.getToken().isEmpty) {
                              LocalStorage.instance.deleteToken();
                              AppHelpers.showCheckFlash(
                                context,
                                AppHelpers.getTranslation(
                                    TrKeys.youNeedToLoginFirst),
                              );
                              context.replaceRoute(const LoginRoute());
                              return;
                            }
                            context.router
                                .popAndPush(const ProfileSettingsRoute());
                          },
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.bookmark_3_line,
                          title: AppHelpers.getTranslation(TrKeys.savedStores),
                          onTap: () => context.router
                              .popAndPush(const SavedStoresRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.percent_line,
                          title: AppHelpers.getTranslation(TrKeys.discount),
                          onTap: () => context.router
                              .popAndPush(const DiscountProductsRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.eye_line,
                          title:
                              AppHelpers.getTranslation(TrKeys.viewedProducts),
                          onTap: () => context.router
                              .popAndPush(const ViewedProductsRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.bank_card_line,
                          title:
                              AppHelpers.getTranslation(TrKeys.walletHistory),
                          onTap: () => context.router
                              .popAndPush(const WalletHistoriesRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.shirt_line,
                          title: AppHelpers.getTranslation(TrKeys.blogs),
                          onTap: () =>
                              context.router.popAndPush(const BlogRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.map_pin_2_line,
                          title:
                              AppHelpers.getTranslation(TrKeys.savedLocations),
                          onTap: () => context.router
                              .popAndPush(const SavedLocationsRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.file_list_2_line,
                          title: AppHelpers.getTranslation(TrKeys.orderHistory),
                          onTap: () {
                            if (LocalStorage.instance.getToken().isEmpty) {
                              LocalStorage.instance.deleteToken();
                              AppHelpers.showCheckFlash(
                                context,
                                AppHelpers.getTranslation(
                                    TrKeys.youNeedToLoginFirst),
                              );
                              context.replaceRoute(const LoginRoute());
                              return;
                            }
                            context.router
                                .popAndPush(const OrderHistoryRoute());
                          },
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.chat_smile_2_line,
                          title: AppHelpers.getTranslation(TrKeys.chat),
                          onTap: () => chatNotifier.checkAuthorised(context),
                          widget: chatState.isLoading
                              ? JumpingDots(
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  radius: 5,
                                )
                              : StreamBuilder<QuerySnapshot>(
                                  stream: _fireStore
                                      .collection('messages')
                                      .where('chat_id',
                                          isEqualTo: chatState.chatId)
                                      .where('unread', isEqualTo: true)
                                      .where('sender', isEqualTo: 0)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    debugPrint(
                                        '===> profile modal has data: ${snapshot.hasData}');
                                    if (!snapshot.hasData) {
                                      return const SizedBox();
                                    }
                                    final List<DocumentSnapshot> docs =
                                        snapshot.data!.docs;
                                    if (docs.isEmpty) {
                                      return Container();
                                    }
                                    return Container(
                                      margin: REdgeInsets.only(right: 10),
                                      height: 24.r,
                                      width: 24.r,
                                      decoration: BoxDecoration(
                                        color: AppColors.red,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        docs.length.toString(),
                                        style: GoogleFonts.k2d(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          letterSpacing: -0.5,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.store_2_line,
                          title: AppHelpers.getTranslation(TrKeys.becomeSeller),
                          onTap: () => context.router
                              .popAndPush(const BecomeSellerRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.logout_circle_r_line,
                          title: LocalStorage.instance.getToken().isEmpty
                              ? AppHelpers.getTranslation(TrKeys.login)
                              : AppHelpers.getTranslation(TrKeys.logout),
                          onTap: () {
                            if (LocalStorage.instance.getToken().isEmpty) {
                              LocalStorage.instance.logout();
                              context.replaceRoute(const LoginRoute());
                            } else {
                              AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: const LogoutModal(),
                                isDarkMode: isDarkMode,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
