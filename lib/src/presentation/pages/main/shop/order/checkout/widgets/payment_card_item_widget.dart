import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../theme/theme.dart';

class PaymentCardItemWidget extends StatelessWidget {
  final bool isSelected;
  final PaymentData payment;
  final Function() onTap;

  const PaymentCardItemWidget({
    Key? key,
    this.isSelected = false,
    required this.payment,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(8.r),
          color: isDarkMode
              ? AppColors.mainBackDark
              : AppColors.notDoneOrderStatus,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            onTap: onTap,
            child: Container(
              height: 74.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20.r,
                        width: 20.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: isSelected
                              ? AppColors.white
                              : AppColors.transparent,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.accentGreen
                                : isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                            width: isSelected ? 6.r : 2.r,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        '${payment.tag}',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                    ],
                  ),
                  if (payment.tag == 'wallet')
                    Text(
                      NumberFormat.currency(
                        symbol: LocalStorage.instance
                            .getSelectedCurrency()
                            .symbol,
                      ).format(
                        LocalStorage.instance.getWalletData()?.price,
                      ),
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                        letterSpacing: -14 * 0.01,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        13.verticalSpace,
      ],
    );
  }
}
