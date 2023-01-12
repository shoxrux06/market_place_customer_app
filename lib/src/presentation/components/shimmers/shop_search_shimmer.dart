import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../components.dart';
import 'search_shop_list_shimmer.dart';

class ShopSearchShimmer extends StatelessWidget {
  const ShopSearchShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: ListView(
        physics: const CustomBouncingScrollPhysics(),
        children: [
          Container(
            height: 1.r,
            color: AppColors.mainBack,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                21.verticalSpace,
                Text(
                  AppHelpers.getTranslation(TrKeys.suggestions).toUpperCase(),
                  style: GoogleFonts.k2d(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                1.verticalSpace,
                const SearchLocationListShimmer(height: 47, borderRadius: 8),
                17.verticalSpace,
                Text(
                  AppHelpers.getTranslation(TrKeys.shops).toUpperCase(),
                  style: GoogleFonts.k2d(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                16.verticalSpace,
                const SearchShopListShimmer(height: 131),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
