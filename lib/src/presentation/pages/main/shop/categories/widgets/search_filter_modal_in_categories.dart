import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/categories_provider.dart';

class SearchFilterModalInCategories extends ConsumerWidget {
  const SearchFilterModalInCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoriesProvider);
    final notifier = ref.read(categoriesProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
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
                physics: const CustomBouncingScrollPhysics(),
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
                          fontColor:
                              isDarkMode ? AppColors.white : AppColors.black,
                          onPressed: () => notifier.clearFilters(),
                        ),
                      ],
                    ),
                    26.verticalSpace,
                    state.isLoading
                        ? JumpingDots(
                            radius: 5,
                            color: isDarkMode ? AppColors.white : AppColors.black,
                          )
                        : state.categories.isNotEmpty
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: isDarkMode
                                        ? AppColors.white.withOpacity(0.06)
                                        : AppColors.newStoreDataBorder,
                                    width: 1.r,
                                  ),
                                ),
                                padding: REdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 18,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.categories),
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
                                    Wrap(
                                      spacing: 8.r,
                                      runSpacing: 10.r,
                                      children: state.categories
                                          .map(
                                            (category) => CategoryItemInModal(
                                              title:
                                                  '${category.translation?.title}',
                                              isSelected:
                                                  state.selectedCategoryId ==
                                                      category.id,
                                              onTap: () {
                                                notifier.setSelectedCategoryId(
                                                  category.id ?? 0,
                                                );
                                              },
                                            ),
                                          )
                                          .toList(),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox(),
                    16.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: isDarkMode
                              ? AppColors.white.withOpacity(0.06)
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
                              ? JumpingDots(
                                  radius: 5,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                )
                              : ListView.builder(
                                  itemCount: state.brands.length,
                                  shrinkWrap: true,
                                  physics: const CustomBouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final brand = state.brands[index];
                                    return BrandFilterItem(
                                      isSelected:
                                          state.selectedBrandId == brand.id,
                                      brand: brand,
                                      isLast: state.brands.length - 1 == index,
                                      onTap: () {
                                        notifier.setSelectedBrandId(brand.id);
                                      },
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    AccentLoginButton(
                      onPressed: context.popRoute,
                      title: AppHelpers.getTranslation(TrKeys.apply),
                      textColor: isDarkMode ? AppColors.black : AppColors.white,
                      background: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
