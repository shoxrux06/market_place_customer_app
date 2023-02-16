import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/local_storage.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/app_colors.dart';

class VideoShimmer extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;

  const VideoShimmer({
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
      scrollDirection: Axis.horizontal,
      padding: REdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 15,left: index == 0?15:0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MakeShimmer(
                child: Container(
                  height: 250.r,
                  width: 201.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
                  ),
                ),
              ),
              10.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
