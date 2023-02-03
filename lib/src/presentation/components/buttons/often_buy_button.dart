import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';

class OftenBuyButton extends StatelessWidget {
  final String icAsset;
  final String title;
  final Function() onTap;

  const OftenBuyButton({
    Key? key,
    required this.icAsset,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r)
          ),
          alignment: Alignment.center,
          height: 32.r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   icAsset,
              //   width: 20.r,
              //   height: 20.r,
              // ),
              // 10.horizontalSpace,
              Text(
                title,
                style: GoogleFonts.k2d(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  letterSpacing: -14 * 0.01,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
