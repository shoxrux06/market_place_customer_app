import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/shop/categories/widgets/category_item.dart';
import 'package:g_customer/src/presentation/pages/main/shop/categories/widgets/category_sub_item.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/categories_provider.dart';
import 'widgets/search_filter_modal_in_categories.dart';
import 'widgets/tab_bar_view_categories.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(categoriesProvider.notifier).fetchCategories(context);
        ref.read(categoriesProvider.notifier).fetchBrands(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoriesProvider);
    final notifier = ref.read(categoriesProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            1.verticalSpace,
            SearchTextField(
              hintText: AppHelpers.getTranslation(TrKeys.searchProducts),
              onChanged: (value) => notifier.setQuery(context, value),
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
                    modal: const SearchFilterModalInCategories(),
                    isDarkMode: isDarkMode,
                  );
                },
              ),
            ),
            1.verticalSpace,
            Expanded(
              child: state.isSearching
                  ? ProductSearchBody(
                      isSearchLoading: state.isSearchLoading,
                      searchedProducts: state.searchedProducts,
                      query: state.query.trim(),
                    )
                  : state.isLoading
                      ? JumpingDots(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        )
                      : state.categories.isNotEmpty
                          ? CategoryItem(categories: state.categories)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 142.r,
                                  height: 142.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: isDarkMode
                                        ? AppColors.mainBackDark
                                        : AppColors.white,
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
                                  '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.categories).toLowerCase()}',
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
            )
          ],
        ),
      ),
    );
  }
}
