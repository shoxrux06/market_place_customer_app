import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';

class ShopAcceptedBody extends StatelessWidget {
  const ShopAcceptedBody({Key? key}) : super(key: key);

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
              color: AppColors.accentGreen.withOpacity(0.1),
            ),
            alignment: Alignment.center,
            child: Icon(
              FlutterRemix.check_double_fill,
              size: 50.r,
              color: AppColors.accentGreen,
            ),
          ),
          14.verticalSpace,
          Text(
            AppHelpers.getTranslation(TrKeys.shopAccepted).toUpperCase(),
            style: GoogleFonts.k2d(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: -14 * 0.02,
              color: AppColors.white,
            ),
          ),
          24.verticalSpace,
          Material(
            color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () async {
                if (!await launchUrl(
                  Uri.parse(AppConstants.adminPageUrl),
                )) {
                  throw 'Could not launch';
                }
              },
              child: Container(
                height: 46.r,
                width: 168.r,
                alignment: Alignment.center,
                child: Text(
                  AppHelpers.getTranslation(TrKeys.goToAdmin),
                  style: GoogleFonts.k2d(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -14 * 0.01,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
