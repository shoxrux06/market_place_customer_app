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
import '../state/wallet_histories_state.dart';

class WalletHistoriesNotifier extends StateNotifier<WalletHistoriesState> {
  final UserRepository _userRepository;
  int _page = 0;
  bool _hasMore = true;

  WalletHistoriesNotifier(this._userRepository)
      : super(const WalletHistoriesState());

  Future<void> fetchWalletHistories(BuildContext context) async {
    if (!_hasMore) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true, wallets: []);
        final response = await _userRepository.getWalletHistories(++_page);
        response.when(
          success: (data) {
            state = state.copyWith(wallets: data.data ?? [], isLoading: false);
            if ((data.data?.length ?? 0) < 15) {
              _hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
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
            debugPrint('==> get wallets failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _userRepository.getWalletHistories(++_page);
        response.when(
          success: (data) async {
            final List<WalletData> newList = List.from(state.wallets);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              wallets: newList,
              isMoreLoading: false,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get wallets failure: $failure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
