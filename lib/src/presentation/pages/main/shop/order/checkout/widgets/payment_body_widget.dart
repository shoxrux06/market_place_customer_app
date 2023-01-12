import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../components/components.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'payment_card_item_widget.dart';

class PaymentBodyWidget extends ConsumerWidget {
  const PaymentBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: state.isPaymentsLoading
          ? const ProductHorizontalListShimmer(
              height: 74,
              itemCount: 5,
              spacing: 13,
              verticalPadding: 20,
            )
          : ListView.builder(
              shrinkWrap: true,
              padding: REdgeInsets.symmetric(vertical: 20),
              physics: const CustomBouncingScrollPhysics(),
              itemCount: state.payments.length,
              itemBuilder: (context, index) {
                final payment = state.payments[index];
                return PaymentCardItemWidget(
                  payment: payment,
                  isSelected: state.selectedPaymentIndex == index,
                  onTap: () => notifier.setSelectedPaymentIndex(index),
                );
              },
            ),
    );
  }
}
