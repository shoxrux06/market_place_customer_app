import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class RadioButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;

  const RadioButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 15.r,
            height: 15.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.white,
              border: Border.all(
                color: isSelected
                    ? AppColors.accentGreen
                    : AppColors.unselectedTab,
                width: isSelected ? 4.r : 2.r,
              ),
            ),
          ),
          6.horizontalSpace,
          Text(
            text,
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
      ),
    );
  }
}
