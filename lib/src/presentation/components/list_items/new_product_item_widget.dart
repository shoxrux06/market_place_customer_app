import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../core/utils/utils.dart';
import '../../../models/models.dart';
import '../components.dart';
import '../../theme/theme.dart';

class NewProductItemWidget extends StatelessWidget {
  final ProductData product;
  final Function() onLikePressed;

  const NewProductItemWidget({
    Key? key,
    required this.product,
    required this.onLikePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      margin: REdgeInsets.only(right: 9),
      width: 313.r,
      child: InkWell(
        onTap: () => context.pushRoute(
          ProductRoute(uuid: product.uuid ?? ''),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 150.r,
              width: 168.r,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: '${AppConstants.imageBaseUrl}/${product.img}',
                      width: 168.r,
                      height: 150.r,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) {
                        return MakeShimmer(
                          child: Container(
                            width: 168.r,
                            height: 150.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.white,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Container(
                          height: 150.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
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
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: onLikePressed,
                      icon: Icon(
                        AppHelpers.isLikedProduct(product.id)
                            ? FlutterRemix.heart_fill
                            : FlutterRemix.heart_line,
                        size: 22.r,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.translation?.title}'.toUpperCase(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -14 * 0.01,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FlutterRemix.star_fill,
                        color: AppColors.starColor,
                        size: 16.r,
                      ),
                      5.horizontalSpace,
                      Text(
                        (product.ratingAvg ?? 0.0).toStringAsFixed(1),
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency().symbol,
                    ).format(
                      product.stocks!.isEmpty
                          ? 0
                          : product.stocks?[0].totalPrice ?? 0,
                    ),
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -14 * 0.01,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
