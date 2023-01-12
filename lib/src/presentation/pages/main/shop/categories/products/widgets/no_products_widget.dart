import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../theme/theme.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          100.verticalSpace,
          Container(
            width: 142.r,
            height: 142.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.mainBack,
            ),
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.pngNoViewedProducts,
              width: 87.r,
              height: 60.r,
              fit: BoxFit.cover,
            ),
          ),
          14.verticalSpace,
          Text(
            AppHelpers.getTranslation(TrKeys.thereAreNoProductsInThisCategory),
            style: GoogleFonts.k2d(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: -14 * 0.02,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
