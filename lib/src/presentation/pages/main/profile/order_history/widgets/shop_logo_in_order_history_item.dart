import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';

class ShopLogoInOrderHistoryItem extends StatelessWidget {
  final String? imageUrl;
  final int positioningLeft;

  const ShopLogoInOrderHistoryItem({
    Key? key,
    this.imageUrl,
    required this.positioningLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: positioningLeft.r,
      child: Container(
        width: 44.r,
        height: 44.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: AppColors.mainBack,
            width: 3.r,
          ),
        ),
        alignment: Alignment.center,
        child: CommonImage(
          imageUrl: imageUrl,
          width: 44,
          height: 44,
          radius: 22,
        ),
      ),
    );
  }
}
