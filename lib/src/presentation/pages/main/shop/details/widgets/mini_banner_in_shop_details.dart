import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/shop_details_provider.dart';

class MiniBannerInShopDetails extends ConsumerWidget {
  final Function(int index) onPageChanged;

  const MiniBannerInShopDetails({Key? key, required this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopDetailsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isBannersLoading
        ? MakeShimmer(
            child: Container(
              height: 160.r,
              decoration: const BoxDecoration(
                color: AppColors.mainBack,
              ),
            ),
          )
        : state.banners.isNotEmpty
            ? Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.banners.length,
                    itemBuilder: (context, index, realIndex) {
                      final banner = state.banners[index];
                      return InkWell(
                        onTap: () => context.pushRoute(
                          BannerDetailsRoute(
                            id: banner.id ?? 0,
                            imageUrl: banner.img ?? '',
                          ),
                        ),
                        child: SizedBox(
                          height: 160.r,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${AppConstants.imageBaseUrl}/${banner.img}',
                                  height: 160.r,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return MakeShimmer(
                                      child: Container(
                                        height: 220.r,
                                        decoration: const BoxDecoration(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      height: 160.r,
                                      decoration: const BoxDecoration(
                                        color: AppColors.mainBack,
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        FlutterRemix.image_line,
                                        size: 30.r,
                                        color: AppColors.black.withOpacity(0.5),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      AppHelpers.getTranslation(TrKeys.seeMore)
                                          .toUpperCase(),
                                      style: GoogleFonts.k2d(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        letterSpacing: 14 * 0.2,
                                      ),
                                    ),
                                  ),
                                  18.verticalSpace
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 160.r,
                      viewportFraction: 0.8,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      onPageChanged: (index, reason) {
                        onPageChanged(index);
                      },
                    ),
                  ),
                  6.verticalSpace,
                  SizedBox(
                    height: 6.r,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.banners.length,
                      itemBuilder: (context, indicatorIndex) {
                        return state.bannerIndex != indicatorIndex
                            ? Container(
                                height: 6.r,
                                width: 6.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.r),
                                  color: isDarkMode
                                      ? AppColors.borderDark
                                      : AppColors.black.withOpacity(0.1),
                                ),
                                margin: REdgeInsets.only(right: 4),
                              )
                            : Container(
                                height: 4.r,
                                width: 10.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                margin: REdgeInsets.only(right: 4),
                              );
                      },
                    ),
                  ),
                ],
              )
            : const SizedBox();
  }
}
