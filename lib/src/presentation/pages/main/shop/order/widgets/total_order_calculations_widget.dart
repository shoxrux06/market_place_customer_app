import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/order_provider.dart';

class TotalOrderCalculationsWidget extends ConsumerWidget {
  final double? coupon;
  final double? deliveryFee;
  final double? cashback;

  const TotalOrderCalculationsWidget({
    Key? key,
    this.coupon,
    this.deliveryFee,
    this.cashback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:
            isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
      ),
      padding: REdgeInsets.symmetric(horizontal: 15, vertical: 28),
      margin: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.totalProductPrice),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency().symbol,
                ).format(state.totalProductPrice),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          22.verticalSpace,
          Divider(
            height: 0.r,
            thickness: 0.r,
            color: AppColors.black.withOpacity(0.05),
          ),
          22.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.discount),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency().symbol,
                ).format(state.totalDiscount),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          22.verticalSpace,
          Divider(
            height: 0.r,
            thickness: 0.r,
            color: AppColors.black.withOpacity(0.05),
          ),
          22.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.totalProductTax),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency().symbol,
                ).format(state.totalProductsTax),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          22.verticalSpace,
          Divider(
            height: 0.r,
            thickness: 0.r,
            color: AppColors.black.withOpacity(0.05),
          ),
          22.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.totalShopTax),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency().symbol,
                ).format(state.totalShopsTax),
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          if (deliveryFee != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                22.verticalSpace,
                Divider(
                  height: 0.r,
                  thickness: 0.r,
                  color: AppColors.black.withOpacity(0.05),
                ),
                22.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.deliveryFee),
                      style: GoogleFonts.k2d(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.4,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        symbol:
                            LocalStorage.instance.getSelectedCurrency().symbol,
                      ).format(deliveryFee!),
                      style: GoogleFonts.k2d(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (coupon != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                22.verticalSpace,
                Divider(
                  height: 0.r,
                  thickness: 0.r,
                  color: AppColors.black.withOpacity(0.05),
                ),
                22.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.coupon),
                      style: GoogleFonts.k2d(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.4,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        symbol:
                            LocalStorage.instance.getSelectedCurrency().symbol,
                      ).format(coupon!),
                      style: GoogleFonts.k2d(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (cashback != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                22.verticalSpace,
                Divider(
                  height: 0.r,
                  thickness: 0.r,
                  color: AppColors.black.withOpacity(0.05),
                ),
                22.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.cashback),
                      style: GoogleFonts.k2d(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.4,
                        color: AppColors.red,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        symbol:
                            LocalStorage.instance.getSelectedCurrency().symbol,
                      ).format(cashback!),
                      style: GoogleFonts.k2d(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          45.verticalSpace,
          Divider(
            height: 0.r,
            thickness: 0.r,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          10.verticalSpace,
          Divider(
            height: 0.r,
            thickness: 0.r,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          31.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.totalAmount),
                style: GoogleFonts.k2d(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency().symbol,
                ).format(state.totalAmount + (deliveryFee ?? 0)),
                style: GoogleFonts.k2d(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
