import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/shop_details_provider.dart';
import 'widgets/discount_products_in_shop_details.dart';
import 'widgets/main_category_item.dart';
import 'widgets/most_sold_products_in_shop_details.dart';
import 'widgets/shop_details_search_filter_modal.dart';
import 'widgets/shop_list_banners.dart';

class ShopDetailsPage extends ConsumerStatefulWidget {
  const ShopDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends ConsumerState<ShopDetailsPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    final notifier = ref.read(shopDetailsProvider.notifier);
    Future.delayed(
      Duration.zero,
      () {
        notifier.fetchBanners(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
        notifier.fetchCategories(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
        notifier.fetchDiscountProducts(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
        notifier.fetchMostSoldProducts(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final state = ref.watch(shopDetailsProvider);
    final notifier = ref.read(shopDetailsProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        body: Column(
          children: [
            1.verticalSpace,
            SearchTextField(
              hintText:
                  '${AppHelpers.getTranslation(TrKeys.searchProducts)} ${AppHelpers.getTranslation(TrKeys.searchIn).toLowerCase()} ${state.shopData?.translation?.title != null ? '${state.shopData?.translation?.title}' : 'store'}',
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
                    modal: const ShopDetailsSearchFilterModal(),
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
                  : SingleChildScrollView(
                      physics: const CustomBouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ShopListBanners(),
                          1.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: OftenBuyButton(
                                  icAsset: AppAssets.svgIcOftenBuy,
                                  onTap: () => context
                                      .pushRoute(const OftenBuyProductsRoute()),
                                  title: AppHelpers.getTranslation(
                                      TrKeys.oftenBuy),
                                ),
                              ),
                              1.horizontalSpace,
                              Expanded(
                                child: OftenBuyButton(
                                  icAsset: AppAssets.svgIcProfitable,
                                  onTap: () => context.pushRoute(
                                      const ProfitableProductsRoute()),
                                  title: AppHelpers.getTranslation(
                                      TrKeys.profitable),
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          ListView.builder(
                            itemCount: state.categories.length,
                            shrinkWrap: true,
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final category = state.categories[index];
                              if ((category.children?.length ?? 0) > 1) {
                                return MainCategoryItem(category: category);
                              }
                              return const SizedBox();
                            },
                          ),
                          16.verticalSpace,
                          Container(
                            height: 388.r,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.svgSaleBanner,
                                  width: 1.sw,
                                  height: 388.r,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  left: 15.r,
                                  bottom: 20.r,
                                  child: AccentButton(
                                    onTap: () => context.pushRoute(
                                        const DiscountProductsRoute()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          16.verticalSpace,
                          DiscountProductsInShopDetails(
                            onSeeAllPressed: () => context
                                .pushRoute(const DiscountProductsRoute()),
                          ),
                          15.verticalSpace,
                          MostSoldProductsInShopDetails(
                            onSeeAllPressed: () => context
                                .pushRoute(const MostSoldProductsRoute()),
                          ),
                          65.verticalSpace,
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
