import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../theme/theme.dart';

class CurrencyItemWidget extends StatelessWidget {
  final bool isLast;
  final CurrencyData currency;
  final Function() onTap;

  const CurrencyItemWidget({
    Key? key,
    this.isLast = false,
    required this.currency,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              height: 56.r,
              child: Row(
                children: [
                  Container(
                    height: 20.r,
                    width: 20.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: LocalStorage.instance.getSelectedCurrency().id ==
                              currency.id
                          ? AppColors.white
                          : AppColors.transparent,
                      border: Border.all(
                        color: LocalStorage.instance.getSelectedCurrency().id ==
                                currency.id
                            ? AppColors.accentGreen
                            : AppColors.borderRadio,
                        width: LocalStorage.instance.getSelectedCurrency().id ==
                                currency.id
                            ? 6.r
                            : 2.r,
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${currency.title} - (${currency.symbol})',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isLast)
          Divider(
            height: 0.r,
            thickness: 1.r,
            color: isDarkMode
                ? AppColors.borderDark
                : AppColors.black.withOpacity(0.05),
          ),
      ],
    );
  }
}
