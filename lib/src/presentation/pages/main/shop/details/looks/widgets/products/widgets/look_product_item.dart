import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../models/models.dart';
import '../../../../../../../../components/components.dart';
import '../../../../../../../../theme/theme.dart';
import '../riverpod/provider/look_products_provider.dart';
import 'look_product_extras.dart';

class LookProductItem extends ConsumerWidget {
  final int productIndex;
  final ProductData product;

  const LookProductItem({
    Key? key,
    required this.productIndex,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lookProductsProvider);
    final notifier = ref.read(lookProductsProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        21.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                width: 130.r,
                height: 172.r,
                imageUrl: '${AppConstants.imageBaseUrl}/${product.img}',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return MakeShimmer(
                    child: Container(
                      height: 172.r,
                      width: 130.r,
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
            22.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.translation?.title}',
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      letterSpacing: -14 * 0.02,
                      color: AppColors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  6.verticalSpace,
                  LookProductExtras(productIndex: productIndex),
                  6.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.currency(
                          symbol: LocalStorage.instance
                              .getSelectedCurrency()
                              .symbol,
                        ).format(
                          state.listOfSelectedStocks[productIndex]?.totalPrice,
                        ),
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.black,
                        ),
                      ),
                      4.horizontalSpace,
                      InkWell(
                        onTap: () => state.productsAddedToCart[productIndex] ==
                                LookProductStockStatus.alreadyAdded
                            ? notifier.deleteProductFromCart(productIndex)
                            : state.productsAddedToCart[productIndex] ==
                                    LookProductStockStatus.notAdded
                                ? notifier.addProductToCart(productIndex)
                                : null,
                        child: Row(
                          children: [
                            state.productsAddedToCart[productIndex] ==
                                    LookProductStockStatus.outOfStock
                                ? const SizedBox()
                                : Icon(
                                    state.productsAddedToCart[productIndex] ==
                                            LookProductStockStatus.alreadyAdded
                                        ? FlutterRemix.subtract_line
                                        : FlutterRemix.add_line,
                                    size: 20.r,
                                    color: AppColors.black,
                                  ),
                            4.horizontalSpace,
                            Text(
                              state.productsAddedToCart[productIndex] ==
                                      LookProductStockStatus.alreadyAdded
                                  ? AppHelpers.getTranslation(
                                      TrKeys.removeFromCart)
                                  : state.productsAddedToCart[productIndex] ==
                                          LookProductStockStatus.outOfStock
                                      ? AppHelpers.getTranslation(
                                          TrKeys.outOfStock)
                                      : AppHelpers.getTranslation(
                                          TrKeys.addToCart),
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                letterSpacing: -14 * 0.02,
                                color: AppColors.black,
                              ),
                            )
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
        21.verticalSpace,
        Divider(
          height: 1.r,
          thickness: 1.r,
          color: AppColors.black.withOpacity(0.1),
        ),
      ],
    );
  }
}
