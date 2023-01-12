import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/shop_details_provider.dart';

class ShopListBanners extends ConsumerWidget {
  const ShopListBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopDetailsProvider);
    final notifier = ref.read(shopDetailsProvider.notifier);
    return state.isBannersLoading
        ? MakeShimmer(
            child: Container(
              height: 100.r,
              decoration: const BoxDecoration(
                color: AppColors.mainBack,
              ),
            ),
          )
        : state.banners.isNotEmpty
            ? Container(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: state.banners.length,
            options: CarouselOptions(
              height: 150.r,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) => notifier.setActiveBanner(index),
            ),
            itemBuilder:
                (BuildContext context, int index, int realIndex) {
              final banner = state.banners[index];
              return InkWell(
                onTap: ()=>context.pushRoute(BannerDetailsRoute(id: banner.id, imageUrl: banner.img)),
                child: SizedBox(
                  height: 150.r,
                  child: MakeGradientMask(
                    child: CommonImage(
                      imageUrl: banner.img,
                      width: 1.sw,
                      height: 150,
                      radius: 0,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 4),
          SizedBox(
            height: 3.r,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.banners.length,
              itemBuilder: (context, indicatorIndex) {
                return Container(
                  height: 3.r,
                  width: 24.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: state.bannerIndex == indicatorIndex
                        ? AppColors.black.withOpacity(0.30)
                        : AppColors.black.withOpacity(0.10),
                  ),
                  margin: REdgeInsets.only(right: 4),
                );
              },
            ),
          ),
          SizedBox(height: 4),
        ],
      )
    )
            : const SizedBox();
  }
}
