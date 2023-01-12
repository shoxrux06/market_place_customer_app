import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../theme/theme.dart';

class WFlavorButton extends StatelessWidget {
  final String title;
  final Color background;
  final TextStyle? titleStyle;
  final Function() onTap;

  const WFlavorButton({
    Key? key,
    required this.title,
    this.background = AppColors.white,
    this.titleStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: background,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: Container(
          height: 64.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: REdgeInsets.all(12),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        GoogleFonts.k2d(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                  ),
                ],
              ),
              Icon(
                isLtr
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
                color: isDarkMode ? AppColors.white : AppColors.black,
                size: 24.r,
              )
            ],
          ),
        ),
      ),
    );
  }
}
