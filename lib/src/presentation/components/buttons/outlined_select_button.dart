import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class OutlinedSelectButton extends StatelessWidget {
  final String label;
  final String text;
  final IconData trailingIconData;
  final Function() onPressed;

  const OutlinedSelectButton({
    Key? key,
    required this.label,
    required this.text,
    required this.trailingIconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(58.r),
        padding: REdgeInsets.symmetric(horizontal: 15),
        backgroundColor: isDarkMode
            ? AppColors.dontHaveAnAccBackDark
            : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(
            color: isDarkMode
                ? AppColors.borderDark
                : AppColors.outlineButtonBorder,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -14 * 0.01,
                ),
              ),
              5.verticalSpace,
              Text(
                text,
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -14 * 0.01,
                ),
              ),
            ],
          ),
          Icon(
            trailingIconData,
            color: isDarkMode ? AppColors.white : AppColors.black,
            size: 20.r,
          ),
        ],
      ),
    );
  }
}
