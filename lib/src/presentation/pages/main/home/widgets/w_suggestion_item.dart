import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../../../../theme/theme.dart';

class WSuggestionItem extends StatelessWidget {
  final ProductData product;
  final bool isLast;
  final String query;
  final Function() onTap;

  const WSuggestionItem({
    Key? key,
    required this.product,
    required this.isLast,
    required this.onTap,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalSpace,
            AppHelpers.getSearchResultText(
              product.translation?.title ??
                  AppHelpers.getTranslation(TrKeys.noTitle),
              query,
            ),
            15.verticalSpace,
            if (!isLast)
              Container(
                color: AppColors.black.withOpacity(0.06),
                width: 1.sw,
                height: 1.r,
              ),
          ],
        ),
      ),
    );
  }
}
