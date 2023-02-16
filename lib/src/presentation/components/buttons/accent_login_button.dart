import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';

class AccentLoginButton extends StatefulWidget {
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
  State<AccentLoginButton> createState() => _AccentLoginButtonState();
}

class _AccentLoginButtonState extends State<AccentLoginButton> {
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
        backgroundColor: widget.background,
      ),
      onPressed: widget.onPressed,
      child: widget.isLoading
          ? SizedBox(
              width: 20.r,
              height: 20.r,
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 2.r,
              ),
            )
          : Text(
              widget.title,
              style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: widget.textColor,
                letterSpacing: -14 * 0.01,
              ),
            ),
    );
  }
}
