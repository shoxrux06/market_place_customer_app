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
import '../riverpod/provider/order_details_provider.dart';

class ShopTabItem extends ConsumerWidget {
  final int index;
  final ShopOrderDetails orderDetails;
  final PageController pageController;

  const ShopTabItem({
    Key? key,
    required this.index,
    required this.orderDetails,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderDetailsProvider);
    final notifier = ref.read(orderDetailsProvider.notifier);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: AppColors.white,
          child: InkWell(
            onTap: () => notifier.changeActiveShopIndex(index, pageController),
            child: Container(
              height: 60.r,
              padding: REdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppConstants.imageBaseUrl}/${orderDetails.shop?.logoImg}',
                      height: 40.r,
                      width: 40.r,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) {
                        return MakeShimmer(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColors.mainBack,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Icon(
                          FlutterRemix.image_line,
                          size: 20,
                          color: AppColors.black.withOpacity(0.5),
                        );
                      },
                    ),
                  ),
                  12.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${orderDetails.shop?.translation?.title}',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          letterSpacing: -1,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        AppHelpers.getTranslation(TrKeys.shop),
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          letterSpacing: -1,
                          color: AppColors.hintColor,
                        ),
                      ),
                    ],
                  ),
                  12.horizontalSpace,
                  state.activeShopIndex == index
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
            ),
          ),
        ),
        VerticalDivider(
          width: 1.r,
          thickness: 1.r,
          color: AppColors.mainBack,
        ),
      ],
    );
  }
}
