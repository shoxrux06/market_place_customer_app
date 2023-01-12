import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/order_details_provider.dart';

class OrderShopTotalsWidget extends ConsumerWidget {
  const OrderShopTotalsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderDetailsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:
            isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
      ),
      padding: REdgeInsets.symmetric(horizontal: 15, vertical: 28),
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
            color: isDarkMode
                ? AppColors.borderDark
                : AppColors.black.withOpacity(0.05),
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
                '${LocalStorage.instance.getSelectedCurrency().symbol}${state.discount.toStringAsFixed(2)}',
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
            color: isDarkMode
                ? AppColors.borderDark
                : AppColors.black.withOpacity(0.05),
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
                ).format(state.totalProductTax),
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
            color: isDarkMode
                ? AppColors.borderDark
                : AppColors.black.withOpacity(0.05),
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
                '${LocalStorage.instance.getSelectedCurrency().symbol}${state.totalShopTax.toStringAsFixed(2)}',
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
            color: isDarkMode
                ? AppColors.borderDark
                : AppColors.black.withOpacity(0.05),
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
                '${LocalStorage.instance.getSelectedCurrency().symbol}${state.coupon.toStringAsFixed(2)}',
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
            color: isDarkMode
                ? AppColors.borderDark
                : AppColors.black.withOpacity(0.05),
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
                '${LocalStorage.instance.getSelectedCurrency().symbol}${state.deliveryFee.toStringAsFixed(2)}',
                style: GoogleFonts.k2d(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          45.verticalSpace,
          Divider(
            height: 0.r,
            thickness: 1.r,
            color: isDarkMode ? AppColors.borderDark : AppColors.black,
          ),
          10.verticalSpace,
          Divider(
            height: 0.r,
            thickness: 1.r,
            color: isDarkMode ? AppColors.borderDark : AppColors.black,
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
                ).format(state.totalAmount),
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
