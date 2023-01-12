import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../shop/details/riverpod/notifier/shop_details_notifier.dart';
import '../state/system_settings_state.dart';

class SystemSettingsNotifier extends StateNotifier<SystemSettingsState> {
  final CurrenciesRepository _currenciesRepository;
  final UserRepository _userRepository;

  SystemSettingsNotifier(this._currenciesRepository, this._userRepository)
      : super(const SystemSettingsState());

  Future<void> changeCurrency(
    BuildContext context,
    CurrencyData currency,
    ShopDetailsNotifier shopDetailsNotifier,
  ) async {
    LocalStorage.instance.setSelectedCurrency(currency);
    state = state.copyWith();
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCurrencySaving: false);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          state = state.copyWith(isCurrencySaving: false);
          LocalStorage.instance.setWalletData(data.data?.wallet);
        },
        failure: (failure) {
          state = state.copyWith(isCurrencySaving: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> get profile details failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> fetchCurrencies(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCurrenciesLoading: true, currencies: []);
      final response = await _currenciesRepository.getCurrencies();
      response.when(
        success: (data) {
          state = state.copyWith(
            currencies: data.data ?? [],
            isCurrenciesLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isCurrenciesLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> get currencies failure: $failure');
        },
      );
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
