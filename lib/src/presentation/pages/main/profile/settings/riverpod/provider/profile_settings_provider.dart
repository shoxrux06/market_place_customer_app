import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/profile_settings_notifier.dart';
import '../state/profile_settings_state.dart';

final profileSettingsProvider =
    StateNotifierProvider.autoDispose<ProfileSettingsNotifier, ProfileSettingsState>(
  (ref) => ProfileSettingsNotifier(userRepository, galleryRepository),
);
