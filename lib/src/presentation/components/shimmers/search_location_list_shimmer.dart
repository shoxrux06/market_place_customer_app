import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../physics/bouncing_physics.dart';

class SearchLocationListShimmer extends StatelessWidget {
  final int height;
  final int spacing;
  final int borderRadius;

  const SearchLocationListShimmer({
    Key? key,
    this.height = 55,
    this.spacing = 1,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: const CustomBouncingScrollPhysics(),
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
                height: height.r,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.dontHaveAnAccBackDark
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(borderRadius.r),
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
