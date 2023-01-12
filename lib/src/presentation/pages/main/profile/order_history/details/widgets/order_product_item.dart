import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';

class OrderProductItemWidget extends ConsumerWidget {
  final OrderStocks? stock;

  const OrderProductItemWidget({Key? key, required this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasDiscount =
        stock?.discount != null && (stock?.discount ?? 0) > 0;
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                width: 121.r,
                height: 111.r,
                imageUrl:
                    '${AppConstants.imageBaseUrl}/${stock?.stock?.product?.img}',
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
                        '${stock?.stock?.product?.translation?.title}',
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
                        children: stock!.stock!.extras!.map(
                          (extra) {
                            final extraType = AppHelpers.getExtraTypeByValue(
                              extra.group?.type ?? '',
                            );
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
                  22.verticalSpace,
                  Row(
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
                                  ? ((stock?.originPrice ?? 0) -
                                      ((stock?.discount ?? 0) /
                                          (stock?.quantity ?? 1)))
                                  : stock?.originPrice,
                            ),
                            style: GoogleFonts.k2d(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.4,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          if (hasDiscount)
                            Text(
                              NumberFormat.currency(
                                symbol: LocalStorage.instance
                                    .getSelectedCurrency()
                                    .symbol,
                              ).format(stock?.originPrice),
                              style: GoogleFonts.k2d(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.4,
                                color: AppColors.red,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      8.horizontalSpace,
                      Icon(
                        FlutterRemix.close_line,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        size: 14.r,
                      ),
                      5.horizontalSpace,
                      Text(
                        '${stock?.quantity}',
                        style: GoogleFonts.k2d(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.4,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        22.verticalSpace,
      ],
    );
  }
}
