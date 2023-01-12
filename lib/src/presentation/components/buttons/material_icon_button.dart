import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class MaterialIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;

  const MaterialIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(18.r),
      color: AppColors.iconButtonBack,
      child: InkWell(
        borderRadius: BorderRadius.circular(128.r),
        onTap: onPressed,
        child: Container(
          width: 36.r,
          height: 36.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(128.r),
          ),
          child: Icon(
            iconData,
            size: 18.r,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
