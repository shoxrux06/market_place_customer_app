import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/data/shop_data.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../../home/shops_loadin_shimmer_footer.dart';
import '../../profile/add_video/riverpod/provider/add_video_provider.dart';
import '../../view_map/riverpod/provider/view_map_provider.dart';
import 'brands/riverpod/provider/brands_provider.dart';
import 'brands/widgets/brands_body.dart';
import 'brands/widgets/horizantal_brand.dart';
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
    ref.read(viewMapProvider.notifier).fetchShops(context);
    ref.read(addVideoProvider.notifier).getVideoList();
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
    ref.watch(addVideoProvider.notifier).getVideoList();
    final stateShops = ref.watch(viewMapProvider);
    final stateVideo = ref.watch(addVideoProvider);
    print('Shops --> ${stateShops.shops}');
    print('Shops length--> ${stateShops.shops.length}');

    print('Video length--> :::: ${stateVideo.videoList.length} ::::: ');
    print('VideoList --> ::: ${stateVideo.videoList}:::');

    stateShops.shops.map((shop) {
      print('Shop List ---> **** ${shop} ****');
      if(shop.mark == 'recommended'){
        shopListRec.add(shop);
      }
      if(shop.mark == ''){
        shopList.add(shop);
      }
    });
    final stateBrands = ref.watch(brandsProvider);
    print('Brands in shp page ${stateBrands.brands}');
    print('Brands in shp page  length ${stateBrands.brands.length}');

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        body: Column(
          children: [
            1.verticalSpace,
            // SearchTextField(
            //   hintText:
            //       '${AppHelpers.getTranslation(TrKeys.searchProducts)} ${AppHelpers.getTranslation(TrKeys.searchIn).toLowerCase()} ${state.shopData?.translation?.title != null ? '${state.shopData?.translation?.title}' : 'store'}',
            //   onChanged: (value) => notifier.setQuery(context, value),
            //   suffixIcon: IconButton(
            //     splashRadius: 10,
            //     icon: Icon(
            //       FlutterRemix.equalizer_line,
            //       color: isDarkMode ? AppColors.white : AppColors.black,
            //       size: 18.r,
            //     ),
            //     onPressed: () {
            //       AppHelpers.showCustomModalBottomSheet(
            //         context: context,
            //         modal: const ShopDetailsSearchFilterModal(),
            //         isDarkMode: isDarkMode,
            //       );
            //     },
            //   ),
            // ),
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
                          SizedBox(
                            height: 40,
                            child:  ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: stateVideo.videoList.length,
                              physics: const CustomBouncingScrollPhysics(),
                              itemBuilder: (context, index){
                                return Container(
                                  height: 20,
                                  width: 150,
                                  child: Text(
                                    stateVideo.videoList[index].description
                                  )
                                );
                              },
                            ),
                          ),
                          1.verticalSpace,
                          SizedBox(
                            height: 200,
                            child:  ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: stateVideo.videoList.length,
                              physics: const CustomBouncingScrollPhysics(),
                              itemBuilder: (context, index){
                                return Container(
                                  height: 200,
                                  width: 150,
                                  child: Chewie(
                                    controller:ChewieController(
                                      videoPlayerController: VideoPlayerController.network(
                                          stateVideo.videoList[index].imageName
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
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
                          // const HorizantalBrands(),
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
                          // Container(
                          //   height: 388.r,
                          //   width: 1.sw,
                          //   decoration: const BoxDecoration(
                          //     color: AppColors.white,
                          //   ),
                          //   child: Stack(
                          //     children: [
                          //       SvgPicture.asset(
                          //         AppAssets.svgSaleBanner,
                          //         width: 1.sw,
                          //         height: 388.r,
                          //         fit: BoxFit.cover,
                          //       ),
                          //       Positioned(
                          //         left: 15.r,
                          //         bottom: 20.r,
                          //         child: AccentButton(
                          //           onTap: () => context.pushRoute(const DiscountProductsRoute()),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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

                          ListView.builder(
                            shrinkWrap: true,
                            physics: const CustomBouncingScrollPhysics(),
                            itemCount: shopListRec.length,
                            itemBuilder: (context, index) {
                              final ShopData shop = shopListRec[index];
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
                                        bottom: 20,
                                        left: 12,
                                        child: Text(shop.translation?.title.toString()??'', style: GoogleFonts.k2d(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                          color: isDarkMode ? AppColors.white : AppColors.black,
                                          letterSpacing: -0.4,
                                        ),),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          stateShops.isLoading? const ShopsLoadingShimmerFooter():
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const CustomBouncingScrollPhysics(),
                            itemCount: shopListRec.length,
                            itemBuilder: (context, index) {
                              final ShopData shop = shopListRec[index];
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
                                        bottom: 20,
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
                          // stateShops.isLoading? const ShopsLoadingShimmerFooter():
                          // shopList.isNotEmpty?ListView.builder(
                          //   shrinkWrap: true,
                          //   physics: const CustomBouncingScrollPhysics(),
                          //   itemCount: shopList.length,
                          //   itemBuilder: (context, index) {
                          //     final ShopData shop = shopList[index];
                          //     return Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 15),
                          //       child: Stack(
                          //         children: [
                          //           Container(
                          //             height: 250,
                          //             width: 1.sw,
                          //             decoration: BoxDecoration(
                          //                 color: AppColors.bottomNavigationShadow,
                          //                 borderRadius: BorderRadius.circular(12)
                          //             ),
                          //           ),
                          //           CommonImage(imageUrl: shop.backgroundImg,width: 1.sw,height: 200,),
                          //           Positioned(
                          //               bottom: 20,
                          //               left: 12,
                          //               child: Text(shop.translation?.title.toString()??'',style: GoogleFonts.k2d(
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 18.sp,
                          //                 color: isDarkMode ? AppColors.white : AppColors.black,
                          //                 letterSpacing: -0.4,
                          //               ),)),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // ): Container(),
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
