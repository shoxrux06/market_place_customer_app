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

class ProductItemWidget extends StatelessWidget {
  final ProductData product;
  final Function() onLikePressed;

  const ProductItemWidget({
    Key? key,
    required this.product,
    required this.onLikePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool hasDiscount = product.stocks?[0].discount != null &&
        (product.stocks?[0].discount ?? 0) > 0;
    return Container(
      margin: REdgeInsets.only(right: 9),
      width: 228.r,
      child: InkWell(
        onTap: () => context.pushRoute(
          ProductRoute(uuid: product.uuid ?? ''),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 260.r,
              width: 228.r,
              child: Stack(
                children: [
                  CommonImage(
                    imageUrl: product.img,
                    width: 228,
                    height: 260,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: onLikePressed,
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
            13.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${product.translation?.title}'.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -14 * 0.01,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
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
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            13.verticalSpace,
            Row(
              children: [
                Text(
                  NumberFormat.currency(
                    symbol: LocalStorage.instance.getSelectedCurrency().symbol,
                  ).format(hasDiscount
                      ? ((product.stocks?[0].price ?? 0) -
                          (product.stocks?[0].discount ?? 0))
                      : product.stocks?[0].price),
                  style: GoogleFonts.k2d(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    letterSpacing: -0.4,
                  ),
                ),
                10.horizontalSpace,
                if (hasDiscount)
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency().symbol,
                    ).format(product.stocks?[0].price),
                    style: GoogleFonts.k2d(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.red,
                      letterSpacing: -0.4,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
