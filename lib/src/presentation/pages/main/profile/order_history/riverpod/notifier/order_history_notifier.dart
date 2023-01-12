import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../state/order_history_state.dart';

class OrderHistoryNotifier extends StateNotifier<OrderHistoryState> {
  final OrdersRepository _ordersRepository;
  int _completedPage = 0;
  int _openPage = 0;
  int _canceledPage = 0;
  bool _hasMoreCompleted = true;
  bool _hasMoreOpen = true;
  bool _hasMoreCanceled = true;

  OrderHistoryNotifier(this._ordersRepository)
      : super(const OrderHistoryState());

  Future<void> changeActiveTab(int index) async {
    state = state.copyWith(activeTab: index);
  }

  Future<void> fetchCompletedOrders(BuildContext context) async {
    if (!_hasMoreCompleted) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_completedPage == 0) {
        state = state.copyWith(isCompletedLoading: true, completedOrders: []);
        final response =
            await _ordersRepository.getCompletedOrders(++_completedPage);
        response.when(
          success: (data) {
            state = state.copyWith(
              completedOrders: data.data ?? [],
              isCompletedLoading: false,
              totalCompletedCount: data.meta?.total ?? 0,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMoreCompleted = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isCompletedLoading: false);
            if (failure == const NetworkExceptions.internalServerError()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(
                  TrKeys.somethingWentWrongWithTheServer,
                ),
              );
            } else if (failure ==
                const NetworkExceptions.unauthorisedRequest()) {
              LocalStorage.instance.deleteToken();
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
              );
              context.router.pushAndPopUntil(
                const LoginRoute(),
                predicate: (route) => false,
              );
            }
            debugPrint('==> get completed orders failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreCompletedLoading: true);
        final response =
            await _ordersRepository.getCompletedOrders(++_completedPage);
        response.when(
          success: (data) async {
            final List<OrderData> newList = List.from(state.completedOrders);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              isMoreCompletedLoading: false,
              completedOrders: newList,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMoreCompleted = false;
            }
          },
          failure: (activeFailure) {
            state = state.copyWith(isMoreCompletedLoading: false);
            debugPrint('==> get completed orders failure: $activeFailure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchOpenOrders(BuildContext context) async {
    if (!_hasMoreOpen) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_openPage == 0) {
        state = state.copyWith(isOpenLoading: true, openOrders: []);
        final response = await _ordersRepository.getOpenOrders(++_openPage);
        response.when(
          success: (data) {
            state = state.copyWith(
              openOrders: data.data ?? [],
              isOpenLoading: false,
              totalOpenCount: data.meta?.total ?? 0,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMoreOpen = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isOpenLoading: false);
            if (failure == const NetworkExceptions.internalServerError()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(
                  TrKeys.somethingWentWrongWithTheServer,
                ),
              );
            }
            debugPrint('==> get open orders failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreOpenLoading: true);
        final response = await _ordersRepository.getOpenOrders(++_openPage);
        response.when(
          success: (data) async {
            final List<OrderData> newList = List.from(state.openOrders);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              isMoreOpenLoading: false,
              openOrders: newList,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMoreOpen = false;
            }
          },
          failure: (activeFailure) {
            state = state.copyWith(isMoreOpenLoading: false);
            debugPrint('==> get open orders failure: $activeFailure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchCanceledOrders(BuildContext context) async {
    if (!_hasMoreCanceled) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_canceledPage == 0) {
        state = state.copyWith(isCanceledLoading: true, canceledOrders: []);
        final response =
            await _ordersRepository.getCanceledOrders(++_canceledPage);
        response.when(
          success: (data) {
            state = state.copyWith(
              canceledOrders: data.data ?? [],
              isCanceledLoading: false,
              totalCanceledCount: data.meta?.total ?? 0,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMoreCanceled = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isCanceledLoading: false);
            if (failure == const NetworkExceptions.internalServerError()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(
                  TrKeys.somethingWentWrongWithTheServer,
                ),
              );
            }
            debugPrint('==> get canceled orders failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreCanceledLoading: true);
        final response =
            await _ordersRepository.getCanceledOrders(++_canceledPage);
        response.when(
          success: (data) async {
            final List<OrderData> newList = List.from(state.canceledOrders);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              isMoreCanceledLoading: false,
              canceledOrders: newList,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMoreCanceled = false;
            }
          },
          failure: (activeFailure) {
            state = state.copyWith(isMoreCanceledLoading: false);
            debugPrint('==> get canceled orders failure: $activeFailure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
