import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/saved_locations_notifier.dart';
import '../state/saved_locations_state.dart';

final savedLocationsProvider =
    StateNotifierProvider<SavedLocationsNotifier, SavedLocationsState>(
  (ref) => SavedLocationsNotifier(addressesRepository),
);
