import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../../riverpod/provider/app_provider.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import '../profile/profile_modal.dart';
import 'liked/riverpod/provider/liked_provider.dart';

class ShopMainPage extends ConsumerWidget {
  const ShopMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final bool isLtr = ref.watch(appProvider).isLtr;
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: AutoTabsScaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          extendBody: true,
          appBarBuilder: (context, tabsRouter) {
            return tabsRouter.activeIndex == 0
                ? AppBar(
                    backgroundColor: isDarkMode
                        ? AppColors.dontHaveAnAccBackDark
                        : AppColors.white,
                    elevation: 0,
                    leadingWidth: 0.r,
                    leading: const SizedBox(),
                    centerTitle: false,
                    title: Text(
                      '${AppHelpers.getAppName()}',
                      style: GoogleFonts.k2d(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -0.7,
                      ),
                    ),
                    actions: [
                      IconButton(
                        splashRadius: 18.r,
                        onPressed: () =>
                            context.pushRoute(const NotificationsRoute()),
                        icon: Icon(
                          FlutterRemix.notification_line,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          size: 22.r,
                        ),
                      ),
                    ],
                  )
                : tabsRouter.activeIndex == 1
                    ? AppBar(
                        backgroundColor: isDarkMode
                            ? AppColors.dontHaveAnAccBackDark
                            : AppColors.white,
                        elevation: 0,
                        leadingWidth: 0.r,
                        leading: const SizedBox(),
                        centerTitle: true,
                        title: Text(
                          AppHelpers.getTranslation(TrKeys.categories)
                              .toUpperCase(),
                          style: GoogleFonts.k2d(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -0.7,
                          ),
                        ),
                      )
                    : AppBar(
                        backgroundColor: isDarkMode
                            ? AppColors.dontHaveAnAccBackDark
                            : AppColors.white,
                        elevation: 0,
                        leadingWidth: 0.r,
                        leading: const SizedBox(),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppHelpers.getTranslation(TrKeys.likedProducts)
                                  .toUpperCase(),
                              style: GoogleFonts.k2d(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.7,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            10.horizontalSpace,
                            Container(
                              width: 4.r,
                              height: 4.r,
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? AppColors.white.withOpacity(0.5)
                                    : AppColors.brandTitleDivider
                                        .withOpacity(0.4),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            7.horizontalSpace,
                            Text(
                              '${LocalStorage.instance.getLikedProductsList().length} ${AppHelpers.getTranslation(TrKeys.products)}',
                              style: GoogleFonts.k2d(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.7,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        centerTitle: true,
                      );
          },
          routes: const [
            ShopDetailsRoute(),
            CategoriesRoute(),
            LikedRoute(),
          ],
          bottomNavigationBuilder: (context, tabRouter) {
            return ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                child: Container(
                  height: Platform.isAndroid ? 72.r : 97.r,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.dontHaveAnAccBackDark.withOpacity(0.7)
                        : AppColors.white.withOpacity(0.7),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.bottomNavigationShadow,
                        spreadRadius: 25.r,
                        blurRadius: 35.r,
                        offset: Offset(0.r, 0.r),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: BottomNavigationBar(
                    selectedItemColor:
                        isDarkMode ? AppColors.white : AppColors.black,
                    unselectedItemColor: AppColors.unselectedBottomItem,
                    backgroundColor: AppColors.bottomNavigationBack,
                    onTap: (index) {
                      if (index == 3) {
                        context.pushRoute(const OrderRoute());
                        return;
                      } else if (index == 4) {
                        AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: const ProfileModal(),
                          isDarkMode: isDarkMode,
                          paddingTop: 50,
                        );
                        return;
                      }
                      if (index == 2 && tabRouter.activeIndex != 2) {
                        ref
                            .read(likedProvider.notifier)
                            .fetchLikedProducts(context);
                      }
                      tabRouter.setActiveIndex(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: [
                      _barItem(
                        iconData: FlutterRemix.store_2_fill,
                        label: '${AppHelpers.getAppName()}',
                        isSelected: tabRouter.activeIndex == 0,
                      ),
                      _barItem(
                        iconData: FlutterRemix.apps_2_fill,
                        label: AppHelpers.getTranslation(TrKeys.categories),
                        isSelected: tabRouter.activeIndex == 1,
                      ),
                      _barItem(
                        iconData: FlutterRemix.heart_3_fill,
                        label: AppHelpers.getTranslation(TrKeys.liked),
                        isSelected: tabRouter.activeIndex == 2,
                      ),
                      _barItem(
                        iconData: FlutterRemix.shopping_bag_3_fill,
                        label: AppHelpers.getTranslation(TrKeys.order),
                        isSelected: tabRouter.activeIndex == 3,
                      ),
                      BottomNavigationBarItem(
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${AppConstants.imageBaseUrl}/${LocalStorage.instance.getProfileImage()}',
                            width: 40.r,
                            height: 40.r,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, progress) {
                              return MakeShimmer(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: AppColors.mainBack,
                                  ),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: isDarkMode
                                      ? AppColors.mainBackDark
                                      : AppColors.white,
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  FlutterRemix.image_line,
                                  color: isDarkMode
                                      ? AppColors.white.withOpacity(0.5)
                                      : AppColors.black.withOpacity(0.5),
                                  size: 15.r,
                                ),
                              );
                            },
                          ),
                        ),
                        label: AppHelpers.getTranslation(TrKeys.profile),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem({
    required IconData iconData,
    required String label,
    required bool isSelected,
  }) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: isSelected
            ? (isDarkMode ? AppColors.white : AppColors.black)
            : (isDarkMode
                ? AppColors.white.withOpacity(0.5)
                : AppColors.unselectedBottomItem),
        size: 24.r,
      ),
      label: label,
    );
  }
}
