import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class MakeShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const MakeShimmer({
    Key? key,
    required this.child,
    this.isLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return isLoading
        ? Shimmer.fromColors(
            baseColor:
                isDarkMode ? AppColors.shimmerBaseDark : AppColors.shimmerBase,
            highlightColor: isDarkMode
                ? AppColors.shimmerHighlightDark
                : AppColors.shimmerHighlight,
            child: child,
          )
        : child;
  }
}
