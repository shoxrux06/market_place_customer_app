import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/brands_notifier.dart';
import '../state/brands_state.dart';

final brandsProvider =
    StateNotifierProvider.autoDispose<BrandsNotifier, BrandsState>(
  (ref) => BrandsNotifier(brandsRepository),
);
