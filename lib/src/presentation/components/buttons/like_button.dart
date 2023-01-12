import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';

class LikeButton extends StatelessWidget {
  final int? likeCount;
  final bool isLiking;
  final Function() onTap;

  const LikeButton({
    Key? key,
    this.likeCount,
    required this.onTap,
    required this.isLiking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLiking ? null : onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(61.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(61.r),
              color: AppColors.white.withOpacity(0.19),
            ),
            alignment: Alignment.center,
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 9),
            child: isLiking
                ? Center(
                    child: SizedBox(
                      width: 20.r,
                      height: 20.r,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.r,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FlutterRemix.thumb_up_line,
                        size: 20.r,
                        color: AppColors.white,
                      ),
                      9.horizontalSpace,
                      Text(
                        '$likeCount',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: AppColors.white,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
