import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/reset_confirmation_notifier.dart';
import '../state/reset_confirmation_state.dart';

final resetConfirmationProvider =
    StateNotifierProvider<ResetConfirmationNotifier, ResetConfirmationState>(
  (ref) => ResetConfirmationNotifier(
    authRepository,
    currenciesRepository,
    userRepository,
  ),
);
