import 'package:auto_route/auto_route.dart';
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

class ProductHorizontalItem extends StatelessWidget {
  final ProductData product;
  final Function(int? id) onLikePressed;

  const ProductHorizontalItem({
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
            height: 154.r,
            child: Row(
              children: [
                SizedBox(
                  height: 154.r,
                  width: 130.r,
                  child: Stack(
                    children: [
                      CommonImage(
                        imageUrl: product.img,
                        width: 130,
                        height: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          splashRadius: 18.r,
                          onPressed: () => onLikePressed(product.id),
                          icon: Icon(
                            AppHelpers.isLikedProduct(product.id)
                                ? FlutterRemix.heart_fill
                                : FlutterRemix.heart_line,
                            size: 22.r,
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
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      Text(
                        '${product.translation?.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          letterSpacing: -14 * 0.01,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      8.verticalSpace,
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
                      29.verticalSpace,
                      Row(
                        children: [
                          Text(
                            NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()
                                  .symbol,
                            ).format(hasDiscount
                                ? ((product.stocks?[0].price ?? 0) -
                                    (product.stocks?[0].discount ?? 0))
                                : product.stocks?[0].price),
                            style: GoogleFonts.k2d(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
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
                  ),
                )
              ],
            ),
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
