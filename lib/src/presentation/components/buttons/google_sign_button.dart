import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../custom_progress_indicator.dart';

class GoogleSignButton extends StatelessWidget {
  final bool isLoading;
  final Function() onPressed;

  const GoogleSignButton({
    Key? key,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        fixedSize: Size.fromHeight(46.r),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FlutterRemix.google_fill,
            color: isDarkMode ? AppColors.white : AppColors.black,
            size: 20.r,
          ),
          6.horizontalSpace,
          isLoading
              ? Expanded(
                  child: JumpingDots(
                    radius: 5,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                )
              : Expanded(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.continueWithGoogle),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
