import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class SignUpInButton extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Function() onPressed;

  const SignUpInButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => isDarkMode
              ? AppColors.mainBackDark
              : AppColors.dontHaveAccBtnBack,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title.length > 21 ? '${title.substring(0, 19)}...' : title,
        style: GoogleFonts.k2d(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
          fontSize: fontSize ?? 15.sp,
          color: isDarkMode ? AppColors.white : AppColors.black,
          letterSpacing: -14 * 0.01,
        ),
      ),
    );
  }
}
