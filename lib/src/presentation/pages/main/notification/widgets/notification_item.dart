import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../../../../theme/theme.dart';

class NotificationItem extends StatelessWidget {
  final BlogData notification;

  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:
            isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
      ),
      padding: REdgeInsets.symmetric(horizontal: 15, vertical: 18),
      margin: REdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${notification.translation?.title}',
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  letterSpacing: -0.4,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              10.horizontalSpace,
              Text(
                '${notification.publishedAt}',
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  letterSpacing: -0.4,
                  color: isDarkMode
                      ? AppColors.white.withOpacity(0.5)
                      : AppColors.notificationTime,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
