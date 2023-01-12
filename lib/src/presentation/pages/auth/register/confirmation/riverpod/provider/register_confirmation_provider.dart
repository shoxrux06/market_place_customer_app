import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/register_confirmation_notifier.dart';
import '../state/register_confirmation_state.dart';

final registerConfirmationProvider = StateNotifierProvider.autoDispose<
    RegisterConfirmationNotifier, RegisterConfirmationState>(
  (ref) => RegisterConfirmationNotifier(
    authRepository,
    currenciesRepository,
    userRepository,
  ),
);
