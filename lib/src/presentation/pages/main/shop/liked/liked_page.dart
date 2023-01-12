import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/liked_provider.dart';
import 'widgets/liked_products_body.dart';
import 'widgets/liked_products_filter_modal.dart';
import 'widgets/liked_products_search_filter_modal.dart';

class LikedPage extends ConsumerWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(likedProvider);
    final notifier = ref.read(likedProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          body: Column(
            children: [
              Container(
                height: 1.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              SearchTextField(
                onChanged: (value) => notifier.setQuery(context, value),
                hintText: AppHelpers.getTranslation(TrKeys.searchProducts),
                suffixIcon: IconButton(
                  splashRadius: 10,
                  icon: Icon(
                    FlutterRemix.equalizer_line,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    size: 18.r,
                  ),
                  onPressed: () {
                    AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      modal: const LikedProductsSearchFilterModal(),
                      isDarkMode: isDarkMode,
                    );
                  },
                ),
              ),
              Divider(
                height: 0.r,
                thickness: 1.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              Container(
                height: 54.r,
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                padding: REdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 9,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MainFilterButton(
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const LikedProductsFilterModal(),
                            isDarkMode: isDarkMode,
                          );
                        },
                      ),
                    ),
                    10.horizontalSpace,
                    ChangeAlignmentListButton(
                      alignment: state.listAlignment,
                      onChange: notifier.setListAlignment,
                    ),
                  ],
                ),
              ),
              Container(
                height: 16.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              Expanded(
                child: state.isSearching
                    ? ProductSearchBody(
                        isSearchLoading: state.isSearchLoading,
                        searchedProducts: state.searchedProducts,
                        query: state.query.trim(),
                      )
                    : Padding(
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        child: state.isLikedProductsLoading
                            ? const ProductGridListShimmer()
                            : state.likedProducts.isNotEmpty
                                ? const LikedProductsBody()
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 142.r,
                                        height: 142.r,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: isDarkMode
                                              ? AppColors.mainBackDark
                                              : AppColors.mainBack,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          AppAssets.pngNoViewedProducts,
                                          width: 87.r,
                                          height: 60.r,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      14.verticalSpace,
                                      Text(
                                        '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.likedProducts).toLowerCase()}',
                                        style: GoogleFonts.k2d(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -14 * 0.02,
                                          color: isDarkMode
                                              ? AppColors.white
                                              : AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
