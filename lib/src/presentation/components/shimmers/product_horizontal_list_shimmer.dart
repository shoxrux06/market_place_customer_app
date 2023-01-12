import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class ProductHorizontalListShimmer extends StatelessWidget {
  final int height;
  final int spacing;
  final int verticalPadding;
  final int horizontalPadding;
  final int itemCount;

  const ProductHorizontalListShimmer({
    Key? key,
    this.height = 154,
    this.spacing = 24,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.itemCount = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      primary: false,
      padding: REdgeInsets.symmetric(
        vertical: verticalPadding.r,
        horizontal: horizontalPadding.r,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: isDarkMode
                  ? AppColors.shimmerBaseDark
                  : AppColors.shimmerBase,
              highlightColor: isDarkMode
                  ? AppColors.shimmerHighlightDark
                  : AppColors.shimmerHighlight,
              child: Container(
                height: height.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.white,
                ),
              ),
            ),
            spacing.verticalSpace,
          ],
        );
      },
    );
  }
}
