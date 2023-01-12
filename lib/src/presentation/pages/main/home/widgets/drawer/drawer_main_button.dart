import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../theme/theme.dart';

class DrawerMainButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function() onTap;

  const DrawerMainButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: AppColors.dontHaveAccBtnBack,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(horizontal: 15),
          height: 58.r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    color: AppColors.black,
                    size: 22.r,
                  ),
                  14.horizontalSpace,
                  Text(
                    title,
                    style: GoogleFonts.k2d(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -14 * 0.03,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                FlutterRemix.arrow_right_s_line,
                color: AppColors.arrowRight,
                size: 22.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
