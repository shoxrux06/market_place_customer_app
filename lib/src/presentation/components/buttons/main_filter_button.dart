import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class MainFilterButton extends StatelessWidget {
  final Function() onTap;

  const MainFilterButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Container(
          height: 36.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(horizontal: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.svgIcShopFilter,
                    width: 16.r,
                    height: 16.r,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                  5.horizontalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.filter),
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      letterSpacing: -0.7,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                FlutterRemix.arrow_down_s_line,
                color: isDarkMode ? AppColors.white : AppColors.black,
                size: 20.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
