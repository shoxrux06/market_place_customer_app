import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';

class OrderHistoryTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int count;

  const OrderHistoryTab({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 22.r,
          decoration: BoxDecoration(
            color: isSelected
                ? isDarkMode
                    ? AppColors.mainBackDark
                    : AppColors.black
                : isDarkMode
                    ? AppColors.white.withOpacity(0.2)
                    : AppColors.mainBack,
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '$count',
            style: GoogleFonts.k2d(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              letterSpacing: -14 * 0.01,
              color: isSelected ? AppColors.white : AppColors.unselectedTab,
            ),
          ),
        ),
        6.horizontalSpace,
        Text(
          title,
          style: GoogleFonts.k2d(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            letterSpacing: -14 * 0.01,
            color: isSelected
                ? isDarkMode
                    ? AppColors.white
                    : AppColors.black
                : AppColors.unselectedTab,
          ),
        ),
      ],
    );
  }
}
