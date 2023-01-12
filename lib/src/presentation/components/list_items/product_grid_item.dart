import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../models/models.dart';
import '../components.dart';
import '../../theme/theme.dart';

class ProductGridItem extends StatelessWidget {
  final ProductData product;
  final Function() onTap;
  final Function() onLikeTap;

  const ProductGridItem({
    Key? key,
    required this.product,
    required this.onTap,
    required this.onLikeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool hasDiscount = product.stocks?[0].discount != null &&
        (product.stocks?[0].discount ?? 0) > 0;
    final String price = NumberFormat.currency(
      symbol: LocalStorage.instance.getSelectedCurrency().symbol,
    ).format(hasDiscount
        ? ((product.stocks?[0].price ?? 0) - (product.stocks?[0].discount ?? 0))
        : product.stocks?[0].price);
    final lineThroughPrice = NumberFormat.currency(
      symbol: LocalStorage.instance.getSelectedCurrency().symbol,
    ).format(product.stocks?[0].price);
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 204.r,
            child: Stack(
              children: [
                CommonImage(
                  imageUrl: product.img,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    splashRadius: 18.r,
                    onPressed: onLikeTap,
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
          8.verticalSpace,
          Text(
            '${product.translation?.title}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.k2d(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: -14 * 0.01,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
          6.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hasDiscount
                  ? Column(
                      children: [
                        Text(
                          price,
                          style: GoogleFonts.k2d(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -0.7,
                          ),
                        ),
                        if (hasDiscount)
                          Text(
                            lineThroughPrice,
                            style: GoogleFonts.k2d(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.red,
                              letterSpacing: -0.7,
                            ),
                          ),
                      ],
                    )
                  : Row(
                      children: [
                        Text(
                          price,
                          style: GoogleFonts.k2d(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -0.7,
                          ),
                        ),
                        6.horizontalSpace,
                        if (hasDiscount)
                          Text(
                            lineThroughPrice,
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
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.2,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
