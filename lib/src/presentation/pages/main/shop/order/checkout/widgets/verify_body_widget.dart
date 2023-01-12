import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../../riverpod/provider/order_provider.dart';
import '../../widgets/total_order_calculations_widget.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'verify_shop_item_widget.dart';

class VerifyBodyWidget extends ConsumerWidget {
  const VerifyBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final orderState = ref.watch(orderProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final orderNotifier = ref.read(orderProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return orderState.isLoading
        ? JumpingDots(
            radius: 7,
            color: isDarkMode ? AppColors.white : AppColors.black,
          )
        : Stack(
            children: [
              SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                primary: true,
                child: Column(
                  children: [
                    21.verticalSpace,
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: state.shops.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final shopTotal = orderState.shopTotals[index];
                        return VerifyShopItemWidget(
                          shopTotal: shopTotal,
                          onChanged: (String coupon) => notifier.setShopCoupon(
                            coupon,
                            shopTotal.shopData.id ?? 0,
                          ),
                          checkCoupon: () => notifier.checkCoupon(
                            context,
                            shopTotal.shopData.id ?? 0,
                            orderNotifier,
                          ),
                          isError: state.applyCoupons
                                  .firstWhere((element) =>
                                      element.shopId == shopTotal.shopData.id)
                                  .isError ??
                              false,
                          isApplied: state.applyCoupons
                                  .firstWhere((element) =>
                                      element.shopId == shopTotal.shopData.id)
                                  .isApplied ??
                              false,
                        );
                      },
                    ),
                    24.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: OutlinedBorderTextField(
                        label: AppHelpers.getTranslation(TrKeys.orderComment),
                        onChanged: notifier.setComment,
                      ),
                    ),
                    16.verticalSpace,
                    TotalOrderCalculationsWidget(
                      coupon: orderState.coupon,
                      deliveryFee: state.deliveryFee,
                      cashback: state.cashbackAmount,
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
              BlurLoadingWidget(
                isLoading: state.isCreatingOrder ||
                    state.isCheckingCoupon ||
                    state.isCheckingCashback,
              ),
            ],
          );
  }
}
