import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/profitable_products_notifier.dart';
import '../state/profitable_products_state.dart';

final profitableProductsProvider = StateNotifierProvider.autoDispose<
    ProfitableProductsNotifier, ProfitableProductsState>(
  (ref) => ProfitableProductsNotifier(
    brandsRepository,
    productsRepository,
    categoriesRepository,
  ),
);
