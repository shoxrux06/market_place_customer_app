import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/constants.dart';
import '../../core/routes/app_router.gr.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../pages/main/home/widgets/w_product_searched_item.dart';
import '../theme/theme.dart';
import 'list_items/search_suggestion_item.dart';
import 'physics/bouncing_physics.dart';
import 'shimmers/product_search_shimmer.dart';

class ProductSearchBody extends StatelessWidget {
  final bool isSearchLoading;
  final String query;
  final List<ProductData> searchedProducts;

  const ProductSearchBody({
    Key? key,
    required this.isSearchLoading,
    required this.searchedProducts,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return isSearchLoading
        ? const ProductSearchShimmer()
        : searchedProducts.isNotEmpty
            ? Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                child: ListView(
                  physics: const CustomBouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          21.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.suggestions)
                                .toUpperCase(),
                            style: GoogleFonts.k2d(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                          1.verticalSpace,
                          ListView.builder(
                            physics: const CustomBouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: searchedProducts.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final product = searchedProducts[index];
                              final isLast =
                                  index == searchedProducts.length - 1;
                              return SearchSuggestionItem(
                                title: product.translation?.title ?? AppHelpers.getTranslation(TrKeys.noTitle),
                                isLast: isLast,
                                query: query,
                                onTap: () => context.pushRoute(
                                  ProductRoute(uuid: product.uuid ?? ''),
                                ),
                              );
                            },
                          ),
                          17.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.products)
                                .toUpperCase(),
                            style: GoogleFonts.k2d(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 260.r,
                      child: ListView.builder(
                        physics: const CustomBouncingScrollPhysics(),
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: searchedProducts.length,
                        itemBuilder: (context, index) {
                          final product = searchedProducts[index];
                          return WProductSearchedItem(
                            product: product,
                            onTap: () => context.pushRoute(
                              ProductRoute(uuid: product.uuid ?? ''),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 168.r,
                      height: 168.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: isDarkMode
                            ? AppColors.mainBackDark
                            : AppColors.mainBack,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppAssets.pngNoSearchResult,
                        width: 79.r,
                        height: 144.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    14.verticalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.noSearchResults),
                      style: GoogleFonts.k2d(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -14 * 0.02,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ],
                ),
              );
  }
}
