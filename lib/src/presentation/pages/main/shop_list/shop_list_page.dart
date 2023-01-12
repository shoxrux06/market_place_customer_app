import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../../riverpod/provider/app_provider.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'riverpod/provider/shop_list_provider.dart';
import '../shop/details/widgets/main_category_item.dart';
import '../shop/details/widgets/shop_list_banners.dart';

class ShopListPage extends ConsumerStatefulWidget {
  const ShopListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopListPage> createState() => _ShopListPageState();
}

class _ShopListPageState extends ConsumerState<ShopListPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    final notifier = ref.read(shopListProvider.notifier);
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
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final state = ref.watch(shopListProvider);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        body: SingleChildScrollView(
          physics: const CustomBouncingScrollPhysics(),
          child: Column(
            children: [
              const ShopListBanners(),
              1.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: OftenBuyButton(
                      icAsset: AppAssets.svgIcOftenBuy,
                      onTap: () =>
                          context.pushRoute(const OftenBuyProductsRoute()),
                      title: AppHelpers.getTranslation(TrKeys.oftenBuy),
                    ),
                  ),
                  1.horizontalSpace,
                  Expanded(
                    child: OftenBuyButton(
                      icAsset: AppAssets.svgIcProfitable,
                      onTap: () =>
                          context.pushRoute(const ProfitableProductsRoute()),
                      title: AppHelpers.getTranslation(TrKeys.profitable),
                    ),
                  ),
                ],
              ),
              15.verticalSpace,
              ListView.builder(
                itemCount: state.categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                        onTap: () =>
                            context.pushRoute(const DiscountProductsRoute()),
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                width: 1.sw,
                padding: REdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    18.verticalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.savedStores),
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    27.verticalSpace,
                  ],
                ),
              ),
              65.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
