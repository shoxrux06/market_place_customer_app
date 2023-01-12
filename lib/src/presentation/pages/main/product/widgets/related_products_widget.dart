import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../riverpod/provider/product_provider.dart';

class RelatedProductsWidget extends ConsumerWidget {
  const RelatedProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: Text(
              AppHelpers.getTranslation(TrKeys.relatedProducts),
              style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
                letterSpacing: -14 * 0.02,
              ),
            ),
          ),
          20.verticalSpace,
          state.isRelatedProductsLoading
              ? const SearchProductListShimmer(
                  height: 320,
                  horizontalPadding: 15,
                )
              : state.relatedProducts.isNotEmpty
                  ? SizedBox(
                      height: 320.r,
                      child: ListView.builder(
                        physics: const CustomBouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.relatedProducts.length,
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          final product = state.relatedProducts[index];
                          return ProductItemWidget(
                            product: product,
                            onLikePressed: () =>
                                notifier.likeOrUnlikeProduct(product.id),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 110.r,
                            height: 110.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: isDarkMode
                                  ? AppColors.mainBackDark
                                  : AppColors.mainBack,
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppAssets.pngNoViewedProducts,
                              width: 77.r,
                              height: 50.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                          14.verticalSpace,
                          Text(
                            '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.relatedProducts).toLowerCase()}',
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
          20.verticalSpace,
        ],
      ),
    );
  }
}
