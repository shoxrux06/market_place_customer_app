import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'order_history_state.freezed.dart';

@freezed
class OrderHistoryState with _$OrderHistoryState {
  const factory OrderHistoryState({
    @Default(0) int activeTab,
    @Default(0) int totalCompletedCount,
    @Default(0) int totalOpenCount,
    @Default(0) int totalCanceledCount,
    @Default(false) bool isCompletedLoading,
    @Default(false) bool isOpenLoading,
    @Default(false) bool isCanceledLoading,
    @Default(false) bool isMoreCompletedLoading,
    @Default(false) bool isMoreOpenLoading,
    @Default(false) bool isMoreCanceledLoading,
    @Default([]) List<OrderData> completedOrders,
    @Default([]) List<OrderData> openOrders,
    @Default([]) List<OrderData> canceledOrders,
  }) = _OrderHistoryState;

  const OrderHistoryState._();
}