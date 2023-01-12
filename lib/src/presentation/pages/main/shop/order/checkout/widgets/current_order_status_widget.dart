import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../theme/theme.dart';

class CurrentOrderStatusWidget extends StatelessWidget {
  final String title;
  final bool isDone;
  final bool isActive;
  final IconData iconData;

  const CurrentOrderStatusWidget({
    Key? key,
    required this.title,
    required this.isDone,
    required this.isActive,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.r,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 5.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: (isDone || isActive)
                        ? AppColors.accentGreen
                        : AppColors.notDoneOrderStatus,
                  ),
                ),
                isActive
                    ? Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.accentGreen,
                            width: 3.r,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          iconData,
                          size: 20.r,
                          color: AppColors.black,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          4.verticalSpace,
          Text(
            title,
            style: GoogleFonts.k2d(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.6,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
