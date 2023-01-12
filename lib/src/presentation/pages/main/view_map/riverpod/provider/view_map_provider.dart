import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/di/dependency_manager.dart';
import '../notifier/view_map_notifier.dart';
import '../state/view_map_state.dart';

final viewMapProvider = StateNotifierProvider<ViewMapNotifier, ViewMapState>(
  (ref) => ViewMapNotifier(shopsRepository),
);
