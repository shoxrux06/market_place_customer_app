import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';

class AccentLoginButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function()? onPressed;
  final Color background;
  final Color textColor;

  const AccentLoginButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.background = AppColors.black,
    this.textColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        minimumSize: Size.fromHeight(46.r),
        backgroundColor: background,
      ),
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: 20.r,
              height: 20.r,
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 2.r,
              ),
            )
          : Text(
              title,
              style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: textColor,
                letterSpacing: -14 * 0.01,
              ),
            ),
    );
  }
}
