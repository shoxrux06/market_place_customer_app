import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/checkout_provider.dart';

class ShopItemInShipping extends ConsumerWidget {
  final int index;
  final ShopData shop;

  const ShopItemInShipping({Key? key, required this.index, required this.shop})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => notifier.setSelectedShopIndex(index),
          child: Container(
            width: 132.r,
            height: 106.r,
            color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
            padding: REdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(54.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${AppConstants.imageBaseUrl}/${shop.logoImg}',
                        width: 34.r,
                        height: 34.r,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) {
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
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.mainBack,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              FlutterRemix.image_line,
                              color: AppColors.black,
                            ),
                          );
                        },
                      ),
                    ),
                    state.selectedShopIndex == index
                        ? Container(
                            width: 18.r,
                            height: 18.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              color: AppColors.accentGreen,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              FlutterRemix.check_line,
                              color: AppColors.white,
                              size: 18.r,
                            ),
                          )
                        : Container(
                            width: 15.r,
                            height: 15.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              color: AppColors.white,
                              border: Border.all(
                                width: 1.r,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${shop.translation?.title}',
                      maxLines: 1,
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      AppHelpers.getTranslation(TrKeys.store),
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.hintColor,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        VerticalDivider(
          thickness: 1.r,
          width: 1.r,
          color: isDarkMode ? AppColors.dragElementDark : AppColors.mainBack,
        ),
      ],
    );
  }
}
