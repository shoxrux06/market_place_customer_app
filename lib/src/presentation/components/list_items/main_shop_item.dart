import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../core/utils/utils.dart';
import '../../../models/models.dart';
import '../../theme/theme.dart';
import '../components.dart';

class MainShopItem extends StatelessWidget {
  final ShopData shop;

  const MainShopItem({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: isDarkMode
              ? AppColors.mainBackDark
              : AppColors.dontHaveAccBtnBack,
          borderRadius: BorderRadius.circular(10.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () => context.pushRoute(
              const ShopMainRoute(),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: REdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 19,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50.r,
                        height: 50.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: isDarkMode
                              ? AppColors.dontHaveAnAccBackDark
                              : AppColors.white,
                        ),
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${AppConstants.imageBaseUrl}/${shop.logoImg}',
                            height: 40.r,
                            width: 40.r,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, progress) {
                              return MakeShimmer(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.white,
                                  ),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(
                                FlutterRemix.image_line,
                                size: 20,
                                color: AppColors.black,
                              );
                            },
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${shop.translation?.title}'.toUpperCase(),
                                style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -14 * 0.01,
                                ),
                              ),
                              6.horizontalSpace,
                              Icon(
                                FlutterRemix.checkbox_circle_fill,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                size: 14.r,
                              ),
                            ],
                          ),
                          7.verticalSpace,
                          Row(
                            children: [
                              Icon(
                                FlutterRemix.star_fill,
                                color: AppColors.starColor,
                                size: 16.r,
                              ),
                              6.horizontalSpace,
                              Text(
                                '${shop.ratingAvg ?? 0.0}',
                                style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: AppColors.unselectedTab,
                                  letterSpacing: -0.7,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  19.verticalSpace,
                  Row(
                    children: [
                      Container(
                        width: 28.r,
                        height: 28.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: isDarkMode
                              ? AppColors.dontHaveAnAccBackDark
                              : AppColors.white,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppAssets.svgIcDelivery,
                          width: 16.r,
                          height: 16.r,
                          color: AppColors.accentGreen,
                        ),
                      ),
                      12.horizontalSpace,
                      Container(
                        width: 28.r,
                        height: 28.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: isDarkMode
                              ? AppColors.dontHaveAnAccBackDark
                              : AppColors.white,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppAssets.svgIcLocationStar,
                          width: 16.r,
                          height: 16.r,
                          color: AppColors.starColor,
                        ),
                      ),
                      12.horizontalSpace,
                      Container(
                        height: 28.r,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.dontHaveAnAccBackDark
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(54.r),
                        ),
                        padding: REdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(
                              FlutterRemix.vip_crown_2_fill,
                              size: 16.r,
                              color: AppColors.red,
                            ),
                            6.horizontalSpace,
                            Text(
                              'Top seller'.toUpperCase(),
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: AppColors.red,
                                letterSpacing: -14 * 0.01,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
