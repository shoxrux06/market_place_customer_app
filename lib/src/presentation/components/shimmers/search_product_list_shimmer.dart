import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../physics/bouncing_physics.dart';

class SearchProductListShimmer extends StatelessWidget {
  final int width;
  final int height;
  final int spacing;
  final int horizontalPadding;

  const SearchProductListShimmer({
    Key? key,
    this.width = 228,
    this.height = 260,
    this.spacing = 9,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return SizedBox(
      height: height.r,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        physics: const CustomBouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: horizontalPadding.r),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Shimmer.fromColors(
                baseColor: isDarkMode
                    ? AppColors.shimmerBaseDark
                    : AppColors.shimmerBase,
                highlightColor: isDarkMode
                    ? AppColors.shimmerHighlightDark
                    : AppColors.shimmerHighlight,
                child: Container(
                  width: width.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: isDarkMode
                        ? AppColors.dontHaveAnAccBackDark
                        : AppColors.white,
                  ),
                ),
              ),
              spacing.horizontalSpace,
            ],
          );
        },
      ),
    );
  }
}
