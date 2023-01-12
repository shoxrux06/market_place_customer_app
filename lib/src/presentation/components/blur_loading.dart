import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/utils.dart';
import '../theme/theme.dart';

class BlurLoadingWidget extends StatelessWidget {
  final bool isLoading;

  const BlurLoadingWidget({Key? key, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return isLoading
        ? BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark.withOpacity(0.5)
                    : AppColors.white.withOpacity(0.5),
              ),
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  strokeWidth: 2.r,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
