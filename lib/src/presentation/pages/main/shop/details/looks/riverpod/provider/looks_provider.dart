import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/looks_notifier.dart';
import '../state/looks_state.dart';

final looksProvider =
    StateNotifierProvider.autoDispose<LooksNotifier, LooksState>(
  (ref) => LooksNotifier(bannersRepository),
);
