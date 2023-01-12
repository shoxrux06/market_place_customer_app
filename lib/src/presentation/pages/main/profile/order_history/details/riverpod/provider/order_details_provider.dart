import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/order_details_notifier.dart';
import '../state/order_details_state.dart';

final orderDetailsProvider =
    StateNotifierProvider<OrderDetailsNotifier, OrderDetailsState>(
  (ref) => OrderDetailsNotifier(ordersRepository),
);
