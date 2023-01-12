import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../../../shop_list/riverpod/provider/shop_list_provider.dart';
import '../riverpod/provider/shop_details_provider.dart';
import 'shop_delivery_times_modal.dart';
import 'shop_info_modal.dart';

class MainBannerInShopDetails extends ConsumerWidget {
  const MainBannerInShopDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopDetailsProvider);
    final notifier = ref.read(shopDetailsProvider.notifier);
    final shopListNotifier = ref.read(shopListProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return SizedBox(
      height: 284.r,
      width: 1.sw,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                '${AppConstants.imageBaseUrl}/${state.shopData?.backgroundImg}',
            width: 1.sw,
            height: 284.r,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) {
              return MakeShimmer(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.mainBack,
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.mainBack,
                ),
                alignment: Alignment.center,
                child: Icon(
                  FlutterRemix.image_line,
                  color: AppColors.black.withOpacity(0.3),
                  size: 120.r,
                ),
              );
            },
          ),
          Container(
            height: 284.r,
            width: 1.sw,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withOpacity(0),
                  AppColors.black.withOpacity(0.5)
                ],
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.only(left: 15, right: 15, bottom: 21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60.r,
                          height: 60.r,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(77.r),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${AppConstants.imageBaseUrl}/${state.shopData?.logoImg}',
                              width: 40.r,
                              height: 40.r,
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return MakeShimmer(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: AppColors.mainBack,
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: AppColors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    FlutterRemix.image_line,
                                    color: AppColors.black.withOpacity(0.5),
                                    size: 20.r,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          '${state.shopData?.translation?.title}',
                          style: GoogleFonts.k2d(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            letterSpacing: -14 * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                19.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FlutterRemix.information_line,
                          color: AppColors.accentGreen,
                          size: 16.r,
                        ),
                        8.horizontalSpace,
                        InkWell(
                          onTap: () {
                            AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: const ShopInfoModal(),
                              isDarkMode: isDarkMode,
                            );
                          },
                          child: Text(
                            AppHelpers.getTranslation(TrKeys.storeInfo),
                            style: GoogleFonts.k2d(
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 5.r,
                      height: 5.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: AppColors.white.withOpacity(0.37),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: const ShopDeliveryTimesModal(),
                          isDarkMode: isDarkMode,
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            FlutterRemix.truck_line,
                            color: AppColors.accentGreen,
                            size: 16.r,
                          ),
                          8.horizontalSpace,
                          Text(
                            AppHelpers.getTranslation(
                                TrKeys.storeDeliveryTimes),
                            style: GoogleFonts.k2d(
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 5.r,
                      height: 5.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: AppColors.white.withOpacity(0.37),
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          notifier.saveOrDeleteStore(context, shopListNotifier),
                      child: Row(
                        children: [
                          Icon(
                            FlutterRemix.bookmark_3_line,
                            color: state.isSaved
                                ? AppColors.accentGreen
                                : AppColors.white,
                            size: 16.r,
                          ),
                          8.horizontalSpace,
                          Text(
                            state.isSaved
                                ? AppHelpers.getTranslation(TrKeys.saved)
                                : AppHelpers.getTranslation(TrKeys.save),
                            style: GoogleFonts.k2d(
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
