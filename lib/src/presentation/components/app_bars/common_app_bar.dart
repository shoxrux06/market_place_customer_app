import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class CommonAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final bool hasBack;
  final Function() onLeadingPressed;

  const CommonAppBar({
    Key? key,
    required this.title,
    required this.onLeadingPressed,
    this.hasBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return AppBar(
      backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      elevation: 0,
      leading: hasBack
          ? IconButton(
              splashRadius: 18.r,
              onPressed: onLeadingPressed,
              icon: Icon(
                isLtr
                    ? FlutterRemix.arrow_left_s_line
                    : FlutterRemix.arrow_right_s_line,
                size: 24.r,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            )
          : const SizedBox(),
      title: Text(
        title.toUpperCase(),
        style: GoogleFonts.k2d(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.7,
          color: isDarkMode ? AppColors.white : AppColors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget get child => const Text('Common appbar');

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
