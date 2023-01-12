import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../../riverpod/provider/app_provider.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import '../home/widgets/w_product_searched_item.dart';
import '../home/widgets/w_suggestion_item.dart';
import '../riverpod/provider/main_provider.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);
    final appState = ref.watch(appProvider);
    return state.isSearchLoading
        ? const ProductSearchShimmer()
        : state.searchedProducts.isNotEmpty
            ? Container(
                color: appState.isDarkMode
                    ? AppColors.mainBackDark
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
                              color: appState.isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                          1.verticalSpace,
                          ListView.builder(
                            physics: const CustomBouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.searchedProducts.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final product = state.searchedProducts[index];
                              final isLast =
                                  index == state.searchedProducts.length - 1;
                              return WSuggestionItem(
                                product: product,
                                isLast: isLast,
                                query: state.query.trim(),
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
                              color: appState.isDarkMode
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
                        itemCount: state.searchedProducts.length,
                        itemBuilder: (context, index) {
                          final product = state.searchedProducts[index];
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
                        color: appState.isDarkMode
                            ? AppColors.dontHaveAnAccBackDark
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
                        color: appState.isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ],
                ),
              );
  }
}
