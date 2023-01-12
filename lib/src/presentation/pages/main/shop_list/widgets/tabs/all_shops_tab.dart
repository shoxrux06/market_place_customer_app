import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../riverpod/provider/app_provider.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../../riverpod/provider/shop_list_provider.dart';

class AllShopsTab extends ConsumerStatefulWidget {
  const AllShopsTab({Key? key}) : super(key: key);

  @override
  ConsumerState<AllShopsTab> createState() => _AllShopsTabState();
}

class _AllShopsTabState extends ConsumerState<AllShopsTab> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shopListProvider);
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      width: 1.sw,
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          18.verticalSpace,
          Text(
            AppHelpers.getTranslation(TrKeys.allShops),
            style: GoogleFonts.k2d(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
          30.verticalSpace,
          state.isAllShopsLoading
              ? const ProductHorizontalListShimmer(height: 131)
              : state.allShops.isNotEmpty
                  ? Column(
                      children: state.allShops
                          .map((shop) => MainShopItem(shop: shop))
                          .toList(),
                    )
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 142.r,
                            height: 142.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: isDarkMode
                                  ? AppColors.mainBackDark
                                  : AppColors.mainBack,
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppAssets.pngNoStoreImage,
                              width: 57.r,
                              height: 87.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                          14.verticalSpace,
                          Text(
                            '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.allShops).toLowerCase()}',
                            style: GoogleFonts.k2d(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -14 * 0.02,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
          27.verticalSpace,
        ],
      ),
    );
  }
}
