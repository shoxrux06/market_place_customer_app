import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../physics/bouncing_physics.dart';
import 'make_shimmer.dart';

class ProductGridListShimmer extends StatelessWidget {
  final int itemCount;
  final int verticalPadding;

  const ProductGridListShimmer({
    Key? key,
    this.itemCount = 6,
    this.verticalPadding = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 168 / 272,
        mainAxisSpacing: 30.r,
        crossAxisSpacing: 9.r,
        crossAxisCount: 2,
      ),
      padding: REdgeInsets.symmetric(vertical: verticalPadding.r),
      physics: const CustomBouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return MakeShimmer(
          child: Container(
            width: 168.r,
            height: 272.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
