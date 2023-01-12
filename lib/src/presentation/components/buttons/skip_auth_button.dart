import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class SkipAuthButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const SkipAuthButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: GoogleFonts.k2d(
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          letterSpacing: -1,
          color: isDarkMode ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
