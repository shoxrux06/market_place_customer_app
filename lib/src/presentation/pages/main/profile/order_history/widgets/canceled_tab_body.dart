import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/components.dart';
import '../riverpod/provider/order_history_provider.dart';
import 'order_item_widget.dart';

class CanceledTabBody extends ConsumerStatefulWidget {
  const CanceledTabBody({Key? key}) : super(key: key);

  @override
  ConsumerState<CanceledTabBody> createState() => _CanceledTabBodyState();
}

class _CanceledTabBodyState extends ConsumerState<CanceledTabBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(orderHistoryProvider.notifier).fetchCanceledOrders(context);
      },
    );
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(orderHistoryProvider.notifier).fetchCanceledOrders(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderHistoryProvider);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: state.isCanceledLoading
          ? const OrdersShimmer(paddingVertical: 20)
          : ListView(
              shrinkWrap: true,
              physics: const CustomBouncingScrollPhysics(),
              controller: _scrollController,
              children: [
                ListView.builder(
                  physics: const CustomBouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.canceledOrders.length,
                  padding: REdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context, index) {
                    final order = state.canceledOrders[index];
                    return OrderItemWidget(order: order);
                  },
                ),
                if (state.isMoreCanceledLoading) const OrdersShimmer()
              ],
            ),
    );
  }
}
