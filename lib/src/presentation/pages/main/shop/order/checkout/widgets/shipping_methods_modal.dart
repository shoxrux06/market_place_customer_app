import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'shipping_method_item_widget.dart';

class ShippingMethodsModal extends ConsumerWidget {
  const ShippingMethodsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            11.verticalSpace,
            Container(
              width: 49.r,
              height: 4.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(62.r),
                color:isDarkMode ? AppColors.dragElementDark : AppColors.dragElement,
              ),
            ),
            16.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppHelpers.getTranslation(TrKeys.shippingMethods).toUpperCase(),
                style: GoogleFonts.k2d(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -14 * 0.01,
                  color: isDarkMode ? AppColors.white :AppColors.black,
                ),
              ),
            ),
            ListView.builder(
              physics: const CustomBouncingScrollPhysics(),
              shrinkWrap: true,
              padding: REdgeInsets.symmetric(vertical: 30),
              itemCount: state.shippingDataList[state.selectedShopIndex]
                  .shopDeliveries?.length,
              itemBuilder: (context, index) {
                final delivery = state
                    .shippingDataList[state.selectedShopIndex]
                    .shopDeliveries?[index];
                final isSelected = delivery?.id ==
                    state.shippingDataList[state.selectedShopIndex]
                        .deliveryData?.shopDelivery?.id;
                return ShippingMethodItemWidget(
                  isSelected: isSelected,
                  delivery: delivery,
                  onTap: () {
                    notifier.changeDelivery(index);
                    context.popRoute();
                  },
                );
              },
            ),
          ],
        ));
  }
}
