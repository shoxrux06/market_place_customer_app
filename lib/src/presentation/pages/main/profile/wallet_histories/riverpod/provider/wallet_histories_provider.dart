import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/wallet_histories_notifier.dart';
import '../state/wallet_histories_state.dart';

final walletHistoriesProvider = StateNotifierProvider.autoDispose<
    WalletHistoriesNotifier, WalletHistoriesState>(
  (ref) => WalletHistoriesNotifier(userRepository),
);
