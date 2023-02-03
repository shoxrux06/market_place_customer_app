import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/often_buy_products_provider.dart';
import 'widgets/often_buy_products_body.dart';
import 'widgets/often_buy_products_filter_modal.dart';
import 'widgets/often_buy_products_search_filter_modal.dart';

class OftenBuyProductsPage extends ConsumerStatefulWidget {
  const OftenBuyProductsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OftenBuyProductsPage> createState() =>
      _OftenBuyProductsPageState();
}

class _OftenBuyProductsPageState extends ConsumerState<OftenBuyProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(oftenBuyProductsProvider.notifier).fetchProducts(context);
        ref.read(oftenBuyProductsProvider.notifier).fetchCategories(context);
        ref.read(oftenBuyProductsProvider.notifier).fetchBrands(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(oftenBuyProductsProvider);
    final notifier = ref.read(oftenBuyProductsProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: CommonAppBar(
          onLeadingPressed: () => context.popRoute(),
          title: AppHelpers.getTranslation(TrKeys.famousText),
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
                    modal: const OftenBuyProductsSearchFilterModal(),
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
                    child: Material(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.mainBack,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.r),
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const OftenBuyProductsFilterModal(),
                            isDarkMode: isDarkMode,
                          );
                        },
                        child: Container(
                          height: 36.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          alignment: Alignment.center,
                          padding: REdgeInsets.symmetric(horizontal: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.svgIcShopFilter,
                                    width: 16.r,
                                    height: 16.r,
                                    color: AppColors.black,
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    AppHelpers.getTranslation(TrKeys.filter),
                                    style: GoogleFonts.k2d(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: -0.7,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                FlutterRemix.arrow_down_s_line,
                                color: AppColors.black,
                                size: 20.r,
                              ),
                            ],
                          ),
                        ),
                      ),
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
                              ? const OftenBuyProductsBody()
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
                                      '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.mostSoldProducts).toLowerCase()}',
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
    );
  }
}
