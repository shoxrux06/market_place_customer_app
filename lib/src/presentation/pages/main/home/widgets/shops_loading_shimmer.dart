import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';

class ShopsLoadingShimmer extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;

  const ShopsLoadingShimmer({
    Key? key,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ListView.builder(
      itemCount: 15,
      primary: false,
      shrinkWrap: true,
      padding: REdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MakeShimmer(
              child: Container(
                height: 131.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
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
