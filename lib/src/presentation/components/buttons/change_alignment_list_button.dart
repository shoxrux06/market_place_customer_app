import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class ChangeAlignmentListButton extends StatelessWidget {
  final ListAlignment alignment;
  final Function(ListAlignment alignment) onChange;

  const ChangeAlignmentListButton({
    Key? key,
    required this.alignment,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      height: 36.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
      ),
      padding: REdgeInsets.all(3),
      alignment: Alignment.center,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (alignment == ListAlignment.singleBig) {
                return;
              }
              onChange(ListAlignment.singleBig);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: alignment == ListAlignment.singleBig
                    ? isDarkMode
                        ? AppColors.dontHaveAnAccBackDark
                        : AppColors.white
                    : AppColors.transparent,
              ),
              alignment: Alignment.center,
              padding: REdgeInsets.symmetric(horizontal: 11),
              child: Container(
                width: 9.r,
                height: 17.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: alignment == ListAlignment.singleBig
                      ? isDarkMode
                          ? AppColors.white
                          : AppColors.black
                      : isDarkMode
                          ? AppColors.white.withOpacity(0.2)
                          : AppColors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (alignment == ListAlignment.horizontally) {
                return;
              }
              onChange(ListAlignment.horizontally);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: alignment == ListAlignment.horizontally
                    ? isDarkMode
                        ? AppColors.dontHaveAnAccBackDark
                        : AppColors.white
                    : AppColors.transparent,
              ),
              alignment: Alignment.center,
              padding: REdgeInsets.symmetric(horizontal: 11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 17.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: alignment == ListAlignment.horizontally
                          ? isDarkMode
                              ? AppColors.white
                              : AppColors.black
                          : isDarkMode
                              ? AppColors.white.withOpacity(0.2)
                              : AppColors.black.withOpacity(0.2),
                    ),
                  ),
                  4.verticalSpace,
                  Container(
                    width: 17.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: alignment == ListAlignment.horizontally
                          ? isDarkMode
                              ? AppColors.white
                              : AppColors.black
                          : isDarkMode
                              ? AppColors.white.withOpacity(0.2)
                              : AppColors.black.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (alignment == ListAlignment.vertically) {
                return;
              }
              onChange(ListAlignment.vertically);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: alignment == ListAlignment.vertically
                    ? isDarkMode
                        ? AppColors.dontHaveAnAccBackDark
                        : AppColors.white
                    : AppColors.transparent,
              ),
              alignment: Alignment.center,
              padding: REdgeInsets.symmetric(horizontal: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6.r,
                    height: 17.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: alignment == ListAlignment.vertically
                          ? isDarkMode
                              ? AppColors.white
                              : AppColors.black
                          : isDarkMode
                              ? AppColors.white.withOpacity(0.2)
                              : AppColors.black.withOpacity(0.2),
                    ),
                  ),
                  4.horizontalSpace,
                  Container(
                    width: 6.r,
                    height: 17.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: alignment == ListAlignment.vertically
                          ? isDarkMode
                              ? AppColors.white
                              : AppColors.black
                          : isDarkMode
                              ? AppColors.white.withOpacity(0.2)
                              : AppColors.black.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
