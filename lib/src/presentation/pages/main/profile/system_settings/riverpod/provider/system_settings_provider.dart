import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/system_settings_notifier.dart';
import '../state/system_settings_state.dart';

final systemSettingsProvider =
    StateNotifierProvider<SystemSettingsNotifier, SystemSettingsState>(
  (ref) => SystemSettingsNotifier(currenciesRepository, userRepository),
);
