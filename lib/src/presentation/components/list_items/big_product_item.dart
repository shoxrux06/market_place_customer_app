import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../core/utils/utils.dart';
import '../../../models/models.dart';
import '../components.dart';
import '../../theme/theme.dart';

class BigProductItem extends StatelessWidget {
  final ProductData product;
  final Function() onLikePressed;

  const BigProductItem({
    Key? key,
    required this.product,
    required this.onLikePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool hasDiscount = product.stocks?[0].discount != null &&
        (product.stocks?[0].discount ?? 0) > 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => context.pushRoute(
            ProductRoute(uuid: product.uuid ?? ''),
          ),
          child: SizedBox(
            height: 418.r,
            child: Column(
              children: [
                SizedBox(
                  height: 340.r,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppConstants.imageBaseUrl}/${product.img}',
                          height: 340.r,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return MakeShimmer(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.mainBack,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.mainBack,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                FlutterRemix.image_line,
                                color: AppColors.black.withOpacity(0.5),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          splashRadius: 18.r,
                          onPressed: onLikePressed,
                          icon: Icon(
                            AppHelpers.isLikedProduct(product.id)
                                ? FlutterRemix.heart_fill
                                : FlutterRemix.heart_line,
                            size: 24.r,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      if (hasDiscount)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: REdgeInsets.all(12),
                            child: SvgPicture.asset(
                              AppAssets.svgIcDiscount,
                              width: 28.r,
                              height: 28.r,
                              color: AppColors.red,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                12.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${product.translation?.title}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              letterSpacing: -14 * 0.01,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              FlutterRemix.star_fill,
                              color: AppColors.starColor,
                              size: 16.r,
                            ),
                            5.horizontalSpace,
                            Text(
                              (product.ratingAvg ?? 0.0).toStringAsFixed(1),
                              style: GoogleFonts.k2d(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.2,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      children: [
                        Text(
                          NumberFormat.currency(
                            symbol:
                            LocalStorage.instance.getSelectedCurrency().symbol,
                          ).format(hasDiscount
                              ? ((product.stocks?[0].price ?? 0) -
                              (product.stocks?[0].discount ?? 0))
                              : product.stocks?[0].price),
                          style: GoogleFonts.k2d(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -0.7,
                          ),
                        ),
                        6.horizontalSpace,
                        if (hasDiscount)
                          Text(
                            NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()
                                  .symbol,
                            ).format(product.stocks?[0].price),
                            style: GoogleFonts.k2d(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.red,
                              letterSpacing: -0.7,
                            ),
                          ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        16.verticalSpace,
      ],
    );
  }
}
