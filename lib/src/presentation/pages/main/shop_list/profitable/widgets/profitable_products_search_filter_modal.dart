import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/profitable_products_provider.dart';

class ProfitableProductsSearchFilterModal extends ConsumerWidget {
  const ProfitableProductsSearchFilterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profitableProductsProvider);
    final notifier = ref.read(profitableProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          8.verticalSpace,
          Container(
            width: 49.r,
            height: 3.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(62.r),
              color: isDarkMode
                  ? AppColors.dragElementDark
                  : AppColors.dragElement,
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.filter).toUpperCase(),
                        style: GoogleFonts.k2d(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      ForgotTextButton(
                        title: AppHelpers.getTranslation(TrKeys.clearAll),
                        fontSize: 14.sp,
                        fontColor: isDarkMode
                            ? AppColors.dragElementDark
                            : AppColors.black,
                        onPressed: () => notifier.clearSearchFilters(),
                      ),
                    ],
                  ),
                  26.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: isDarkMode
                            ? AppColors.borderDark
                            : AppColors.newStoreDataBorder,
                        width: 1.r,
                      ),
                    ),
                    padding:
                        REdgeInsets.symmetric(horizontal: 15, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppHelpers.getTranslation(TrKeys.categories),
                              style: GoogleFonts.k2d(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                letterSpacing: -14 * 0.02,
                              ),
                            ),
                          ],
                        ),
                        24.verticalSpace,
                        state.isCategoriesLoading
                            ? const JumpingDots(radius: 5)
                            : Wrap(
                                spacing: 8.r,
                                runSpacing: 10.r,
                                children: state.categories
                                    .map(
                                      (category) => CategoryItemInModal(
                                        title: '${category.translation?.title}',
                                        isSelected:
                                            state.selectedSearchCategoryId ==
                                                category.id,
                                        onTap: () => notifier
                                            .setSelectedSearchCategoryId(
                                          category.id,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: isDarkMode
                            ? AppColors.borderDark
                            : AppColors.newStoreDataBorder,
                        width: 1.r,
                      ),
                    ),
                    padding:
                        REdgeInsets.symmetric(horizontal: 15, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppHelpers.getTranslation(TrKeys.brands),
                              style: GoogleFonts.k2d(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                letterSpacing: -14 * 0.02,
                              ),
                            ),
                          ],
                        ),
                        7.verticalSpace,
                        state.isBrandsLoading
                            ? const JumpingDots(radius: 5)
                            : ListView.builder(
                                itemCount: state.brands.length,
                                shrinkWrap: true,
                                physics: const CustomBouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final brand = state.brands[index];
                                  return BrandFilterItem(
                                    isSelected:
                                        state.selectedSearchBrandId == brand.id,
                                    brand: brand,
                                    isLast: state.brands.length - 1 == index,
                                    onTap: () => notifier
                                        .setSelectedSearchBrandId(brand.id),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  AccentLoginButton(
                    onPressed: () => context.popRoute(),
                    title: AppHelpers.getTranslation(TrKeys.apply),
                    textColor: isDarkMode ? AppColors.black : AppColors.white,
                    background: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
