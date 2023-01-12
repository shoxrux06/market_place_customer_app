import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/order_history_notifier.dart';
import '../state/order_history_state.dart';

final orderHistoryProvider =
    StateNotifierProvider.autoDispose<OrderHistoryNotifier, OrderHistoryState>(
  (ref) => OrderHistoryNotifier(ordersRepository),
);
