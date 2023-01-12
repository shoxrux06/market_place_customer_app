import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final String label;
  final Function() onTap;

  const BottomNavigationBarButton({
    Key? key,
    required this.iconData,
    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: isSelected
          ? isDarkMode
              ? AppColors.white
              : AppColors.black
          : isDarkMode
              ? AppColors.dontHaveAnAccBackDark
              : AppColors.unselectedBottomBarBack,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: Container(
          height: 36.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: REdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 20.r,
                color: isSelected
                    ? isDarkMode
                        ? AppColors.black
                        : AppColors.white
                    : AppColors.unselectedBottomBarItem,
              ),
              10.horizontalSpace,
              Text(
                label.toUpperCase(),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  letterSpacing: -0.5,
                  color: isSelected
                      ? isDarkMode
                          ? AppColors.black
                          : AppColors.white
                      : AppColors.unselectedBottomBarItem,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
