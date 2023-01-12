import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import '../profile/viewed_products/riverpod/provider/viewed_products_provider.dart';
import '../shop/details/riverpod/provider/shop_details_provider.dart';
import 'riverpod/provider/product_provider.dart';
import 'widgets/viewed_products_widget_in_product_details.dart';
import 'widgets/product_details_modal.dart';
import 'widgets/w_flavor_button.dart';
import 'widgets/w_images_product.dart';
import 'widgets/w_product_extras.dart';
import 'widgets/related_products_widget.dart';
import 'widgets/product_reviews_modal.dart';

class ProductPage extends ConsumerStatefulWidget {
  final String uuid;

  const ProductPage({Key? key, required this.uuid}) : super(key: key);

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  void initState() {
    super.initState();
    final viewedProductsNotifier = ref.read(viewedProductsProvider.notifier);
    final shopDetailsNotifier = ref.read(shopDetailsProvider.notifier);
    Future.delayed(
      Duration.zero,
      () {
        ref.read(productProvider.notifier).getProductDetails(
              context,
              widget.uuid,
              viewedProductsNotifier,
              shopDetailsNotifier,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return state.isLoading
        ? Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.mainBackDark : AppColors.white,
            body: JumpingDots(
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          )
        : Directionality(
            textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
            child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
              appBar: AppBar(
                backgroundColor: AppColors.transparent,
                elevation: 0,
                leading: IconButton(
                  splashRadius: 20,
                  onPressed: context.popRoute,
                  icon: Icon(
                    isLtr
                        ? FlutterRemix.arrow_left_s_line
                        : FlutterRemix.arrow_right_s_line,
                    color: AppColors.black,
                    size: 24.r,
                  ),
                ),
                actions: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () =>
                        notifier.likeOrUnlikeProduct(state.product?.id),
                    icon: Icon(
                      AppHelpers.isLikedProduct(state.product?.id)
                          ? FlutterRemix.heart_fill
                          : FlutterRemix.heart_line,
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WImagesProduct(),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          Text(
                            '${state.product?.translation?.title}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.k2d(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.02,
                            ),
                          ),
                          22.verticalSpace,
                          const WProductExtras(),
                          16.verticalSpace,
                          WFlavorButton(
                            title:
                                AppHelpers.getTranslation(TrKeys.description),
                            background: isDarkMode
                                ? AppColors.mainBackDark
                                : AppColors.mainBack,
                            titleStyle: GoogleFonts.k2d(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -0.7,
                            ),
                            onTap: () {
                              AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: const ProductDetailsModal(),
                                isDarkMode: isDarkMode,
                              );
                            },
                          ),
                          10.verticalSpace,
                          WFlavorButton(
                            title: AppHelpers.getTranslation(TrKeys.reviews),
                            background: isDarkMode
                                ? AppColors.mainBackDark
                                : AppColors.mainBack,
                            titleStyle: GoogleFonts.k2d(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -0.7,
                            ),
                            onTap: () {
                              AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: const ProductReviewsModal(),
                                isDarkMode: isDarkMode,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    const RelatedProductsWidget(),
                    16.verticalSpace,
                    ViewedProductsWidgetInProductDetails(
                      onSeeAllPressed: () =>
                          context.pushRoute(const ViewedProductsRoute()),
                    ),
                    86.verticalSpace,
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: REdgeInsets.only(left: 15, right: 15, bottom: 24),
                child: state.stockCount > 0
                    ? IncreaseDecreaseButton(
                        count: state.stockCount,
                        onAdd: () => notifier.increaseStockCount(context),
                        onSubtract: () => notifier.decreaseStockCount(context),
                      )
                    : AccentLoginButton(
                        title: (state.selectedStock?.quantity != null &&
                                (state.selectedStock?.quantity ?? 0) > 0)
                            ? AppHelpers.getTranslation(TrKeys.addToCart)
                            : AppHelpers.getTranslation(TrKeys.outOfStock),
                        background: AppColors.black,
                        onPressed: (state.selectedStock?.quantity != null &&
                                (state.selectedStock?.quantity ?? 0) >=
                                    (state.product?.minQty ?? 0))
                            ? () => notifier.increaseStockCount(context)
                            : null,
                      ),
              ),
            ),
          );
  }
}
