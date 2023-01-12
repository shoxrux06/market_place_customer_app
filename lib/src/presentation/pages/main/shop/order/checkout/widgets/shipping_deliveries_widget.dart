import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../riverpod/provider/checkout_provider.dart';

class ShippingDeliveriesWidget extends ConsumerWidget {
  const ShippingDeliveriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final shippingDelivery = state.shippingDataList.isNotEmpty
        ? state.shippingDataList[state.selectedShopIndex].visibilityType
        : ShippingDeliveryVisibilityType.cantOrder;
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15, vertical: 18),
      child: Row(
        children: [
          if (shippingDelivery == ShippingDeliveryVisibilityType.both ||
              shippingDelivery == ShippingDeliveryVisibilityType.onlyDelivery)
            RadioButton(
              text: AppHelpers.getTranslation(TrKeys.delivery),
              isSelected: state.shippingDataList[state.selectedShopIndex]
                      .activeDelivery ==
                  DeliveryTypeEnum.delivery,
              onTap: () =>
                  notifier.changeDeliveryType(DeliveryTypeEnum.delivery),
            ),
          36.horizontalSpace,
          if (shippingDelivery == ShippingDeliveryVisibilityType.both ||
              shippingDelivery == ShippingDeliveryVisibilityType.onlyPickup)
            RadioButton(
              text: AppHelpers.getTranslation(TrKeys.pickup),
              isSelected: state.shippingDataList[state.selectedShopIndex]
                      .activeDelivery ==
                  DeliveryTypeEnum.pickup,
              onTap: () => notifier.changeDeliveryType(DeliveryTypeEnum.pickup),
            ),
        ],
      ),
    );
  }
}
