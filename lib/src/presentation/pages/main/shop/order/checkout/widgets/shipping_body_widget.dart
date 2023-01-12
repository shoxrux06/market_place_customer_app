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
import 'choose_delivery_details_body.dart';
import 'shipping_deliveries_widget.dart';
import 'shop_item_in_shipping.dart';

class ShippingBodyWidget extends ConsumerWidget {
  const ShippingBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isLoading
        ? JumpingDots(
            radius: 7,
            color: isDarkMode ? AppColors.white : AppColors.black,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 106.r,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.shops.length,
                  physics: const CustomBouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final ShopData shop = state.shops[index];
                    return ShopItemInShipping(index: index, shop: shop);
                  },
                ),
              ),
              Divider(
                height: 1.r,
                thickness: 1.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              const ShippingDeliveriesWidget(),
              Divider(
                height: 1.r,
                thickness: 1.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              if (state.shippingDataList.isNotEmpty &&
                  state.shippingDataList[state.selectedShopIndex]
                          .visibilityType ==
                      ShippingDeliveryVisibilityType.cantOrder)
                Center(
                  child: Column(
                    children: [
                      21.verticalSpace,
                      Icon(
                        FlutterRemix.folder_unknow_fill,
                        size: 80.r,
                        color: AppColors.red.withOpacity(0.5),
                      ),
                      16.verticalSpace,
                      Text(
                        AppHelpers.getTranslation(
                          TrKeys.thereIsNoDeliveryTypesInThisShop,
                        ),
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: AppColors.red.withOpacity(0.5),
                          letterSpacing: -0.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              if (state.shippingDataList.isNotEmpty &&
                  state.shippingDataList[state.selectedShopIndex]
                          .visibilityType !=
                      ShippingDeliveryVisibilityType.cantOrder)
                const Expanded(child: ChooseDeliveryDetailsBody()),
            ],
          );
  }
}
