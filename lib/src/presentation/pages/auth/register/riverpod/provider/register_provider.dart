import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/di/dependency_manager.dart';
import '../notifier/register_notifier.dart';
import '../state/register_state.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(
    userRepository,
    authRepository,
    addressesRepository,
    currenciesRepository,
  ),
);
