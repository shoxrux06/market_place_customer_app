import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/look_products_notifier.dart';
import '../state/look_products_state.dart';

final lookProductsProvider =
    StateNotifierProvider.autoDispose<LookProductsNotifier, LookProductsState>(
  (ref) => LookProductsNotifier(bannersRepository),
);
