import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class OrdersShimmer extends StatelessWidget {
  final int itemCount;
  final int itemHeight;
  final int paddingVertical;

  const OrdersShimmer({
    Key? key,
    this.itemCount = 15,
    this.itemHeight = 161,
    this.paddingVertical = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      primary: false,
      padding: REdgeInsets.symmetric(vertical: paddingVertical.r),
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Shimmer.fromColors(
              baseColor: isDarkMode
                  ? AppColors.shimmerBaseDark
                  : AppColors.shimmerBase,
              highlightColor: isDarkMode
                  ? AppColors.shimmerHighlightDark
                  : AppColors.shimmerHighlight,
              child: Container(
                height: itemHeight.r,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.dontHaveAnAccBackDark
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            10.verticalSpace,
          ],
        );
      },
    );
  }
}
