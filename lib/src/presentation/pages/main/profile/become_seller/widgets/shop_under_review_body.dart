import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';

class ShopUnderReviewBody extends StatelessWidget {
  const ShopUnderReviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.r,
            height: 100.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: AppColors.rate.withOpacity(0.1),
            ),
            alignment: Alignment.center,
            child: Icon(
              FlutterRemix.time_fill,
              size: 50.r,
              color: AppColors.rate,
            ),
          ),
          14.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 52),
            child: Text(
              AppHelpers.getTranslation(TrKeys.theShopIsCurrentlyUnderReview)
                  .toUpperCase(),
              style: GoogleFonts.k2d(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -14 * 0.02,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
