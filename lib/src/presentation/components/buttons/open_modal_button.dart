import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../riverpod/provider/app_provider.dart';
import '../../theme/theme.dart';

class OpenModalButton extends ConsumerWidget {
  final IconData iconData;
  final String title;
  final Function() onTap;

  const OpenModalButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: state.isDarkMode
          ? AppColors.dontHaveAnAccBackDark
          : AppColors.dontHaveAccBtnBack,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Container(
          height: 60.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(horizontal: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    color: state.isDarkMode ? AppColors.white : AppColors.black,
                    size: 20.r,
                  ),
                  10.horizontalSpace,
                  Text(
                    title,
                    style: GoogleFonts.k2d(
                      color:
                          state.isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -0.8,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Icon(
                state.isLtr
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
                color: state.isDarkMode ? AppColors.white : AppColors.black,
                size: 18.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
