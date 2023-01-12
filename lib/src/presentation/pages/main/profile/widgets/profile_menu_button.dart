import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../theme/theme.dart';

class ProfileMenuButton extends ConsumerWidget {
  final IconData iconData;
  final String title;
  final Function() onTap;
  final bool isLast;
  final Widget? widget;

  const ProfileMenuButton(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTap,
      this.isLast = false,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 62.r,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      iconData,
                      size: 22.r,
                      color:
                          state.isDarkMode ? AppColors.white : AppColors.black,
                    ),
                    14.horizontalSpace,
                    Text(
                      title,
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        letterSpacing: -14 * 0.03,
                        color: state.isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    widget ?? const SizedBox(),
                    Icon(
                      state.isLtr
                          ? FlutterRemix.arrow_right_s_line
                          : FlutterRemix.arrow_left_s_line,
                      size: 22.r,
                      color: state.isDarkMode
                          ? AppColors.white
                          : AppColors.arrowRightProfileButton,
                    ),
                  ],
                )
              ],
            ),
          ),
          if (!isLast)
            Divider(
              height: 0.r,
              thickness: 1.r,
              color: state.isDarkMode
                  ? AppColors.white.withOpacity(0.06)
                  : AppColors.black.withOpacity(0.05),
            ),
        ],
      ),
    );
  }
}
