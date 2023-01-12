import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/saved_stores_notifier.dart';
import '../state/saved_stores_state.dart';

final savedStoresProvider =
    StateNotifierProvider<SavedStoresNotifier, SavedStoresState>(
  (ref) => SavedStoresNotifier(shopsRepository),
);
