import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/discount_products_provider.dart';
import 'widgets/discount_products_body.dart';
import 'widgets/discount_products_filter_modal.dart';
import 'widgets/discount_products_search_filter_modal.dart';

class DiscountProductsPage extends ConsumerStatefulWidget {
  const DiscountProductsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DiscountProductsPage> createState() =>
      _DiscountProductsPageState();
}

class _DiscountProductsPageState extends ConsumerState<DiscountProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(discountProductsProvider.notifier).fetchProducts(context);
        ref.read(discountProductsProvider.notifier).fetchCategories(context);
        ref.read(discountProductsProvider.notifier).fetchBrands(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(discountProductsProvider);
    final notifier = ref.read(discountProductsProvider.notifier);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: CommonAppBar(
            onLeadingPressed: context.popRoute,
            title: AppHelpers.getTranslation(TrKeys.discountProducts),
          ),
          body: Column(
            children: [
              Container(
                height: 1.r,
                color: isDarkMode
                    ? AppColors.white.withOpacity(0.5)
                    : AppColors.mainBack,
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
                      modal: const DiscountProductsSearchFilterModal(),
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
                padding: REdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MainFilterButton(
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const DiscountProductsFilterModal(),
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
                        child: state.isLoading
                            ? state.listAlignment == ListAlignment.vertically
                                ? const ProductGridListShimmer(
                                    itemCount: 14,
                                    verticalPadding: 20,
                                  )
                                : state.listAlignment ==
                                        ListAlignment.horizontally
                                    ? const ProductHorizontalListShimmer(
                                        itemCount: 14,
                                        verticalPadding: 20,
                                      )
                                    : const ProductHorizontalListShimmer(
                                        height: 412,
                                        itemCount: 14,
                                        verticalPadding: 20,
                                      )
                            : state.products.isNotEmpty
                                ? const DiscountProductsBody()
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      170.verticalSpace,
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
                                        '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.discountProducts).toLowerCase()}',
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
