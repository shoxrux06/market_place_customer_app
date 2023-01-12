import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../../../../theme/theme.dart';

class ProductPriceWidget extends StatelessWidget {
  final Stocks? selectedStock;

  const ProductPriceWidget({Key? key, this.selectedStock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool hasDiscount =
        selectedStock?.discount != null && (selectedStock!.discount ?? 0) > 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              NumberFormat.currency(
                symbol: LocalStorage.instance.getSelectedCurrency().symbol,
              ).format(
                hasDiscount
                    ? ((selectedStock?.price ?? 0) -
                        (selectedStock?.discount ?? 0))
                    : selectedStock?.price,
              ),
              style: GoogleFonts.k2d(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? AppColors.white : AppColors.black,
                letterSpacing: -0.4,
              ),
            ),
            if (hasDiscount)
              Row(
                children: [
                  10.horizontalSpace,
                  Container(
                    width: 4.r,
                    height: 4.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: AppColors.black.withOpacity(0.2),
                    ),
                  ),
                  6.horizontalSpace,
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency().symbol,
                    ).format(selectedStock?.price),
                    style: GoogleFonts.k2d(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.red,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
          ],
        ),
        if (hasDiscount)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.red,
            ),
            padding: REdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.svgIcDiscount,
                  width: 18,
                  height: 18,
                  color: AppColors.white,
                ),
                4.horizontalSpace,
                Text(
                  '${AppHelpers.getTranslation(TrKeys.sale)} ${(((selectedStock?.discount ?? 0) / (selectedStock?.price ?? 1)) * 100).toInt()}%',
                  style: GoogleFonts.k2d(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    letterSpacing: -0.4,
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
