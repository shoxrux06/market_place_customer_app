import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'cart_product_item_widget.dart';

class CartShopItemWidget extends StatelessWidget {
  final ShopTotalData shopTotal;

  const CartShopItemWidget({Key? key, required this.shopTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:
            isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
      ),
      padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: REdgeInsets.only(bottom: 16),
      child: ListView(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.zero,
        children: [
          ListView.builder(
            itemCount: shopTotal.cartProducts.length,
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final CartProductData product = shopTotal.cartProducts[index];
              final bool isLast = index == shopTotal.cartProducts.length - 1;
              return CartProductItemWidget(
                cartProduct: product,
                isLast: isLast,
              );
            },
          ),
          Divider(
            height: 0.r,
            thickness: 1.r,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          18.verticalSpace,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
            ),
            padding: REdgeInsets.symmetric(
              horizontal: 13,
              vertical: 10,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35.r),
                  child: CachedNetworkImage(
                    width: 40.r,
                    height: 40.r,
                    imageUrl:
                        '${AppConstants.imageBaseUrl}/${shopTotal.shopData.logoImg}',
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
                11.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${shopTotal.shopData.translation?.title}',
                      style: GoogleFonts.k2d(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.shop),
                      style: GoogleFonts.k2d(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                        color: AppColors.hintColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.tax),
                    style: GoogleFonts.k2d(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency().symbol,
                    ).format(shopTotal.shopTax),
                    style: GoogleFonts.k2d(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.discount),
                    style: GoogleFonts.k2d(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency().symbol,
                    ).format(shopTotal.discount),
                    style: GoogleFonts.k2d(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.totalPrice),
                    style: GoogleFonts.k2d(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency().symbol,
                    ).format(shopTotal.totalPrice),
                    style: GoogleFonts.k2d(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
