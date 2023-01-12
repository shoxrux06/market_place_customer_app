import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';

class DrawerAddressButton extends StatelessWidget {
  final Function() onTap;

  const DrawerAddressButton({Key? key, required this.onTap}) : super(key: key);

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
          width: 1.sw - 90.r,
          height: 50.r,
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FlutterRemix.navigation_line,
                size: 20.r,
                color: AppColors.black,
              ),
              8.horizontalSpace,
              Expanded(
                child: Text(
                  LocalStorage.instance.getActiveAddressTitle(),
                  style: GoogleFonts.k2d(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    letterSpacing: -14 * 0.01,
                  ),
                ),
              ),
              11.horizontalSpace,
              Icon(
                FlutterRemix.arrow_down_s_line,
                size: 20.r,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
