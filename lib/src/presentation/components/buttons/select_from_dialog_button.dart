import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class SelectFromDialogButton extends StatelessWidget {
  final IconData prefixIcon;
  final String title;
  final String text;
  final Function() onTap;

  const SelectFromDialogButton({
    Key? key,
    required this.prefixIcon,
    required this.title,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      prefixIcon,
                      size: 20.r,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              letterSpacing: -14 * 0.01,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            text,
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              letterSpacing: -14 * 0.01,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.selectedTextFromModal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isLtr
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
                size: 20.r,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
