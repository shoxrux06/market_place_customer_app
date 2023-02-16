import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/widgets/video_list_products.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/data/shop_data.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../../home/shops_loadin_shimmer_footer.dart';
import '../../profile/add_video/riverpod/provider/add_video_provider.dart';
import '../../profile/add_video/widgets/video_widget.dart';
import '../../view_map/riverpod/provider/view_map_provider.dart';
import 'brands/riverpod/provider/brands_provider.dart';
import 'riverpod/provider/shop_details_provider.dart';
import 'widgets/discount_products_in_shop_details.dart';
import 'widgets/main_category_item.dart';
import 'widgets/most_sold_products_in_shop_details.dart';
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

    List<ShopData> shopListRec = [];
    List<ShopData> shopList = [];

    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final state = ref.watch(shopDetailsProvider);

    ref.watch(viewMapProvider.notifier).fetchShops(context);
    final stateShops = ref.watch(viewMapProvider);

    stateShops.shops.map((shop) {
      if(shop.mark == 'recommended'){
        shopListRec.add(shop);
      }
      if(shop.mark == ''){
        shopList.add(shop);
      }
    });

    final stateBrands = ref.watch(brandsProvider);

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        body: Column(
          children: [
            1.verticalSpace,
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
                          1.verticalSpace,
                          const ShopListBanners(),
                          1.verticalSpace,
                          Row(
                            children: [
                              12.horizontalSpace,
                              Expanded(
                                child: OftenBuyButton(
                                  icAsset: AppAssets.svgIcOftenBuy,
                                  onTap: () => context
                                      .pushRoute(const OftenBuyProductsRoute()),
                                  title: AppHelpers.getTranslation(
                                      TrKeys.famousText),
                                ),
                              ),
                              4.horizontalSpace,
                              Expanded(
                                child: OftenBuyButton(
                                  icAsset: AppAssets.svgIcProfitable,
                                  onTap: () => context.pushRoute(
                                      const ProfitableProductsRoute()),
                                  title: AppHelpers.getTranslation(
                                      TrKeys.newProductsText),
                                ),
                              ),
                              4.horizontalSpace,
                              Expanded(
                                child: OftenBuyButton(
                                  icAsset: AppAssets.svgIcProfitable,
                                  onTap: () => context.pushRoute(
                                      const ProfitableProductsRoute()),
                                  title: AppHelpers.getTranslation(
                                      TrKeys.discountText),
                                ),
                              ),
                              12.horizontalSpace,
                            ],
                          ),
                          15.verticalSpace,
                          Row(
                            children: [
                              12.horizontalSpace,
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFB537F0),
                                          Color(0xFFF24A4A),
                                        ]
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Special products for you',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: InkWell(
                                  onTap:()=> context.pushRoute(const DiscountProductsRoute()),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFB537F0),
                                            Color(0xFFF24A4A),
                                          ]
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '12:28:05'
                                            ' Flash discounts',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ),
                              12.horizontalSpace,
                            ],
                          ),
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
                          DiscountProductsInShopDetails(
                            onSeeAllPressed: () => context
                                .pushRoute(const DiscountProductsRoute()),
                          ),
                          15.verticalSpace,
                          MostSoldProductsInShopDetails(
                            onSeeAllPressed: () => context
                                .pushRoute(const MostSoldProductsRoute()),
                          ),
                          12.verticalSpace,
                          const VideoWidget(),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const CustomBouncingScrollPhysics(),
                            itemCount: stateShops.shops.length,
                            itemBuilder: (context, index) {
                              final ShopData shop = stateShops.shops[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 1.sw,
                                      decoration: BoxDecoration(
                                          color: AppColors.bottomNavigationShadow,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                    ),
                                    CommonImage(imageUrl: shop.backgroundImg,width: 1.sw,height: 160,),
                                    Positioned(
                                        bottom: 8,
                                        left: 12,
                                        child: Text(shop.translation?.title.toString()??'', style: GoogleFonts.k2d(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                          color: isDarkMode ? AppColors.white : AppColors.black,
                                          letterSpacing: -0.4,
                                        ),)),
                                  ],
                                ),
                              );
                            },
                          ),
                          12.verticalSpace,
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
