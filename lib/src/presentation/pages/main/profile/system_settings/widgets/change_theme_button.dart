import 'package:flutter/cupertino.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';

class ChangeThemeButton extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool? value) onToggle;

  const ChangeThemeButton({
    Key? key,
    required this.isDarkMode,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isDarkMode
            ? AppColors.dontHaveAnAccBackDark
            : AppColors.dontHaveAccBtnBack,
      ),
      alignment: Alignment.center,
      padding: REdgeInsets.symmetric(horizontal: 20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isDarkMode ? FlutterRemix.moon_fill : FlutterRemix.sun_fill,
                color: isDarkMode ? AppColors.white : AppColors.black,
                size: 20.r,
              ),
              10.horizontalSpace,
              Text(
                AppHelpers.getTranslation(TrKeys.theme),
                style: GoogleFonts.k2d(
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -0.8,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          CupertinoSwitch(
            activeColor: AppColors.black,
            value: isDarkMode,
            onChanged: (value) => onToggle(value),
          ),
        ],
      ),
    );
  }
}
