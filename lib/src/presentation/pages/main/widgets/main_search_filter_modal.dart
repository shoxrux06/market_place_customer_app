import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../riverpod/provider/app_provider.dart';
import '../../../components/components.dart';
import '../../../theme/app_colors.dart';
import '../riverpod/provider/main_provider.dart';

class MainSearchFilterModal extends ConsumerWidget {
  const MainSearchFilterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);
    final appState = ref.watch(appProvider);
    final notifier = ref.read(mainProvider.notifier);
    return Directionality(
      textDirection: appState.isLtr ? TextDirection.ltr : TextDirection.rtl,
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
                color: appState.isDarkMode
                    ? AppColors.dragElementDark
                    : AppColors.dragElement,
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.filter)
                              .toUpperCase(),
                          style: GoogleFonts.k2d(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: appState.isDarkMode
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                        ForgotTextButton(
                          title: AppHelpers.getTranslation(TrKeys.clearAll),
                          fontSize: 14.sp,
                          fontColor: appState.isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                          onPressed: notifier.clearFilters,
                        ),
                      ],
                    ),
                    26.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: appState.isDarkMode
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
                                AppHelpers.getTranslation(TrKeys.categories),
                                style: GoogleFonts.k2d(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: appState.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -14 * 0.02,
                                ),
                              ),
                            ],
                          ),
                          24.verticalSpace,
                          state.isCategoriesLoading
                              ? JumpingDots(
                                  radius: 5,
                                  color: appState.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                )
                              : state.categories.isEmpty
                                  ? Center(
                                      child: Text(
                                        AppHelpers.getTranslation(
                                            TrKeys.noCategories),
                                        style: GoogleFonts.k2d(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -14 * 0.02,
                                          color: appState.isDarkMode
                                              ? AppColors.white
                                              : AppColors.black,
                                        ),
                                      ),
                                    )
                                  : Wrap(
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
                    ),
                    16.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: appState.isDarkMode
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.brands),
                                style: GoogleFonts.k2d(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: appState.isDarkMode
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
                                  color: appState.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                )
                              : ListView.builder(
                                  itemCount: state.brands.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final brand = state.brands[index];
                                    return BrandFilterItem(
                                      isSelected:
                                          state.selectedBrandId == brand.id,
                                      brand: brand,
                                      isLast: state.brands.length - 1 == index,
                                      onTap: () =>
                                          notifier.setSelectedBrandId(brand.id),
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
                      textColor: appState.isDarkMode
                          ? AppColors.black
                          : AppColors.white,
                      background: appState.isDarkMode
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
