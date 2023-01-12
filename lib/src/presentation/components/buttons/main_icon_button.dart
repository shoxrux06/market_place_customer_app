import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class MainIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;
  final double? splashRadius;

  const MainIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    this.splashRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: splashRadius ?? 12.r,
      icon: Icon(
        iconData,
        color: AppColors.black,
        size: 24.r,
      ),
      onPressed: onPressed,
    );
  }
}
