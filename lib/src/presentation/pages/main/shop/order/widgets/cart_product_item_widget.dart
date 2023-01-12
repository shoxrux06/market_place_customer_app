import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/order_provider.dart';

class CartProductItemWidget extends ConsumerWidget {
  final CartProductData cartProduct;
  final bool isLast;

  const CartProductItemWidget({
    Key? key,
    required this.cartProduct,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(orderProvider.notifier);
    final bool hasDiscount = cartProduct.selectedStock?.discount != null &&
        (cartProduct.selectedStock?.discount ?? 0) > 0;
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                width: 115.r,
                height: 151.r,
                imageUrl:
                    '${AppConstants.imageBaseUrl}/${cartProduct.imageUrl}',
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
                    child: Icon(
                      FlutterRemix.image_line,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  );
                },
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${cartProduct.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.k2d(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -14 * 0.02,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      4.verticalSpace,
                      Wrap(
                        spacing: 6.r,
                        runSpacing: 4.r,
                        children: cartProduct.selectedStock!.extras!.map(
                          (extra) {
                            final extraType = AppHelpers.getExtraTypeByValue(
                                extra.group?.type ?? '');
                            return extraType == ExtrasType.text
                                ? Text(
                                    '${extra.group?.translation?.title} ${extra.value}',
                                    style: GoogleFonts.k2d(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -14 * 0.02,
                                      color: AppColors.extrasInCart,
                                    ),
                                  )
                                : extraType == ExtrasType.color
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            AppHelpers.getTranslation(
                                                TrKeys.color),
                                            style: GoogleFonts.k2d(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: -14 * 0.02,
                                              color: AppColors.extrasInCart,
                                            ),
                                          ),
                                          2.horizontalSpace,
                                          Container(
                                            width: 12.r,
                                            height: 12.r,
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                    '0xFF${extra.value?.substring(1, 7)}'),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox();
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      InkWell(
                        onTap: () => notifier.likeOrUnlikeProduct(
                            cartProduct.selectedStock?.product?.id),
                        child: Row(
                          children: [
                            Icon(
                              AppHelpers.isLikedProduct(
                                      cartProduct.selectedStock?.product?.id)
                                  ? FlutterRemix.heart_fill
                                  : FlutterRemix.heart_line,
                              size: 18.r,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                            5.horizontalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.like),
                              style: GoogleFonts.k2d(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -14 * 0.02,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      30.horizontalSpace,
                      InkWell(
                        onTap: () => notifier.deleteProduct(cartProduct),
                        child: Row(
                          children: [
                            Icon(
                              FlutterRemix.delete_bin_line,
                              size: 18.r,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                            5.horizontalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.delete),
                              style: GoogleFonts.k2d(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -14 * 0.02,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  28.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()
                                  .symbol,
                            ).format(
                              hasDiscount
                                  ? ((cartProduct.selectedStock?.price ?? 0) -
                                      (cartProduct.selectedStock?.discount ??
                                          0))
                                  : cartProduct.selectedStock?.price,
                            ),
                            style: GoogleFonts.k2d(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -14 * 0.02,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          if (hasDiscount)
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    symbol: LocalStorage.instance
                                        .getSelectedCurrency()
                                        .symbol,
                                  ).format(cartProduct.selectedStock?.price),
                                  style: GoogleFonts.k2d(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -14 * 0.03,
                                    color: AppColors.red,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                4.horizontalSpace,
                                Container(
                                  height: 20.r,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(89.r),
                                    color: AppColors.red,
                                  ),
                                  padding: REdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '-${(((cartProduct.selectedStock?.discount ?? 0) / (cartProduct.selectedStock?.price ?? 1)) * 100).toInt()}%',
                                    style: GoogleFonts.k2d(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -14 * 0.04,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      Container(
                        height: 38.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.12.r),
                          border: Border.all(
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            width: 0.61.r,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () =>
                                  notifier.decreaseProductCount(cartProduct),
                              icon: Icon(
                                FlutterRemix.subtract_line,
                                size: 20.r,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            Text(
                              '${cartProduct.quantity}',
                              style: GoogleFonts.k2d(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -14 * 0.03,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  notifier.increaseProductCount(cartProduct),
                              icon: Icon(
                                FlutterRemix.add_line,
                                size: 20.r,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast)
          Column(
            children: [
              22.verticalSpace,
              Divider(
                thickness: 1.r,
                height: 0.r,
                color: AppColors.black.withOpacity(0.1),
              ),
            ],
          ),
        22.verticalSpace,
      ],
    );
  }
}
