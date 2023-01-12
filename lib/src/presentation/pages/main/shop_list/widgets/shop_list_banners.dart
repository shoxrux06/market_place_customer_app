import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../riverpod/provider/shop_list_provider.dart';

class ShopListBanners extends ConsumerWidget {
  const ShopListBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopListProvider);
    final notifier = ref.read(shopListProvider.notifier);
    return state.isBannersLoading
        ? MakeShimmer(
            child: Container(
              height: 200.r,
              decoration: const BoxDecoration(
                color: AppColors.mainBack,
              ),
            ),
          )
        : state.banners.isNotEmpty
            ? Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.banners.length,
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: false,
                      onPageChanged: (index, reason) =>
                          notifier.setActiveBanner(index),
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final banner = state.banners[index];
                      return SizedBox(
                        height: 200.r,
                        child: MakeGradientMask(
                          child: CachedNetworkImage(
                            imageUrl:
                                '${AppConstants.imageBaseUrl}/${banner.img}',
                            height: 200.r,
                            width: 1.sw,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, progress) {
                              return MakeShimmer(
                                child: Container(
                                  height: 200.r,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                  ),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Container(
                                height: 200.r,
                                decoration: const BoxDecoration(
                                  color: AppColors.mainBack,
                                ),
                                alignment: Alignment.center,
                                child: const Icon(
                                  FlutterRemix.image_line,
                                  size: 40,
                                  color: AppColors.black,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 15.r,
                    left: 15.r,
                    right: 0.r,
                    child: SizedBox(
                      height: 4.r,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.banners.length,
                        itemBuilder: (context, indicatorIndex) {
                          return Container(
                            height: 4.r,
                            width: 32.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: state.activeBanner == indicatorIndex
                                  ? AppColors.white
                                  : AppColors.white.withOpacity(0.36),
                            ),
                            margin: REdgeInsets.only(right: 4),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox();
  }
}
