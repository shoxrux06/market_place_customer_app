import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';

class MyLocationButton extends StatelessWidget {
  final Function() onTap;

  const MyLocationButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: AppColors.black,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Container(
          width: 53.r,
          height: 53.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.center,
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              FlutterRemix.navigation_fill,
              size: 20.r,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
