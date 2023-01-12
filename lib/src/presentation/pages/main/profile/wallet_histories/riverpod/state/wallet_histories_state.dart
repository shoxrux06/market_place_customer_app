import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'wallet_histories_state.freezed.dart';

@freezed
class WalletHistoriesState with _$WalletHistoriesState {
  const factory WalletHistoriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<WalletData> wallets,
  }) = _WalletHistoriesState;

  const WalletHistoriesState._();
}